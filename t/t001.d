/+ dub.json: { "dependencies": { "zug-tap": "*", "libzip-d": { "path": "../" }  } } +/
void main() {
    import std.range : take;
    import std.random : Random, uniform;

    import zug.tap;
    import libzipd;
    import std.stdio: writeln;

    auto tap = Tap("t001.d");
    tap.verbose(true);
    string extract_to_path = make_temp_path();
    bool include_root = false;

    {
        auto archive = Archive("t/archive.zip");
        string[] entries_names = archive.list_entries;
        tap.ok( entries_names.length == 4, "number of entries in archive as expected");
        tap.ok( entries_names[0] == "archive/", "first entry in archive as expected");
        tap.ok( entries_names[$ - 1] == "archive/test.txt", "last entry in archive as expected");
        archive.close();
    }

    {
        import std.file : dirEntries, SpanMode, DirEntry;
        import std.array: array;
        import std.conv: to;

        Archive archive = Archive();
        archive.open("t/archive.zip");
        debug writeln(extract_to_path);
        archive.extract(extract_to_path);
        archive.close();
        DirEntry[] extracted = extract_to_path.dirEntries(SpanMode.depth).array;
        tap.ok(extracted.length == 4, "extracted the expected number of files/folders" );
    }

    {
        string new_archive_file_path = make_temp_path ~ ".zip";
        Archive archive = Archive();
        archive.create(new_archive_file_path);
        archive.add_folder(extract_to_path);
        archive.close();
        writeln(new_archive_file_path);
    }

    // string new_archive_path = make_temp_path() ~ ".zip";
    // {
    //     Archive archive = Archive();
    //     archive.password("asdf1234");
    //     archive.open(new_archive_path);
    //     archive.add_folder(extract_to_path);
    //     archive.zip();
    // }

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

string make_temp_path() {
    import std.file: tempDir;
    import std.path: buildPath;
    import std.uuid: randomUUID;

    return buildPath(tempDir, randomUUID().toString);
}