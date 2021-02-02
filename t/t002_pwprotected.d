/+ dub.json: { "dependencies": { "zug-tap": "*", "libzip-d": { "path": "../" }  } } +/

void main() {
    import zug.tap;
    import libzipd;

    import std.stdio: writeln, File, SEEK_CUR;

    debug import std.stdio: writeln;

    auto tap = Tap("t002_pwprotected.d");
    tap.verbose(true);

    auto info = File("t/libreoffice_test/EncryptionInfo", "rb");
    auto asdf = info.rawRead(new short[4]);
    // auto bar = info.rawRead(new short[1]);
    writeln("a ", asdf);

    auto alg_details = info.rawRead(new uint[6]);
    writeln(alg_details);
    uint encryption_header_size = alg_details[0];
    uint alg_id = alg_details[3];
    uint alg_id_hash = alg_details[4];
    uint key_bits = alg_details[5];
    writeln([ "alg_id": alg_id]);
    info.seek(encryption_header_size - 0x14, SEEK_CUR);
    auto salt_size = info.rawRead(new uint[1]);
    writeln(salt_size);
    auto salt = info.rawRead(new char[ salt_size[0] ]);
    writeln(salt);
    auto encrypted_verifier = info.rawRead(new char[16]);
    writeln(encrypted_verifier);
    auto verifier_hash_size = info.rawRead(new int[1]);
    writeln("verifier_hash_size ", verifier_hash_size);
    auto encrypted_verifier_hash = info.rawRead(new char[32]);
    writeln("encrypted verifier hash: ", encrypted_verifier_hash);
    info.close();

    string cipherAlgorithm;
    string hashAlgorithm;
    if (alg_id == 0x0000660E || alg_id == 0x0000660E || alg_id == 0x0000660E) {
        cipherAlgorithm = "AES";
    } else {
        import std.format: format;
        throw new Exception(format!"Unsupported encryption algorithm id: 0x%.8x"(alg_id));
    }

    if (alg_id_hash == 0x00008004) {
        hashAlgorithm = "SHA-1";
    } else {
        throw new Exception(format!"Unsuppoerted hash algorithm: 0x%.8x", alg_id_hash);
    }

    tap.done_testing();
    tap.report();
}

