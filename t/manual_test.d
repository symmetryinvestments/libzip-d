
import libzipd;

void main() {
    import std.stdio: writeln;

    string archive_path = "t/archive.zip";
    writeln("Starting");
    string[] result = list_entries(archive_path);
    writeln(" ............... done");
    string file_path = "t/add_to_archive_later.txt";
    add_file_to_archive(file_path, archive_path, false);
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


void add_file_to_archive(string file_path, string archive_path, int add_root_path) {
    import core.stdc.stdio: fopen;
    import core.stdc.errno;

    import core.stdc.string: strerror;
    import std.string: toStringz;
    import std.format: format;

    import std.path: baseName;

    zip_int64_t index;
    
    int error = 0;
    // https://libzip.org/documentation/zip_open.html
    zip_t * archive = zip_open(archive_path.toStringz, ZIP_CREATE, &error);

    if (error)  {
        throw new Exception(format!"could not open or create archive: '%s'"(strerror(error) ));
    }

    libzipd._IO_FILE* file_pointer = cast(libzipd._IO_FILE*) file_path.toStringz.fopen( "r" );
    if (file_pointer == NULL) {
        throw new Exception(format!"can't open input file '%s' %s"( file_path, strerror(errno) ));
    }
    
    ulong start = 0;
    long len = -1;
    zip_source_t *file_source = archive.zip_source_filep(file_pointer, start, len);
    if ( file_source  == NULL) {
        throw new Exception(format!"error creating file source for '%s': %s"( file_path, zip_strerror(archive) ) );
    }
                
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
    zip_close(archive);
    list_entries(archive_path);
}

/*
void extract_all(string destination_path, string zip_file_path)
    import std.string: toStringz;

    int errors = 0; 
    zip_t* archive = zip_open(zip_file_path.toStringz, ZIP_RDONLY, &errors);

    if (errors) {
        char buf[100];
        zip_error_to_str(buf, sizeof(buf), errors, errno);
        throw new Exception(format!"something wrong while opening zip archive `%s': %s"( zip_file_path, buf));
    }

    if (archive is null) {
        throw new Exception("archive is null");
    } 

        // printf("\n\n### before making destination dir %s\n", destination_path);
        make_destination_dir(destination_path);
        // printf("\n\n### after making destination dir %s\n", destination_path);
        
        int index;
        int number_of_entries = zip_get_num_entries(archive, ZIP_FL_UNCHANGED);
     
        for (index = 0; index < number_of_entries; index++) {
            
            zip_stat_t stats_buff;
            if (zip_stat_index(archive, index, 0, &stats_buff) != 0 ) {
                croak("cannot read the stats for index %i in archive %s", index, zip_file_path);
            }
            
            const char *file_name_string = zip_get_name(archive, index, ZIP_FL_ENC_GUESS);
            // printf("\n### file to extract %s\n\n", file_name_string);
            int name_length = strlen(file_name_string);            
            if (file_name_string[name_length - 1] == '/') {
                make_extracted_dir(destination_path, file_name_string);
            } else {
                zip_file_t *file_entry = zip_fopen_index(archive, index, 0);
                if (!file_entry) {
                    croak(" file %s cound not be opened", file_name_string);
                }
                
                int destination_file = open_destination_file_for_writing(destination_path, file_name_string);
                int sum = 0;
                char entry_buffer[1024];
                int read_length;
                ssize_t wrote_length;
                while (sum != stats_buff.size) {
                    read_length = zip_fread(file_entry, entry_buffer, 1024);
                    if (read_length < 0) {
                        croak("failed to read from archived file %s", file_name_string);
                    }
                    wrote_length = write(destination_file, entry_buffer, read_length);
                    if (wrote_length != read_length) {
                        croak("something wrong when writing file to disk: read length %i is not equal with write length%i\n", read_length, wrote_length);
                    }
                    sum += read_length;
                }
                close(destination_file);
                zip_fclose(file_entry);
            }
        }
        
    if (zip_close(archive) != 0) {
        croak("failed to close the archive");
    }
    
    // printf("### after closing the archive\n");
}
*/
