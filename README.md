# libzip-d

wrapper over libzip

## STATUS

Early beta, some testing done but only on the happy flow thus not enough.

Currently very much in development: to see what works look under t/.

The libzip headers were translated with
https://github.com/atilaneves/dpp .

The libzip version used was libzip-dev (1.5.1-0ubuntu1) as
distributed with Ubuntu 20.04.

It will build but will not work as expected under Ubuntu 18.04 (version 1.1.2-1.1 of libzip).

# SYNOPSIS

## Extract

    import libzipd;
    Archive archive = Archive();
    archive.open("t/archive.zip");
    archive.extract("/tmp/archive_extracted");
    archive.close();

## Create and add file

    import libzipd;
    Archive archive = Archive();
    archive.create(new_archive_file_path);
    archive.add_folder(extract_to_path);
    archive.add_file("/etc/fstab");
    // second argument is what should be removed from the path of
    //  the file, so it will add "fstab" to the root of the archive
    archive.add_file("/etc/fstab", "/etc/");
    archive.close();

# Extract password protected archive

    import libzipd;
    string temp_folder = Archive.make_temp_path();
    Archive archive = Archive();
    archive.open("t/archive_pass.zip");
    // first open then set password, else it will not work
    archive.set_password("asdf1234");
    archive.extract(temp_folder);

## Use the libzip api directly

libzipd.libziph is not exported by default so you must import it explicitly

    import libzipd.libziph;


# WHAT WORKS
  - create archive
  - add files or folders to archive
  - extract archive
  - extract password protected archive

# TODO
  - create password protected archive
  - better documentation

# HOW TO RUN THE TESTS

    $ pwd
    /work/libzip-d
    $ dub t/t001.d

