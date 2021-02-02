/+ dub.json: { "dependencies": { "zug-tap": "*", "libzip-d": { "path": "../" }  } } +/
void main() {

    import zug.tap;
    import libzipd;
    debug import std.stdio: writeln;

    auto tap = Tap("t001.d");
    tap.verbose(true);
    string extract_to_path = Archive.make_temp_path();


    {
        auto archive = Archive();
        archive.open("t/archive.zip");
        string[] entries_names = archive.list_entries;
        tap.ok( entries_names.length == 4, "number of entries in archive as expected");
        tap.ok( entries_names[0] == "archive/", "first entry in archive as expected");
        tap.ok( entries_names[$ - 1] == "archive/test.txt", "last entry in archive as expected");
        archive.close();
    }

    {

        import std.file : dirEntries, SpanMode, DirEntry;
        import std.array: array;

        Archive archive = Archive();
        writeln("before archive.open()");
        archive.open("t/archive.zip");

        writeln(extract_to_path);
        archive.extract(extract_to_path);
        archive.close();
        DirEntry[] extracted = extract_to_path.dirEntries(SpanMode.depth).array;
        writeln("after archive.open() and extract block");
        tap.ok(extracted.length == 4, "extracted the expected number of files/folders" );
    }

    {
        import std.path: buildPath;
        import std.stdio: writeln;

        string new_archive_file_path = Archive.make_temp_path() ~ ".zip";
        writeln(new_archive_file_path);
        Archive archive = Archive();
        archive.create(new_archive_file_path);
        archive.add_folder(extract_to_path);
        archive.add_file("/etc/fstab");
        archive.add_file("/etc/fstab", "/etc/");
        archive.close();
        archive.open(new_archive_file_path);
        string[] entries_names = archive.list_entries;
        writeln(entries_names);
        tap.ok( entries_names.length == 6, "number of entries in archive as expected");
        tap.ok( entries_names[0] == "archive/another_test.txt", "first entry in archive as expected");
        tap.ok( entries_names[$ - 1] == "fstab", "last entry in archive as expected");
        archive.close();
        debug writeln(new_archive_file_path);
    }

    string new_archive_path = Archive.make_temp_path() ~ ".zip";
    {
        import std.file: exists;

        string temp_folder = Archive.make_temp_path();
        writeln(temp_folder);

        Archive archive = Archive();
        archive.open("t/archive_pass.zip");
        // first open then set password, else it will not work
        archive.set_password("asdf1234");
        archive.extract(temp_folder);
        tap.ok((temp_folder ~ "/archive/test.txt").exists);
        archive.close();
    }

    {

        string in_path = "t/libreoffice_test.xlsx";
        string password = "asdf1234";
        string out_path = Archive.make_temp_path ~ ".xlsx";
        writeln([ in_path, password, out_path ]);
        strip_password(in_path, password, out_path);
    }

    // {
    //     string new_destination = make_temp_path();
    //     Archive archive = Archive();
    //     archive.password("asdf1234");
    //     archive.open(new_archive_path);
    //     archive.unzip(new_destination);

    //     import std.file: rmdirRecurse;
    //     new_destination.rmdirRecurse();
    // }

    tap.done_testing();
    tap.report();
}

