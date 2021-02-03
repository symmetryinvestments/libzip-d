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
        archive.open("t/archive.zip");
        archive.extract(extract_to_path);
        archive.close();
        DirEntry[] extracted = extract_to_path.dirEntries(SpanMode.depth).array;
        tap.ok(extracted.length == 4, "extracted the expected number of files/folders" );
    }

    {
        import std.path: buildPath;

        string new_archive_file_path = Archive.make_temp_path() ~ ".zip";
        Archive archive = Archive();
        archive.create(new_archive_file_path);
        archive.add_folder(extract_to_path);
        archive.add_file("/etc/fstab");
        archive.add_file("/etc/fstab", "/etc/");
        archive.close();
        archive.open(new_archive_file_path);
        string[] entries_names = archive.list_entries;
        tap.ok( entries_names.length == 6, "number of entries in archive as expected");
        tap.ok( entries_names[0] == "archive/another_test.txt", "first entry in archive as expected");
        tap.ok( entries_names[$ - 1] == "fstab", "last entry in archive as expected");
        archive.close();
    }

    string new_archive_path = Archive.make_temp_path() ~ ".zip";
    {
        import std.file: exists;
        import std.path: buildPath;

        string temp_folder = Archive.make_temp_path();
        Archive archive = Archive();
        archive.open("t/archive_pass.zip");
        // first open then set password, else it will not work
        archive.set_password("asdf1234");
        archive.extract(temp_folder);
        tap.ok((buildPath(temp_folder, "archive/test.txt")).exists, "test file found in extracted archive folder");
        archive.close();
    }

    tap.done_testing();
    tap.report();
}

