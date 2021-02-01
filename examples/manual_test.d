/+ dub.json: { "dependencies": { "libzip-d": { "path": "../" }  } } +/

import libzipd.libziph;

void main() {
    import std.stdio: writeln;

    string archive_path = "../t/archive.zip";
    writeln("Starting");
    string[] result = list_entries(archive_path);
    writeln(" ............... done");
    string file_path = "../t/add_to_archive_later.txt";
    add_to_archive(archive_path, file_path, false);
    string folder = "../source/";
    archive_folder(folder, "/tmp/test.zip", false);
    archive_folder(folder, "/tmp/test_with_root.zip", true);
}

string[] list_entries(string archive_path) {
    import std.stdio: writeln;
    import std.string: toStringz;
    import std.conv: to;


    int error = 0;
    // https://libzip.org/documentation/zip_open.html
    zip_t * archive = zip_open(archive_path.toStringz, ZIP_RDONLY, &error);

    if (error)  {
        new Exception("could not open or create archive");
    }

    long number_of_entries = archive.zip_get_num_entries(ZIP_FL_UNCHANGED);
    string[] result;
    for (int i = 0; i < number_of_entries; i++) {
        result ~=  archive.zip_get_name(i, ZIP_FL_ENC_GUESS).to!string;
    }
    writeln(result);
    return result;
}

void add_to_archive(zip_t* archive, string file_path, bool add_root_path) {
    import std.string: toStringz;
    import std.format: format;
    import core.stdc.errno;
    import core.stdc.string: strerror;
    import std.path: baseName;

    _IO_FILE* file_pointer = cast(_IO_FILE*) file_path.toStringz.fopen( "r" );
    if (file_pointer == NULL) {
        throw new Exception(format!"can't open input file '%s' %s"( file_path, strerror(errno) ));
    }

    ulong start = 0;
    long len = -1;
    zip_source_t *file_source = archive.zip_source_filep(file_pointer, start, len);
    if ( file_source  == NULL) {
        throw new Exception(format!"error creating file source for '%s': %s"( file_path, zip_strerror(archive) ) );
    }

    zip_int64_t index;
    if (add_root_path) {
        index = zip_file_add(archive, file_path.toStringz, file_source, ZIP_FL_OVERWRITE);
    } else {
        string file_basename = baseName(file_path);
        index = zip_file_add(archive, file_basename.toStringz, file_source, ZIP_FL_OVERWRITE);
    }

    long made_it = cast(long) index;
    if ( made_it == -1 ) {
        zip_source_free(file_source);
        throw new Exception(format!"failed to add file '%s': '%s'"( file_path, zip_strerror(archive)));
    }
}


void add_to_archive(string archive_path, string file_path, bool add_root_path) {
    import core.stdc.stdio: fopen;
    import core.stdc.errno;

    import core.stdc.string: strerror;
    import std.string: toStringz;
    import std.format: format;

    import std.path: baseName;

    int error = 0;
    // https://libzip.org/documentation/zip_open.html
    zip_t * archive = zip_open(archive_path.toStringz, ZIP_CREATE, &error);

    if (error)  {
        throw new Exception(format!"could not open or create archive: '%s'"(strerror(error) ));
    }

    add_to_archive(archive, file_path, add_root_path);

    zip_close(archive);
    list_entries(archive_path);
    extract_all("/tmp/test_archive", "../t/archive.zip");
}


void extract_all(string destination_path, string zip_file_path) {
    import std.string: toStringz;
    import core.stdc.errno;
    import core.stdc.string: strlen;
    import std.stdio: File;
    import std.format: format;
    import std.file: exists, mkdirRecurse;
    import std.path: buildPath;
    import std.conv: to;

    int errors = 0;
    zip_t* archive = zip_open(zip_file_path.toStringz, ZIP_RDONLY, &errors);

    if (errors) {
        char[100] buf;
        zip_error_to_str(buf.ptr, buf.length, errors, errno);
        throw new Exception(format!"something wrong while opening zip archive `%s': %s"( zip_file_path, buf));
    }

    if (archive is null) {
        throw new Exception("archive is null");
    }

    if (!exists(destination_path)) {
        mkdirRecurse(destination_path);
    }


    long number_of_entries = zip_get_num_entries(archive, ZIP_FL_UNCHANGED);

    for (long index = 0; index < number_of_entries; index++) {

            zip_stat_t stats_buff;
            if (zip_stat_index(archive, index, 0, &stats_buff) != 0 ) {
                throw new Exception(format!"cannot read the stats for index %d in archive %s"(index, zip_file_path) );
            }

            const char* file_name_string = zip_get_name(archive, index, ZIP_FL_ENC_GUESS);
            // printf("\n### file to extract %s\n\n", file_name_string);
            ulong name_length = strlen(file_name_string);
            if (file_name_string[name_length - 1] == '/') {
                string destination_path_full = destination_path.buildPath(file_name_string.to!string);
                if (!exists(destination_path_full)) {
                    destination_path_full.mkdirRecurse;
                }
            } else {
                zip_file_t *file_entry = zip_fopen_index(archive, index, 0);
                if (!file_entry) {
                    throw new Exception(format!"file %s cound not be opened"(file_name_string) );
                }
                string destination_path_full = destination_path.buildPath(file_name_string.to!string);
                File destination_file = File(destination_path_full, "wb");

                int sum = 0;
                char[1024] entry_buffer;
                size_t read_length;
                ssize_t wrote_length;
                while (sum != stats_buff.size) {
                    read_length = zip_fread(file_entry, entry_buffer.ptr, 1024);
                    if (read_length < 0) {
                        throw new Exception( format!"failed to read from archived file %s"(file_name_string) );
                    }
                    destination_file.rawWrite(entry_buffer[0..read_length]);
                    sum += read_length;
                }
                destination_file.close();
                zip_fclose(file_entry);
            }
        }

    if (zip_close(archive) != 0) {
        throw new Exception("failed to close the archive");
    }
}

void archive_folder(string path, string archive_path, bool add_root_path) {
    import std.string: toStringz;
    import std.format: format;
    import std.file: dirEntries, SpanMode;

    int level = 0;
    int error = 0;
    zip_t *archive = zip_open(archive_path.toStringz, ZIP_CREATE, &error);
    if (error) {
        throw new Exception(format!"failed to create the archive with path %s"(archive_path) );
    }

    if (add_root_path) {
        zip_int64_t first_index = zip_dir_add(archive, path.toStringz, ZIP_FL_ENC_UTF_8);
        if ( first_index == -1 ) {
            throw new Exception(format!"failed to add directory %s : %s"(path, zip_strerror(archive)));
        }
    }

    foreach (dir_entry; path.dirEntries(SpanMode.depth)) {
        add_to_archive(archive, dir_entry.name, add_root_path);
    }

    // walk_directory_recursive(path, level, archive, add_root_path);

    if (zip_close(archive) == -1) {
        throw new Exception("can't close zip archive");
    }
}

