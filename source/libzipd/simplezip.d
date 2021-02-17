module libzipd.simplezip;

import libzipd.libziph;
import std.string: toStringz;
import std.conv: to;
struct Archive
{
    zip_t* archive;

    this(string destination_file)
    {
        this.open(destination_file);
    }

    // set the default password after opening the archive
    // this works only for extracting files
    void set_password(string pass) {
        this.archive.zip_set_default_password(pass.toStringz);
    }

    void open(string destination_file)
    {
        import std.format : format;
        import core.stdc.errno;

        int errors = 0;
        this.archive = zip_open(destination_file.toStringz, ZIP_RDONLY, &errors);

        if (errors)
        {
            char[100] buf;
            zip_error_to_str(buf.ptr, buf.length, errors, errno);
            throw new Exception(format!"something wrong while opening zip archive `%s': %s"(destination_file,
                    buf));
        }

        if (archive is null)
        {
            throw new Exception("archive is null");
        }
    }

    void create(string destination_file)
    {
        import std.format : format;
        import core.stdc.errno;
        import std.file: exists;

        if (destination_file.exists()) {
            throw new Exception(format!"file %s already exists"(destination_file));
        }

        int errors = 0;
        this.archive = zip_open(destination_file.toStringz, ZIP_CREATE, &errors);

        if (errors)
        {
            char[100] buf;
            zip_error_to_str(buf.ptr, buf.length, errors, errno);
            throw new Exception(format!"something wrong while opening zip archive `%s': %s"(destination_file,
                    buf));
        }

        if (archive is null)
        {
            throw new Exception("archive is null");
        }
    }

    string[] list_entries()
    {
        import std.conv : to;

        long number_of_entries = this.entries_count();
        string[] result;
        for (int i = 0; i < number_of_entries; i++)
        {
            result ~= archive.zip_get_name(i, ZIP_FL_ENC_UTF_8).to!string;
        }

        return result;
    }

    void add_folder(string path) {
        import std.format : format;
        import std.file : dirEntries, SpanMode;
        import std.path: relativePath;

        // add only the folders under the one in the arguments
        string strip_path = path;

        foreach (dir_entry; path.dirEntries(SpanMode.depth)) {
            if (dir_entry.isDir) {
                string stripped_path = dir_entry.name.relativePath(strip_path);
                zip_int64_t first_index;
                first_index = this.archive.zip_dir_add(stripped_path.toStringz, ZIP_FL_ENC_UTF_8);

                if ( first_index == -1 ) {
                    throw new Exception(format!"failed to add directory %s : %s"(path, zip_strerror(this.archive)));
                }
            }
            else if (dir_entry.isFile)
            {
                this.add_file(dir_entry.name, strip_path);
            }
            else
            {
                // TODO deal with symlinks
                throw new Exception(
                        "adding something that is not a normal file nor a folder is not supported");
            }
        }
    }

    void add_file(string file_path, string strip_path = "") {
        import std.format : format;
        import core.stdc.errno;
        import core.stdc.string : strerror;
        import std.path : baseName, relativePath;

        libzipd.libziph._IO_FILE* file_pointer = cast(libzipd.libziph._IO_FILE*) file_path.toStringz.fopen("r");
        if (file_pointer is null)
        {
            throw new Exception(format!"can't open input file '%s' %s"(file_path, strerror(errno)));
        }

        ulong start = 0;
        long len = -1;
        zip_source_t* file_source = archive.zip_source_filep(file_pointer, start, len);
        if (file_source is null)
        {
            throw new Exception(format!"error creating file source for '%s': %s"(file_path,
                    zip_strerror(archive)));
        }

        zip_int64_t index;
        if (strip_path != "") {
            index = zip_file_add(archive, file_path.relativePath(strip_path).toStringz, file_source, ZIP_FL_OVERWRITE);
        } else {
           index = zip_file_add(archive, file_path.toStringz, file_source, ZIP_FL_OVERWRITE);
        }

        if (index == -1)
        {
            zip_source_free(file_source);
            throw new Exception(format!"failed to add file '%s': '%s'"(file_path,
                    zip_strerror(archive)));
        }
    }

    void extract(string destination_path)
    {
        import core.stdc.errno;
        import core.stdc.string : strlen;
        import std.stdio : File;
        import std.format : format;
        import std.file : exists, mkdirRecurse;
        import std.path : buildPath, dirName;
        import std.conv : to;

        if (!exists(destination_path))
        {
            mkdirRecurse(destination_path);
        }

        long number_of_entries = this.entries_count();

        for (long index = 0; index < number_of_entries; index++)
        {
            zip_stat_t stats_buff;
            if (zip_stat_index(this.archive, index, 0, &stats_buff) != 0)
            {
                throw new Exception( format!"cannot read the stats for index %d"(index) );
            }

            const char* file_name_string = zip_get_name(this.archive, index, ZIP_FL_ENC_UTF_8);
            // printf("\n### file to extract %s\n\n", file_name_string);
            ulong name_length = strlen(file_name_string);
            if (file_name_string[name_length - 1] == '/')
            {
                string destination_path_full = destination_path.buildPath(file_name_string.to!string);
                if (!exists(destination_path_full)) {
                    destination_path_full.mkdirRecurse;
                }
            }
            else
            {
                zip_file_t* file_entry = zip_fopen_index(this.archive, index, 0);
                if (file_entry is null) {
                    throw new Exception(format!"file %s could not be opened: %s"(file_name_string.to!string, zip_strerror(this.archive).to!string ));
                }
                string destination_path_full = destination_path.buildPath(file_name_string.to!string);
                if(!destination_path_full.dirName.exists) {
                    destination_path_full.dirName.mkdirRecurse();
                }
                File destination_file = File(destination_path_full, "wb");

                int sum = 0;
                char[1024] entry_buffer;
                size_t read_length;
                ssize_t wrote_length;
                while (sum != stats_buff.size)
                {
                    read_length = zip_fread(file_entry, entry_buffer.ptr, 1024);
                    if (read_length < 0)
                    {
                        throw new Exception(
                                format!"failed to read from archived file %s"(file_name_string));
                    }
                    destination_file.rawWrite(entry_buffer[0 .. read_length]);
                    sum += read_length;
                }
                destination_file.close();
                zip_fclose(file_entry);
            }
        }

        if (zip_close(archive) != 0)
        {
            throw new Exception("failed to close the archive");
        }
    }

    void finish() {
        this.archive.zip_close();
    }

    void close() {
        zip_close(this.archive);
    }

    void discard() {
        this.archive.zip_discard();
    }

    void revert(){
        this.archive.zip_unchange_all();
    }

    long entries_count() {
        return zip_get_num_entries(this.archive, ZIP_FL_UNCHANGED);
    }

    static string make_temp_path() {
        import std.file: tempDir;
        import std.path: buildPath;
        import std.uuid: randomUUID;

        return buildPath(tempDir, "libzipd_temp", randomUUID().toString);
    }
}

