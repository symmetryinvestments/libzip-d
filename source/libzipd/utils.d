module libzipd.utils;

import libzipd;

void strip_password(string in_path, string password, string out_path) {
    Archive in_zip = Archive();
    Archive out_zip = Archive();

    string temp_folder = Archive.make_temp_path();
    in_zip.open(in_path);
    in_zip.set_password(password);
    in_zip.extract(temp_folder);
    in_zip.close();

    out_zip.create(out_path);
    out_zip.add_folder(temp_folder);
    out_zip.close();
}
