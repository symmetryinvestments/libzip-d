module libzipd.libziph;


/*

Generated with dpp (https://github.com/atilaneves/dpp)
beautified with dfmt

generated on Linux Mint 20 on January 23 2021 using:
// Package: libzip-dev
// Architecture: amd64
// Version: 1.5.1-0ubuntu1
// Multi-Arch: same
// Priority: optional
// Section: universe/libdevel
// Source: libzip
// Origin: Ubuntu
// Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
// Original-Maintainer: Stefan Schörghofer <amd1212@4md.gr>

*/
import core.stdc.config;
import core.stdc.stdarg : va_list;
static import core.simd;
static import std.conv;

struct Int128
{
    long lower;
    long upper;
}

struct UInt128
{
    ulong lower;
    ulong upper;
}

struct __locale_data
{
    int dummy;
}

alias _Bool = bool;
struct dpp
{
    static struct Opaque(int N)
    {
        void[N] bytes;
    }

    static bool isEmpty(T)()
    {
        return T.tupleof.length == 0;
    }

    static struct Move(T)
    {
        T* ptr;
    }

    static auto move(T)(ref T value)
    {
        return Move!T(&value);
    }

    mixin template EnumD(string name, T, string prefix) if (is(T == enum))
    {
        private static string _memberMixinStr(string member)
        {
            import std.conv : text;
            import std.array : replace;

            return text(` `, member.replace(prefix, ""), ` = `, T.stringof, `.`, member, `,`);
        }

        private static string _enumMixinStr()
        {
            import std.array : join;

            string[] ret;
            ret ~= "enum " ~ name ~ "{";
            static foreach (member; __traits(allMembers, T))
            {
                ret ~= _memberMixinStr(member);
            }
            ret ~= "}";
            return ret.join("\n");
        }

        mixin(_enumMixinStr());
    }
}

extern (C)
{
    alias size_t = c_ulong;
    alias zip_uint64_t = c_ulong;
    alias zip_int64_t = c_long;
    alias zip_uint32_t = uint;
    alias zip_int32_t = int;
    alias zip_uint16_t = ushort;
    alias zip_int16_t = short;
    alias zip_uint8_t = ubyte;
    alias zip_int8_t = byte;
    int zip_unchange_archive(zip*) @nogc nothrow;
    int zip_unchange_all(zip*) @nogc nothrow;
    int zip_unchange(zip*, c_ulong) @nogc nothrow;
    const(char)* zip_strerror(zip*) @nogc nothrow;
    void zip_stat_init(zip_stat*) @nogc nothrow;
    int zip_stat_index(zip*, c_ulong, uint, zip_stat*) @nogc nothrow;
    pragma(mangle, "zip_stat") int zip_stat_(zip*, const(char)*, uint, zip_stat*) @nogc nothrow;
    zip_source* zip_source_zip(zip*, zip*, c_ulong, uint, c_ulong, c_long) @nogc nothrow;
    c_long zip_source_write(zip_source*, const(void)*, c_ulong) @nogc nothrow;
    c_long zip_source_tell_write(zip_source*) @nogc nothrow;
    c_long zip_source_tell(zip_source*) @nogc nothrow;
    int zip_source_stat(zip_source*, zip_stat*) @nogc nothrow;
    int zip_source_seek_write(zip_source*, c_long, int) @nogc nothrow;
    c_long zip_source_seek_compute_offset(c_ulong, c_ulong, void*, c_ulong, zip_error*) @nogc nothrow;
    int zip_source_seek(zip_source*, c_long, int) @nogc nothrow;
    void zip_source_rollback_write(zip_source*) @nogc nothrow;
    c_long zip_source_read(zip_source*, void*, c_ulong) @nogc nothrow;
    int zip_source_open(zip_source*) @nogc nothrow;
    c_long zip_source_make_command_bitmap(zip_source_cmd, ...) @nogc nothrow;
    void zip_source_keep(zip_source*) @nogc nothrow;
    int zip_source_is_deleted(zip_source*) @nogc nothrow;
    zip_source* zip_source_function_create(c_long function(void*, void*,
            c_ulong, zip_source_cmd), void*, zip_error*) @nogc nothrow;
    zip_source* zip_source_function(zip*, c_long function(void*, void*,
            c_ulong, zip_source_cmd), void*) @nogc nothrow;
    void zip_source_free(zip_source*) @nogc nothrow;
    zip_source* zip_source_filep_create(_IO_FILE*, c_ulong, c_long, zip_error*) @nogc nothrow;
    zip_source* zip_source_filep(zip*, _IO_FILE*, c_ulong, c_long) @nogc nothrow;
    zip_source* zip_source_file_create(const(char)*, c_ulong, c_long, zip_error*) @nogc nothrow;
    zip_source* zip_source_file(zip*, const(char)*, c_ulong, c_long) @nogc nothrow;
    zip_error* zip_source_error(zip_source*) @nogc nothrow;
    int zip_source_commit_write(zip_source*) @nogc nothrow;
    int zip_source_close(zip_source*) @nogc nothrow;
    zip_source* zip_source_buffer_fragment_create(const(zip_buffer_fragment)*,
            c_ulong, int, zip_error*) @nogc nothrow;
    zip_source* zip_source_buffer_fragment(zip*, const(zip_buffer_fragment)*, c_ulong, int) @nogc nothrow;
    zip_source* zip_source_buffer_create(const(void)*, c_ulong, int, zip_error*) @nogc nothrow;
    zip_source* zip_source_buffer(zip*, const(void)*, c_ulong, int) @nogc nothrow;
    int zip_source_begin_write_cloning(zip_source*, c_ulong) @nogc nothrow;
    int zip_source_begin_write(zip_source*) @nogc nothrow;
    int zip_set_file_compression(zip*, c_ulong, int, uint) @nogc nothrow;
    int zip_set_default_password(zip*, const(char)*) @nogc nothrow;
    int zip_set_archive_flag(zip*, uint, int) @nogc nothrow;
    int zip_set_archive_comment(zip*, const(char)*, ushort) @nogc nothrow;
    int zip_register_progress_callback_with_state(zip*, double,
            void function(zip*, double, void*), void function(void*), void*) @nogc nothrow;
    zip* zip_open_from_source(zip_source*, int, zip_error*) @nogc nothrow;
    zip* zip_open(const(char)*, int, int*) @nogc nothrow;
    c_long zip_name_locate(zip*, const(char)*, uint) @nogc nothrow;
    const(char)* zip_libzip_version() @nogc nothrow;
    c_long zip_get_num_entries(zip*, uint) @nogc nothrow;
    const(char)* zip_get_name(zip*, c_ulong, uint) @nogc nothrow;
    int zip_get_archive_flag(zip*, uint, uint) @nogc nothrow;
    const(char)* zip_get_archive_comment(zip*, int*, uint) @nogc nothrow;
    c_long zip_ftell(zip_file*) @nogc nothrow;
    byte zip_fseek(zip_file*, c_long, int) @nogc nothrow;
    c_long zip_fread(zip_file*, void*, c_ulong) @nogc nothrow;
    zip_file* zip_fopen_index_encrypted(zip*, c_ulong, uint, const(char)*) @nogc nothrow;
    zip_file* zip_fopen_index(zip*, c_ulong, uint) @nogc nothrow;
    zip_file* zip_fopen_encrypted(zip*, const(char)*, uint, const(char)*) @nogc nothrow;
    zip_file* zip_fopen(zip*, const(char)*, uint) @nogc nothrow;
    const(char)* zip_file_strerror(zip_file*) @nogc nothrow;
    int zip_file_set_mtime(zip*, c_ulong, c_long, uint) @nogc nothrow;
    int zip_file_set_external_attributes(zip*, c_ulong, uint, ubyte, uint) @nogc nothrow;
    int zip_file_set_encryption(zip*, c_ulong, ushort, const(char)*) @nogc nothrow;
    int zip_file_set_comment(zip*, c_ulong, const(char)*, ushort, uint) @nogc nothrow;
    int zip_file_replace(zip*, c_ulong, zip_source*, uint) @nogc nothrow;
    int zip_file_rename(zip*, c_ulong, const(char)*, uint) @nogc nothrow;
    int zip_file_get_external_attributes(zip*, c_ulong, uint, ubyte*, uint*) @nogc nothrow;
    zip_error* zip_file_get_error(zip_file*) @nogc nothrow;
    const(char)* zip_file_get_comment(zip*, c_ulong, uint*, uint) @nogc nothrow;
    const(ubyte)* zip_file_extra_field_get_by_id(zip*, c_ulong, ushort, ushort, ushort*, uint) @nogc nothrow;
    const(ubyte)* zip_file_extra_field_get(zip*, c_ulong, ushort, ushort*, ushort*, uint) @nogc nothrow;
    short zip_file_extra_fields_count_by_id(zip*, c_ulong, ushort, uint) @nogc nothrow;
    short zip_file_extra_fields_count(zip*, c_ulong, uint) @nogc nothrow;
    int zip_file_extra_field_set(zip*, c_ulong, ushort, ushort, const(ubyte)*, ushort, uint) @nogc nothrow;
    int zip_file_extra_field_delete_by_id(zip*, c_ulong, ushort, ushort, uint) @nogc nothrow;
    int zip_file_extra_field_delete(zip*, c_ulong, ushort, uint) @nogc nothrow;
    void zip_file_error_clear(zip_file*) @nogc nothrow;
    c_long zip_file_add(zip*, const(char)*, zip_source*, uint) @nogc nothrow;
    zip* zip_fdopen(int, int, int*) @nogc nothrow;
    int zip_fclose(zip_file*) @nogc nothrow;
    c_long zip_error_to_data(const(zip_error)*, void*, c_ulong) @nogc nothrow;
    int zip_error_system_type(const(zip_error)*) @nogc nothrow;
    const(char)* zip_error_strerror(zip_error*) @nogc nothrow;
    void zip_error_set(zip_error*, int, int) @nogc nothrow;
    void zip_error_init_with_code(zip_error*, int) @nogc nothrow;
    void zip_error_init(zip_error*) @nogc nothrow;
    void zip_error_fini(zip_error*) @nogc nothrow;
    int zip_error_code_system(const(zip_error)*) @nogc nothrow;
    int zip_error_code_zip(const(zip_error)*) @nogc nothrow;
    void zip_error_clear(zip*) @nogc nothrow;
    zip_error* zip_get_error(zip*) @nogc nothrow;
    void zip_discard(zip*) @nogc nothrow;
    c_long zip_dir_add(zip*, const(char)*, uint) @nogc nothrow;
    int zip_delete(zip*, c_ulong) @nogc nothrow;
    int zip_close(zip*) @nogc nothrow;
    void zip_file_error_get(zip_file*, int*, int*) @nogc nothrow;
    int zip_error_to_str(char*, c_ulong, int, int) @nogc nothrow;
    void zip_error_get(zip*, int*, int*) @nogc nothrow;
    int zip_error_get_sys_type(int) @nogc nothrow;
    int zip_set_file_comment(zip*, c_ulong, const(char)*, int) @nogc nothrow;
    int zip_replace(zip*, c_ulong, zip_source*) @nogc nothrow;
    int zip_rename(zip*, c_ulong, const(char)*) @nogc nothrow;
    int zip_get_num_files(zip*) @nogc nothrow;
    const(char)* zip_get_file_comment(zip*, c_ulong, int*, int) @nogc nothrow;
    c_long zip_add_dir(zip*, const(char)*) @nogc nothrow;
    c_long zip_add(zip*, const(char)*, zip_source*) @nogc nothrow;
    void zip_register_progress_callback(zip*, void function(double)) @nogc nothrow;
    alias zip_progress_callback_t = void function(double);
    alias zip_progress_callback = void function(zip*, double, void*);
    alias zip_source_callback = c_long function(void*, void*, c_ulong, zip_source_cmd);
    alias zip_flags_t = uint;
    alias zip_buffer_fragment_t = zip_buffer_fragment;
    alias zip_stat_t = zip_stat;
    alias zip_source_t = zip_source;
    alias zip_file_t = zip_file;
    alias zip_error_t = zip_error;
    alias zip_t = zip;
    struct zip_source;
    struct zip_file;
    struct zip;
    struct zip_buffer_fragment
    {
        ubyte* data;
        c_ulong length;
    }

    struct zip_stat
    {
        c_ulong valid;
        const(char)* name;
        c_ulong index;
        c_ulong size;
        c_ulong comp_size;
        c_long mtime;
        uint crc;
        ushort comp_method;
        ushort encryption_method;
        uint flags;
    }

    struct zip_error
    {
        int zip_err;
        int sys_err;
        char* str;
    }

    alias zip_source_args_seek_t = zip_source_args_seek;
    struct zip_source_args_seek
    {
        c_long offset;
        int whence;
    }

    alias zip_source_cmd_t = zip_source_cmd;
    enum zip_source_cmd
    {
        ZIP_SOURCE_OPEN = 0,
        ZIP_SOURCE_READ = 1,
        ZIP_SOURCE_CLOSE = 2,
        ZIP_SOURCE_STAT = 3,
        ZIP_SOURCE_ERROR = 4,
        ZIP_SOURCE_FREE = 5,
        ZIP_SOURCE_SEEK = 6,
        ZIP_SOURCE_TELL = 7,
        ZIP_SOURCE_BEGIN_WRITE = 8,
        ZIP_SOURCE_COMMIT_WRITE = 9,
        ZIP_SOURCE_ROLLBACK_WRITE = 10,
        ZIP_SOURCE_WRITE = 11,
        ZIP_SOURCE_SEEK_WRITE = 12,
        ZIP_SOURCE_TELL_WRITE = 13,
        ZIP_SOURCE_SUPPORTS = 14,
        ZIP_SOURCE_REMOVE = 15,
        ZIP_SOURCE_GET_COMPRESSION_FLAGS = 16,
        ZIP_SOURCE_BEGIN_WRITE_CLONING = 17,
    }

    enum ZIP_SOURCE_OPEN = zip_source_cmd.ZIP_SOURCE_OPEN;
    enum ZIP_SOURCE_READ = zip_source_cmd.ZIP_SOURCE_READ;
    enum ZIP_SOURCE_CLOSE = zip_source_cmd.ZIP_SOURCE_CLOSE;
    enum ZIP_SOURCE_STAT = zip_source_cmd.ZIP_SOURCE_STAT;
    enum ZIP_SOURCE_ERROR = zip_source_cmd.ZIP_SOURCE_ERROR;
    enum ZIP_SOURCE_FREE = zip_source_cmd.ZIP_SOURCE_FREE;
    enum ZIP_SOURCE_SEEK = zip_source_cmd.ZIP_SOURCE_SEEK;
    enum ZIP_SOURCE_TELL = zip_source_cmd.ZIP_SOURCE_TELL;
    enum ZIP_SOURCE_BEGIN_WRITE = zip_source_cmd.ZIP_SOURCE_BEGIN_WRITE;
    enum ZIP_SOURCE_COMMIT_WRITE = zip_source_cmd.ZIP_SOURCE_COMMIT_WRITE;
    enum ZIP_SOURCE_ROLLBACK_WRITE = zip_source_cmd.ZIP_SOURCE_ROLLBACK_WRITE;
    enum ZIP_SOURCE_WRITE = zip_source_cmd.ZIP_SOURCE_WRITE;
    enum ZIP_SOURCE_SEEK_WRITE = zip_source_cmd.ZIP_SOURCE_SEEK_WRITE;
    enum ZIP_SOURCE_TELL_WRITE = zip_source_cmd.ZIP_SOURCE_TELL_WRITE;
    enum ZIP_SOURCE_SUPPORTS = zip_source_cmd.ZIP_SOURCE_SUPPORTS;
    enum ZIP_SOURCE_REMOVE = zip_source_cmd.ZIP_SOURCE_REMOVE;
    enum ZIP_SOURCE_GET_COMPRESSION_FLAGS = zip_source_cmd.ZIP_SOURCE_GET_COMPRESSION_FLAGS;
    enum ZIP_SOURCE_BEGIN_WRITE_CLONING = zip_source_cmd.ZIP_SOURCE_BEGIN_WRITE_CLONING;
    alias fsfilcnt_t = c_ulong;
    alias fsblkcnt_t = c_ulong;
    alias blkcnt_t = c_long;
    alias blksize_t = c_long;
    alias register_t = c_long;
    alias u_int64_t = c_ulong;
    alias u_int32_t = uint;
    alias u_int16_t = ushort;
    alias u_int8_t = ubyte;
    alias key_t = int;
    alias caddr_t = char*;
    alias daddr_t = int;
    alias id_t = uint;
    alias pid_t = int;
    alias uid_t = uint;
    alias nlink_t = c_ulong;
    alias mode_t = uint;
    alias gid_t = uint;
    alias dev_t = c_ulong;
    alias ino_t = c_ulong;
    alias loff_t = c_long;
    alias fsid_t = __fsid_t;
    alias u_quad_t = c_ulong;
    alias quad_t = c_long;
    alias u_long = c_ulong;
    alias u_int = uint;
    alias u_short = ushort;
    alias u_char = ubyte;
    int pselect(int, fd_set*, fd_set*, fd_set*, const(timespec)*, const(__sigset_t)*) @nogc nothrow;
    int select(int, fd_set*, fd_set*, fd_set*, timeval*) @nogc nothrow;
    alias fd_mask = c_long;
    struct fd_set
    {
        c_long[16] __fds_bits;
    }

    alias __fd_mask = c_long;
    alias suseconds_t = c_long;
    alias int_least8_t = byte;
    alias int_least16_t = short;
    alias int_least32_t = int;
    alias int_least64_t = c_long;
    alias uint_least8_t = ubyte;
    alias uint_least16_t = ushort;
    alias uint_least32_t = uint;
    alias uint_least64_t = c_ulong;
    alias int_fast8_t = byte;
    alias int_fast16_t = c_long;
    alias int_fast32_t = c_long;
    alias int_fast64_t = c_long;
    alias uint_fast8_t = ubyte;
    alias uint_fast16_t = c_ulong;
    alias uint_fast32_t = c_ulong;
    alias uint_fast64_t = c_ulong;
    alias intptr_t = c_long;
    alias uintptr_t = c_ulong;
    alias intmax_t = c_long;
    alias uintmax_t = c_ulong;
    static c_ulong __uint64_identity(c_ulong) @nogc nothrow;
    static uint __uint32_identity(uint) @nogc nothrow;
    static ushort __uint16_identity(ushort) @nogc nothrow;
    alias timer_t = void*;
    alias time_t = c_long;
    struct tm
    {
        int tm_sec;
        int tm_min;
        int tm_hour;
        int tm_mday;
        int tm_mon;
        int tm_year;
        int tm_wday;
        int tm_yday;
        int tm_isdst;
        c_long tm_gmtoff;
        const(char)* tm_zone;
    }

    struct timeval
    {
        c_long tv_sec;
        c_long tv_usec;
    }

    struct timespec
    {
        c_long tv_sec;
        c_long tv_nsec;
    }

    struct itimerspec
    {
        timespec it_interval;
        timespec it_value;
    }

    alias _IO_lock_t = void;
    struct _IO_wide_data;
    struct _IO_codecvt;
    struct _IO_marker;
    alias sigset_t = __sigset_t;
    alias locale_t = __locale_struct*;
    alias clockid_t = int;
    alias clock_t = c_long;
    alias off_t = c_long;
    alias ssize_t = c_long;
    struct __sigset_t
    {
        c_ulong[16] __val;
    }

    alias fpos_t = _G_fpos_t;
    struct __mbstate_t
    {
        int __count;
        static union _Anonymous_0
        {
            uint __wch;
            char[4] __wchb;
        }

        _Anonymous_0 __value;
    }

    alias __locale_t = __locale_struct*;
    struct __locale_struct
    {
        __locale_data*[13] __locales;
        const(ushort)* __ctype_b;
        const(int)* __ctype_tolower;
        const(int)* __ctype_toupper;
        const(char)*[13] __names;
    }

    struct _G_fpos_t
    {
        c_long __pos;
        __mbstate_t __state;
    }

    alias __fpos_t = _G_fpos_t;
    extern __gshared _IO_FILE* stdin;
    extern __gshared _IO_FILE* stdout;
    extern __gshared _IO_FILE* stderr;
    struct _G_fpos64_t
    {
        c_long __pos;
        __mbstate_t __state;
    }

    alias __fpos64_t = _G_fpos64_t;
    int remove(const(char)*) @nogc nothrow;
    int rename(const(char)*, const(char)*) @nogc nothrow;
    int renameat(int, const(char)*, int, const(char)*) @nogc nothrow;
    _IO_FILE* tmpfile() @nogc nothrow;
    char* tmpnam(char*) @nogc nothrow;
    char* tmpnam_r(char*) @nogc nothrow;
    char* tempnam(const(char)*, const(char)*) @nogc nothrow;
    int fclose(_IO_FILE*) @nogc nothrow;
    int fflush(_IO_FILE*) @nogc nothrow;
    int fflush_unlocked(_IO_FILE*) @nogc nothrow;
    _IO_FILE* fopen(const(char)*, const(char)*) @nogc nothrow;
    _IO_FILE* freopen(const(char)*, const(char)*, _IO_FILE*) @nogc nothrow;
    _IO_FILE* fdopen(int, const(char)*) @nogc nothrow;
    _IO_FILE* fmemopen(void*, c_ulong, const(char)*) @nogc nothrow;
    _IO_FILE* open_memstream(char**, c_ulong*) @nogc nothrow;
    void setbuf(_IO_FILE*, char*) @nogc nothrow;
    int setvbuf(_IO_FILE*, char*, int, c_ulong) @nogc nothrow;
    void setbuffer(_IO_FILE*, char*, c_ulong) @nogc nothrow;
    void setlinebuf(_IO_FILE*) @nogc nothrow;
    int fprintf(_IO_FILE*, const(char)*, ...) @nogc nothrow;
    int printf(const(char)*, ...) @nogc nothrow;
    int sprintf(char*, const(char)*, ...) @nogc nothrow;
    int vfprintf(_IO_FILE*, const(char)*, va_list*) @nogc nothrow;
    int vprintf(const(char)*, va_list*) @nogc nothrow;
    int vsprintf(char*, const(char)*, va_list*) @nogc nothrow;
    int snprintf(char*, c_ulong, const(char)*, ...) @nogc nothrow;
    int vsnprintf(char*, c_ulong, const(char)*, va_list*) @nogc nothrow;
    int vdprintf(int, const(char)*, va_list*) @nogc nothrow;
    int dprintf(int, const(char)*, ...) @nogc nothrow;
    int fscanf(_IO_FILE*, const(char)*, ...) @nogc nothrow;
    int scanf(const(char)*, ...) @nogc nothrow;
    int sscanf(const(char)*, const(char)*, ...) @nogc nothrow;
    int vfscanf(_IO_FILE*, const(char)*, va_list*) @nogc nothrow;
    int vscanf(const(char)*, va_list*) @nogc nothrow;
    int vsscanf(const(char)*, const(char)*, va_list*) @nogc nothrow;
    int fgetc(_IO_FILE*) @nogc nothrow;
    int getc(_IO_FILE*) @nogc nothrow;
    int getchar() @nogc nothrow;
    int getc_unlocked(_IO_FILE*) @nogc nothrow;
    int getchar_unlocked() @nogc nothrow;
    int fgetc_unlocked(_IO_FILE*) @nogc nothrow;
    int fputc(int, _IO_FILE*) @nogc nothrow;
    int putc(int, _IO_FILE*) @nogc nothrow;
    int putchar(int) @nogc nothrow;
    int fputc_unlocked(int, _IO_FILE*) @nogc nothrow;
    int putc_unlocked(int, _IO_FILE*) @nogc nothrow;
    int putchar_unlocked(int) @nogc nothrow;
    int getw(_IO_FILE*) @nogc nothrow;
    int putw(int, _IO_FILE*) @nogc nothrow;
    char* fgets(char*, int, _IO_FILE*) @nogc nothrow;
    c_long __getdelim(char**, c_ulong*, int, _IO_FILE*) @nogc nothrow;
    c_long getdelim(char**, c_ulong*, int, _IO_FILE*) @nogc nothrow;
    c_long getline(char**, c_ulong*, _IO_FILE*) @nogc nothrow;
    int fputs(const(char)*, _IO_FILE*) @nogc nothrow;
    int puts(const(char)*) @nogc nothrow;
    int ungetc(int, _IO_FILE*) @nogc nothrow;
    c_ulong fread(void*, c_ulong, c_ulong, _IO_FILE*) @nogc nothrow;
    c_ulong fwrite(const(void)*, c_ulong, c_ulong, _IO_FILE*) @nogc nothrow;
    c_ulong fread_unlocked(void*, c_ulong, c_ulong, _IO_FILE*) @nogc nothrow;
    c_ulong fwrite_unlocked(const(void)*, c_ulong, c_ulong, _IO_FILE*) @nogc nothrow;
    int fseek(_IO_FILE*, c_long, int) @nogc nothrow;
    c_long ftell(_IO_FILE*) @nogc nothrow;
    void rewind(_IO_FILE*) @nogc nothrow;
    int fseeko(_IO_FILE*, c_long, int) @nogc nothrow;
    c_long ftello(_IO_FILE*) @nogc nothrow;
    int fgetpos(_IO_FILE*, _G_fpos_t*) @nogc nothrow;
    int fsetpos(_IO_FILE*, const(_G_fpos_t)*) @nogc nothrow;
    void clearerr(_IO_FILE*) @nogc nothrow;
    int feof(_IO_FILE*) @nogc nothrow;
    int ferror(_IO_FILE*) @nogc nothrow;
    void clearerr_unlocked(_IO_FILE*) @nogc nothrow;
    int feof_unlocked(_IO_FILE*) @nogc nothrow;
    int ferror_unlocked(_IO_FILE*) @nogc nothrow;
    void perror(const(char)*) @nogc nothrow;
    int fileno(_IO_FILE*) @nogc nothrow;
    int fileno_unlocked(_IO_FILE*) @nogc nothrow;
    _IO_FILE* popen(const(char)*, const(char)*) @nogc nothrow;
    int pclose(_IO_FILE*) @nogc nothrow;
    char* ctermid(char*) @nogc nothrow;
    void flockfile(_IO_FILE*) @nogc nothrow;
    int ftrylockfile(_IO_FILE*) @nogc nothrow;
    void funlockfile(_IO_FILE*) @nogc nothrow;
    int __uflow(_IO_FILE*) @nogc nothrow;
    int __overflow(_IO_FILE*, int) @nogc nothrow;
    alias __FILE = _IO_FILE;
    struct sigevent;
    struct _IO_FILE
    {
        int _flags;
        char* _IO_read_ptr;
        char* _IO_read_end;
        char* _IO_read_base;
        char* _IO_write_base;
        char* _IO_write_ptr;
        char* _IO_write_end;
        char* _IO_buf_base;
        char* _IO_buf_end;
        char* _IO_save_base;
        char* _IO_backup_base;
        char* _IO_save_end;
        _IO_marker* _markers;
        _IO_FILE* _chain;
        int _fileno;
        int _flags2;
        c_long _old_offset;
        ushort _cur_column;
        byte _vtable_offset;
        char[1] _shortbuf;
        void* _lock;
        c_long _offset;
        _IO_codecvt* _codecvt;
        _IO_wide_data* _wide_data;
        _IO_FILE* _freeres_list;
        void* _freeres_buf;
        c_ulong __pad5;
        int _mode;
        char[20] _unused2;
    }

    c_long clock() @nogc nothrow;
    c_long time(c_long*) @nogc nothrow;
    double difftime(c_long, c_long) @nogc nothrow;
    c_long mktime(tm*) @nogc nothrow;
    c_ulong strftime(char*, c_ulong, const(char)*, const(tm)*) @nogc nothrow;
    c_ulong strftime_l(char*, c_ulong, const(char)*, const(tm)*, __locale_struct*) @nogc nothrow;
    tm* gmtime(const(c_long)*) @nogc nothrow;
    tm* localtime(const(c_long)*) @nogc nothrow;
    tm* gmtime_r(const(c_long)*, tm*) @nogc nothrow;
    tm* localtime_r(const(c_long)*, tm*) @nogc nothrow;
    char* asctime(const(tm)*) @nogc nothrow;
    char* ctime(const(c_long)*) @nogc nothrow;
    char* asctime_r(const(tm)*, char*) @nogc nothrow;
    char* ctime_r(const(c_long)*, char*) @nogc nothrow;
    extern __gshared char*[2] __tzname;
    extern __gshared int __daylight;
    extern __gshared c_long __timezone;
    extern __gshared char*[2] tzname;
    void tzset() @nogc nothrow;
    extern __gshared int daylight;
    extern __gshared c_long timezone;
    alias FILE = _IO_FILE;
    c_long timegm(tm*) @nogc nothrow;
    c_long timelocal(tm*) @nogc nothrow;
    int dysize(int) @nogc nothrow;
    int nanosleep(const(timespec)*, timespec*) @nogc nothrow;
    int clock_getres(int, timespec*) @nogc nothrow;
    int clock_gettime(int, timespec*) @nogc nothrow;
    int clock_settime(int, const(timespec)*) @nogc nothrow;
    int clock_nanosleep(int, int, const(timespec)*, timespec*) @nogc nothrow;
    int clock_getcpuclockid(int, int*) @nogc nothrow;
    int timer_create(int, sigevent*, void**) @nogc nothrow;
    int timer_delete(void*) @nogc nothrow;
    int timer_settime(void*, int, const(itimerspec)*, itimerspec*) @nogc nothrow;
    int timer_gettime(void*, itimerspec*) @nogc nothrow;
    int timer_getoverrun(void*) @nogc nothrow;
    int timespec_get(timespec*, int) @nogc nothrow;
    static ushort __bswap_16(ushort) @nogc nothrow;
    alias __sig_atomic_t = int;
    static uint __bswap_32(uint) @nogc nothrow;
    static c_ulong __bswap_64(c_ulong) @nogc nothrow;
    alias __socklen_t = uint;
    alias __intptr_t = c_long;
    alias __caddr_t = char*;
    alias __loff_t = c_long;
    alias __syscall_ulong_t = c_ulong;
    alias __syscall_slong_t = c_long;
    alias __ssize_t = c_long;
    alias __fsword_t = c_long;
    alias __fsfilcnt64_t = c_ulong;
    alias __fsfilcnt_t = c_ulong;
    alias __fsblkcnt64_t = c_ulong;
    alias __fsblkcnt_t = c_ulong;
    alias __blkcnt64_t = c_long;
    alias pthread_t = c_ulong;
    union pthread_mutexattr_t
    {
        char[4] __size;
        int __align;
    }

    union pthread_condattr_t
    {
        char[4] __size;
        int __align;
    }

    alias pthread_key_t = uint;
    alias pthread_once_t = int;
    union pthread_attr_t
    {
        char[56] __size;
        c_long __align;
    }

    union pthread_mutex_t
    {
        __pthread_mutex_s __data;
        char[40] __size;
        c_long __align;
    }

    union pthread_cond_t
    {
        __pthread_cond_s __data;
        char[48] __size;
        long __align;
    }

    union pthread_rwlock_t
    {
        __pthread_rwlock_arch_t __data;
        char[56] __size;
        c_long __align;
    }

    union pthread_rwlockattr_t
    {
        char[8] __size;
        c_long __align;
    }

    alias pthread_spinlock_t = int;
    union pthread_barrier_t
    {
        char[32] __size;
        c_long __align;
    }

    union pthread_barrierattr_t
    {
        char[4] __size;
        int __align;
    }

    alias __blkcnt_t = c_long;
    alias __blksize_t = c_long;
    alias int8_t = byte;
    alias int16_t = short;
    alias int32_t = int;
    alias int64_t = c_long;
    alias uint8_t = ubyte;
    alias uint16_t = ushort;
    alias uint32_t = uint;
    alias uint64_t = ulong;
    alias __timer_t = void*;
    alias __clockid_t = int;
    alias __key_t = int;
    struct __pthread_mutex_s
    {
        int __lock;
        uint __count;
        int __owner;
        uint __nusers;
        int __kind;
        short __spins;
        short __elision;
        __pthread_internal_list __list;
    }

    alias __daddr_t = int;
    struct __pthread_rwlock_arch_t
    {
        uint __readers;
        uint __writers;
        uint __wrphase_futex;
        uint __writers_futex;
        uint __pad3;
        uint __pad4;
        int __cur_writer;
        int __shared;
        byte __rwelision;
        ubyte[7] __pad1;
        c_ulong __pad2;
        uint __flags;
    }

    alias __suseconds_t = c_long;
    extern __gshared int sys_nerr;
    extern __gshared const(const(char)*)[0] sys_errlist;
    alias __pthread_list_t = __pthread_internal_list;
    struct __pthread_internal_list
    {
        __pthread_internal_list* __prev;
        __pthread_internal_list* __next;
    }

    alias __pthread_slist_t = __pthread_internal_slist;
    struct __pthread_internal_slist
    {
        __pthread_internal_slist* __next;
    }

    struct __pthread_cond_s
    {
        static union _Anonymous_1
        {
            ulong __wseq;
            static struct _Anonymous_2
            {
                uint __low;
                uint __high;
            }

            _Anonymous_2 __wseq32;
        }

        _Anonymous_1 _anonymous_3;
        auto __wseq() @property @nogc pure nothrow
        {
            return _anonymous_3.__wseq;
        }

        void __wseq(_T_)(auto ref _T_ val) @property @nogc pure nothrow
        {
            _anonymous_3.__wseq = val;
        }

        auto __wseq32() @property @nogc pure nothrow
        {
            return _anonymous_3.__wseq32;
        }

        void __wseq32(_T_)(auto ref _T_ val) @property @nogc pure nothrow
        {
            _anonymous_3.__wseq32 = val;
        }

        static union _Anonymous_4
        {
            ulong __g1_start;
            static struct _Anonymous_5
            {
                uint __low;
                uint __high;
            }

            _Anonymous_5 __g1_start32;
        }

        _Anonymous_4 _anonymous_6;
        auto __g1_start() @property @nogc pure nothrow
        {
            return _anonymous_6.__g1_start;
        }

        void __g1_start(_T_)(auto ref _T_ val) @property @nogc pure nothrow
        {
            _anonymous_6.__g1_start = val;
        }

        auto __g1_start32() @property @nogc pure nothrow
        {
            return _anonymous_6.__g1_start32;
        }

        void __g1_start32(_T_)(auto ref _T_ val) @property @nogc pure nothrow
        {
            _anonymous_6.__g1_start32 = val;
        }

        uint[2] __g_refs;
        uint[2] __g_size;
        uint __g1_orig_size;
        uint __wrefs;
        uint[2] __g_signals;
    }

    alias __useconds_t = uint;
    alias __time_t = c_long;
    alias __id_t = uint;
    alias __rlim64_t = c_ulong;
    alias __rlim_t = c_ulong;
    alias __clock_t = c_long;
    alias __u_char = ubyte;
    alias __u_short = ushort;
    alias __u_int = uint;
    alias __u_long = c_ulong;
    alias __int8_t = byte;
    alias __uint8_t = ubyte;
    alias __int16_t = short;
    alias __uint16_t = ushort;
    alias __int32_t = int;
    alias __uint32_t = uint;
    alias __int64_t = c_long;
    alias __uint64_t = c_ulong;
    alias __int_least8_t = byte;
    alias __uint_least8_t = ubyte;
    alias __int_least16_t = short;
    alias __uint_least16_t = ushort;
    alias __int_least32_t = int;
    alias __uint_least32_t = uint;
    alias __int_least64_t = c_long;
    alias __uint_least64_t = c_ulong;
    alias __quad_t = c_long;
    alias __u_quad_t = c_ulong;
    alias __intmax_t = c_long;
    alias __uintmax_t = c_ulong;
    struct __fsid_t
    {
        int[2] __val;
    }

    alias __pid_t = int;
    alias __off64_t = c_long;
    alias __off_t = c_long;
    alias __nlink_t = c_ulong;
    alias __dev_t = c_ulong;
    alias __uid_t = uint;
    alias __gid_t = uint;
    alias __ino_t = c_ulong;
    alias __ino64_t = c_ulong;
    alias __mode_t = uint;

    static if (!is(typeof(__STD_TYPE)))
    {
        private enum enumMixinStr___STD_TYPE = `enum __STD_TYPE = typedef;`;
        static if (is(typeof({ mixin(enumMixinStr___STD_TYPE); })))
        {
            mixin(enumMixinStr___STD_TYPE);
        }
    }

    static if (!is(typeof(__U64_TYPE)))
    {
        private enum enumMixinStr___U64_TYPE = `enum __U64_TYPE = unsigned long int;`;
        static if (is(typeof({ mixin(enumMixinStr___U64_TYPE); })))
        {
            mixin(enumMixinStr___U64_TYPE);
        }
    }

    static if (!is(typeof(__S64_TYPE)))
    {
        private enum enumMixinStr___S64_TYPE = `enum __S64_TYPE = long int;`;
        static if (is(typeof({ mixin(enumMixinStr___S64_TYPE); })))
        {
            mixin(enumMixinStr___S64_TYPE);
        }
    }

    static if (!is(typeof(__ULONG32_TYPE)))
    {
        private enum enumMixinStr___ULONG32_TYPE = `enum __ULONG32_TYPE = unsigned int;`;
        static if (is(typeof({ mixin(enumMixinStr___ULONG32_TYPE); })))
        {
            mixin(enumMixinStr___ULONG32_TYPE);
        }
    }

    static if (!is(typeof(__SLONG32_TYPE)))
    {
        private enum enumMixinStr___SLONG32_TYPE = `enum __SLONG32_TYPE = int;`;
        static if (is(typeof({ mixin(enumMixinStr___SLONG32_TYPE); })))
        {
            mixin(enumMixinStr___SLONG32_TYPE);
        }
    }

    static if (!is(typeof(__UWORD_TYPE)))
    {
        private enum enumMixinStr___UWORD_TYPE = `enum __UWORD_TYPE = unsigned long int;`;
        static if (is(typeof({ mixin(enumMixinStr___UWORD_TYPE); })))
        {
            mixin(enumMixinStr___UWORD_TYPE);
        }
    }

    static if (!is(typeof(__SWORD_TYPE)))
    {
        private enum enumMixinStr___SWORD_TYPE = `enum __SWORD_TYPE = long int;`;
        static if (is(typeof({ mixin(enumMixinStr___SWORD_TYPE); })))
        {
            mixin(enumMixinStr___SWORD_TYPE);
        }
    }

    static if (!is(typeof(__UQUAD_TYPE)))
    {
        private enum enumMixinStr___UQUAD_TYPE = `enum __UQUAD_TYPE = unsigned long int;`;
        static if (is(typeof({ mixin(enumMixinStr___UQUAD_TYPE); })))
        {
            mixin(enumMixinStr___UQUAD_TYPE);
        }
    }

    static if (!is(typeof(__SQUAD_TYPE)))
    {
        private enum enumMixinStr___SQUAD_TYPE = `enum __SQUAD_TYPE = long int;`;
        static if (is(typeof({ mixin(enumMixinStr___SQUAD_TYPE); })))
        {
            mixin(enumMixinStr___SQUAD_TYPE);
        }
    }

    static if (!is(typeof(__ULONGWORD_TYPE)))
    {
        private enum enumMixinStr___ULONGWORD_TYPE = `enum __ULONGWORD_TYPE = unsigned long int;`;
        static if (is(typeof({ mixin(enumMixinStr___ULONGWORD_TYPE); })))
        {
            mixin(enumMixinStr___ULONGWORD_TYPE);
        }
    }

    static if (!is(typeof(__SLONGWORD_TYPE)))
    {
        private enum enumMixinStr___SLONGWORD_TYPE = `enum __SLONGWORD_TYPE = long int;`;
        static if (is(typeof({ mixin(enumMixinStr___SLONGWORD_TYPE); })))
        {
            mixin(enumMixinStr___SLONGWORD_TYPE);
        }
    }

    static if (!is(typeof(__U32_TYPE)))
    {
        private enum enumMixinStr___U32_TYPE = `enum __U32_TYPE = unsigned int;`;
        static if (is(typeof({ mixin(enumMixinStr___U32_TYPE); })))
        {
            mixin(enumMixinStr___U32_TYPE);
        }
    }

    static if (!is(typeof(__S32_TYPE)))
    {
        private enum enumMixinStr___S32_TYPE = `enum __S32_TYPE = int;`;
        static if (is(typeof({ mixin(enumMixinStr___S32_TYPE); })))
        {
            mixin(enumMixinStr___S32_TYPE);
        }
    }

    static if (!is(typeof(__U16_TYPE)))
    {
        private enum enumMixinStr___U16_TYPE = `enum __U16_TYPE = unsigned short int;`;
        static if (is(typeof({ mixin(enumMixinStr___U16_TYPE); })))
        {
            mixin(enumMixinStr___U16_TYPE);
        }
    }

    static if (!is(typeof(__S16_TYPE)))
    {
        private enum enumMixinStr___S16_TYPE = `enum __S16_TYPE = short int;`;
        static if (is(typeof({ mixin(enumMixinStr___S16_TYPE); })))
        {
            mixin(enumMixinStr___S16_TYPE);
        }
    }

    static if (!is(typeof(_BITS_TYPES_H)))
    {
        private enum enumMixinStr__BITS_TYPES_H = `enum _BITS_TYPES_H = 1;`;
        static if (is(typeof({ mixin(enumMixinStr__BITS_TYPES_H); })))
        {
            mixin(enumMixinStr__BITS_TYPES_H);
        }
    }

    static if (!is(typeof(__TIMESIZE)))
    {
        private enum enumMixinStr___TIMESIZE = `enum __TIMESIZE = __WORDSIZE;`;
        static if (is(typeof({ mixin(enumMixinStr___TIMESIZE); })))
        {
            mixin(enumMixinStr___TIMESIZE);
        }
    }

    static if (!is(typeof(__TIME64_T_TYPE)))
    {
        private enum enumMixinStr___TIME64_T_TYPE = `enum __TIME64_T_TYPE = __TIME_T_TYPE;`;
        static if (is(typeof({ mixin(enumMixinStr___TIME64_T_TYPE); })))
        {
            mixin(enumMixinStr___TIME64_T_TYPE);
        }
    }

    static if (!is(typeof(_BITS_TIME64_H)))
    {
        private enum enumMixinStr__BITS_TIME64_H = `enum _BITS_TIME64_H = 1;`;
        static if (is(typeof({ mixin(enumMixinStr__BITS_TIME64_H); })))
        {
            mixin(enumMixinStr__BITS_TIME64_H);
        }
    }

    static if (!is(typeof(TIMER_ABSTIME)))
    {
        private enum enumMixinStr_TIMER_ABSTIME = `enum TIMER_ABSTIME = 1;`;
        static if (is(typeof({ mixin(enumMixinStr_TIMER_ABSTIME); })))
        {
            mixin(enumMixinStr_TIMER_ABSTIME);
        }
    }

    static if (!is(typeof(CLOCK_TAI)))
    {
        private enum enumMixinStr_CLOCK_TAI = `enum CLOCK_TAI = 11;`;
        static if (is(typeof({ mixin(enumMixinStr_CLOCK_TAI); })))
        {
            mixin(enumMixinStr_CLOCK_TAI);
        }
    }

    static if (!is(typeof(CLOCK_BOOTTIME_ALARM)))
    {
        private enum enumMixinStr_CLOCK_BOOTTIME_ALARM = `enum CLOCK_BOOTTIME_ALARM = 9;`;
        static if (is(typeof({ mixin(enumMixinStr_CLOCK_BOOTTIME_ALARM); })))
        {
            mixin(enumMixinStr_CLOCK_BOOTTIME_ALARM);
        }
    }

    static if (!is(typeof(CLOCK_REALTIME_ALARM)))
    {
        private enum enumMixinStr_CLOCK_REALTIME_ALARM = `enum CLOCK_REALTIME_ALARM = 8;`;
        static if (is(typeof({ mixin(enumMixinStr_CLOCK_REALTIME_ALARM); })))
        {
            mixin(enumMixinStr_CLOCK_REALTIME_ALARM);
        }
    }

    static if (!is(typeof(CLOCK_BOOTTIME)))
    {
        private enum enumMixinStr_CLOCK_BOOTTIME = `enum CLOCK_BOOTTIME = 7;`;
        static if (is(typeof({ mixin(enumMixinStr_CLOCK_BOOTTIME); })))
        {
            mixin(enumMixinStr_CLOCK_BOOTTIME);
        }
    }

    static if (!is(typeof(CLOCK_MONOTONIC_COARSE)))
    {
        private enum enumMixinStr_CLOCK_MONOTONIC_COARSE = `enum CLOCK_MONOTONIC_COARSE = 6;`;
        static if (is(typeof({ mixin(enumMixinStr_CLOCK_MONOTONIC_COARSE); })))
        {
            mixin(enumMixinStr_CLOCK_MONOTONIC_COARSE);
        }
    }

    static if (!is(typeof(CLOCK_REALTIME_COARSE)))
    {
        private enum enumMixinStr_CLOCK_REALTIME_COARSE = `enum CLOCK_REALTIME_COARSE = 5;`;
        static if (is(typeof({ mixin(enumMixinStr_CLOCK_REALTIME_COARSE); })))
        {
            mixin(enumMixinStr_CLOCK_REALTIME_COARSE);
        }
    }

    static if (!is(typeof(CLOCK_MONOTONIC_RAW)))
    {
        private enum enumMixinStr_CLOCK_MONOTONIC_RAW = `enum CLOCK_MONOTONIC_RAW = 4;`;
        static if (is(typeof({ mixin(enumMixinStr_CLOCK_MONOTONIC_RAW); })))
        {
            mixin(enumMixinStr_CLOCK_MONOTONIC_RAW);
        }
    }

    static if (!is(typeof(CLOCK_THREAD_CPUTIME_ID)))
    {
        private enum enumMixinStr_CLOCK_THREAD_CPUTIME_ID = `enum CLOCK_THREAD_CPUTIME_ID = 3;`;
        static if (is(typeof({ mixin(enumMixinStr_CLOCK_THREAD_CPUTIME_ID); })))
        {
            mixin(enumMixinStr_CLOCK_THREAD_CPUTIME_ID);
        }
    }

    static if (!is(typeof(CLOCK_PROCESS_CPUTIME_ID)))
    {
        private enum enumMixinStr_CLOCK_PROCESS_CPUTIME_ID = `enum CLOCK_PROCESS_CPUTIME_ID = 2;`;
        static if (is(typeof({ mixin(enumMixinStr_CLOCK_PROCESS_CPUTIME_ID); })))
        {
            mixin(enumMixinStr_CLOCK_PROCESS_CPUTIME_ID);
        }
    }

    static if (!is(typeof(CLOCK_MONOTONIC)))
    {
        private enum enumMixinStr_CLOCK_MONOTONIC = `enum CLOCK_MONOTONIC = 1;`;
        static if (is(typeof({ mixin(enumMixinStr_CLOCK_MONOTONIC); })))
        {
            mixin(enumMixinStr_CLOCK_MONOTONIC);
        }
    }

    static if (!is(typeof(CLOCK_REALTIME)))
    {
        private enum enumMixinStr_CLOCK_REALTIME = `enum CLOCK_REALTIME = 0;`;
        static if (is(typeof({ mixin(enumMixinStr_CLOCK_REALTIME); })))
        {
            mixin(enumMixinStr_CLOCK_REALTIME);
        }
    }

    static if (!is(typeof(CLOCKS_PER_SEC)))
    {
        private enum enumMixinStr_CLOCKS_PER_SEC = `enum CLOCKS_PER_SEC = ( cast( __clock_t ) 1000000 );`;
        static if (is(typeof({ mixin(enumMixinStr_CLOCKS_PER_SEC); })))
        {
            mixin(enumMixinStr_CLOCKS_PER_SEC);
        }
    }

    static if (!is(typeof(_BITS_TIME_H)))
    {
        private enum enumMixinStr__BITS_TIME_H = `enum _BITS_TIME_H = 1;`;
        static if (is(typeof({ mixin(enumMixinStr__BITS_TIME_H); })))
        {
            mixin(enumMixinStr__BITS_TIME_H);
        }
    }

    static if (!is(typeof(_THREAD_SHARED_TYPES_H)))
    {
        private enum enumMixinStr__THREAD_SHARED_TYPES_H = `enum _THREAD_SHARED_TYPES_H = 1;`;
        static if (is(typeof({ mixin(enumMixinStr__THREAD_SHARED_TYPES_H); })))
        {
            mixin(enumMixinStr__THREAD_SHARED_TYPES_H);
        }
    }

    static if (!is(typeof(__PTHREAD_RWLOCK_ELISION_EXTRA)))
    {
        private enum enumMixinStr___PTHREAD_RWLOCK_ELISION_EXTRA = `enum __PTHREAD_RWLOCK_ELISION_EXTRA = 0 , { 0 , 0 , 0 , 0 , 0 , 0 , 0 };`;
        static if (is(typeof({
                    mixin(enumMixinStr___PTHREAD_RWLOCK_ELISION_EXTRA);
                })))
        {
            mixin(enumMixinStr___PTHREAD_RWLOCK_ELISION_EXTRA);
        }
    }
    static if (!is(typeof(__PTHREAD_MUTEX_HAVE_PREV)))
    {
        private enum enumMixinStr___PTHREAD_MUTEX_HAVE_PREV = `enum __PTHREAD_MUTEX_HAVE_PREV = 1;`;
        static if (is(typeof({ mixin(enumMixinStr___PTHREAD_MUTEX_HAVE_PREV); })))
        {
            mixin(enumMixinStr___PTHREAD_MUTEX_HAVE_PREV);
        }
    }

    static if (!is(typeof(_THREAD_MUTEX_INTERNAL_H)))
    {
        private enum enumMixinStr__THREAD_MUTEX_INTERNAL_H = `enum _THREAD_MUTEX_INTERNAL_H = 1;`;
        static if (is(typeof({ mixin(enumMixinStr__THREAD_MUTEX_INTERNAL_H); })))
        {
            mixin(enumMixinStr__THREAD_MUTEX_INTERNAL_H);
        }
    }

    static if (!is(typeof(FOPEN_MAX)))
    {
        private enum enumMixinStr_FOPEN_MAX = `enum FOPEN_MAX = 16;`;
        static if (is(typeof({ mixin(enumMixinStr_FOPEN_MAX); })))
        {
            mixin(enumMixinStr_FOPEN_MAX);
        }
    }

    static if (!is(typeof(L_ctermid)))
    {
        private enum enumMixinStr_L_ctermid = `enum L_ctermid = 9;`;
        static if (is(typeof({ mixin(enumMixinStr_L_ctermid); })))
        {
            mixin(enumMixinStr_L_ctermid);
        }
    }

    static if (!is(typeof(FILENAME_MAX)))
    {
        private enum enumMixinStr_FILENAME_MAX = `enum FILENAME_MAX = 4096;`;
        static if (is(typeof({ mixin(enumMixinStr_FILENAME_MAX); })))
        {
            mixin(enumMixinStr_FILENAME_MAX);
        }
    }

    static if (!is(typeof(TMP_MAX)))
    {
        private enum enumMixinStr_TMP_MAX = `enum TMP_MAX = 238328;`;
        static if (is(typeof({ mixin(enumMixinStr_TMP_MAX); })))
        {
            mixin(enumMixinStr_TMP_MAX);
        }
    }

    static if (!is(typeof(L_tmpnam)))
    {
        private enum enumMixinStr_L_tmpnam = `enum L_tmpnam = 20;`;
        static if (is(typeof({ mixin(enumMixinStr_L_tmpnam); })))
        {
            mixin(enumMixinStr_L_tmpnam);
        }
    }

    static if (!is(typeof(_BITS_STDIO_LIM_H)))
    {
        private enum enumMixinStr__BITS_STDIO_LIM_H = `enum _BITS_STDIO_LIM_H = 1;`;
        static if (is(typeof({ mixin(enumMixinStr__BITS_STDIO_LIM_H); })))
        {
            mixin(enumMixinStr__BITS_STDIO_LIM_H);
        }
    }

    static if (!is(typeof(_BITS_STDINT_UINTN_H)))
    {
        private enum enumMixinStr__BITS_STDINT_UINTN_H = `enum _BITS_STDINT_UINTN_H = 1;`;
        static if (is(typeof({ mixin(enumMixinStr__BITS_STDINT_UINTN_H); })))
        {
            mixin(enumMixinStr__BITS_STDINT_UINTN_H);
        }
    }

    static if (!is(typeof(_BITS_STDINT_INTN_H)))
    {
        private enum enumMixinStr__BITS_STDINT_INTN_H = `enum _BITS_STDINT_INTN_H = 1;`;
        static if (is(typeof({ mixin(enumMixinStr__BITS_STDINT_INTN_H); })))
        {
            mixin(enumMixinStr__BITS_STDINT_INTN_H);
        }
    }
    static if (!is(typeof(__FD_ZERO_STOS)))
    {
        private enum enumMixinStr___FD_ZERO_STOS = `enum __FD_ZERO_STOS = "stosq";`;
        static if (is(typeof({ mixin(enumMixinStr___FD_ZERO_STOS); })))
        {
            mixin(enumMixinStr___FD_ZERO_STOS);
        }
    }

    static if (!is(typeof(__have_pthread_attr_t)))
    {
        private enum enumMixinStr___have_pthread_attr_t = `enum __have_pthread_attr_t = 1;`;
        static if (is(typeof({ mixin(enumMixinStr___have_pthread_attr_t); })))
        {
            mixin(enumMixinStr___have_pthread_attr_t);
        }
    }

    static if (!is(typeof(_BITS_PTHREADTYPES_COMMON_H)))
    {
        private enum enumMixinStr__BITS_PTHREADTYPES_COMMON_H = `enum _BITS_PTHREADTYPES_COMMON_H = 1;`;
        static if (is(typeof({ mixin(enumMixinStr__BITS_PTHREADTYPES_COMMON_H); })))
        {
            mixin(enumMixinStr__BITS_PTHREADTYPES_COMMON_H);
        }
    }
    static if (!is(typeof(__SIZEOF_PTHREAD_BARRIERATTR_T)))
    {
        private enum enumMixinStr___SIZEOF_PTHREAD_BARRIERATTR_T = `enum __SIZEOF_PTHREAD_BARRIERATTR_T = 4;`;
        static if (is(typeof({
                    mixin(enumMixinStr___SIZEOF_PTHREAD_BARRIERATTR_T);
                })))
        {
            mixin(enumMixinStr___SIZEOF_PTHREAD_BARRIERATTR_T);
        }
    }

    static if (!is(typeof(__SIZEOF_PTHREAD_RWLOCKATTR_T)))
    {
        private enum enumMixinStr___SIZEOF_PTHREAD_RWLOCKATTR_T = `enum __SIZEOF_PTHREAD_RWLOCKATTR_T = 8;`;
        static if (is(typeof({
                    mixin(enumMixinStr___SIZEOF_PTHREAD_RWLOCKATTR_T);
                })))
        {
            mixin(enumMixinStr___SIZEOF_PTHREAD_RWLOCKATTR_T);
        }
    }

    static if (!is(typeof(__SIZEOF_PTHREAD_CONDATTR_T)))
    {
        private enum enumMixinStr___SIZEOF_PTHREAD_CONDATTR_T = `enum __SIZEOF_PTHREAD_CONDATTR_T = 4;`;
        static if (is(typeof({ mixin(enumMixinStr___SIZEOF_PTHREAD_CONDATTR_T); })))
        {
            mixin(enumMixinStr___SIZEOF_PTHREAD_CONDATTR_T);
        }
    }

    static if (!is(typeof(__SIZEOF_PTHREAD_COND_T)))
    {
        private enum enumMixinStr___SIZEOF_PTHREAD_COND_T = `enum __SIZEOF_PTHREAD_COND_T = 48;`;
        static if (is(typeof({ mixin(enumMixinStr___SIZEOF_PTHREAD_COND_T); })))
        {
            mixin(enumMixinStr___SIZEOF_PTHREAD_COND_T);
        }
    }

    static if (!is(typeof(__SIZEOF_PTHREAD_MUTEXATTR_T)))
    {
        private enum enumMixinStr___SIZEOF_PTHREAD_MUTEXATTR_T = `enum __SIZEOF_PTHREAD_MUTEXATTR_T = 4;`;
        static if (is(typeof({ mixin(enumMixinStr___SIZEOF_PTHREAD_MUTEXATTR_T); })))
        {
            mixin(enumMixinStr___SIZEOF_PTHREAD_MUTEXATTR_T);
        }
    }

    static if (!is(typeof(__SIZEOF_PTHREAD_BARRIER_T)))
    {
        private enum enumMixinStr___SIZEOF_PTHREAD_BARRIER_T = `enum __SIZEOF_PTHREAD_BARRIER_T = 32;`;
        static if (is(typeof({ mixin(enumMixinStr___SIZEOF_PTHREAD_BARRIER_T); })))
        {
            mixin(enumMixinStr___SIZEOF_PTHREAD_BARRIER_T);
        }
    }

    static if (!is(typeof(__SIZEOF_PTHREAD_RWLOCK_T)))
    {
        private enum enumMixinStr___SIZEOF_PTHREAD_RWLOCK_T = `enum __SIZEOF_PTHREAD_RWLOCK_T = 56;`;
        static if (is(typeof({ mixin(enumMixinStr___SIZEOF_PTHREAD_RWLOCK_T); })))
        {
            mixin(enumMixinStr___SIZEOF_PTHREAD_RWLOCK_T);
        }
    }

    static if (!is(typeof(__SIZEOF_PTHREAD_ATTR_T)))
    {
        private enum enumMixinStr___SIZEOF_PTHREAD_ATTR_T = `enum __SIZEOF_PTHREAD_ATTR_T = 56;`;
        static if (is(typeof({ mixin(enumMixinStr___SIZEOF_PTHREAD_ATTR_T); })))
        {
            mixin(enumMixinStr___SIZEOF_PTHREAD_ATTR_T);
        }
    }

    static if (!is(typeof(__SIZEOF_PTHREAD_MUTEX_T)))
    {
        private enum enumMixinStr___SIZEOF_PTHREAD_MUTEX_T = `enum __SIZEOF_PTHREAD_MUTEX_T = 40;`;
        static if (is(typeof({ mixin(enumMixinStr___SIZEOF_PTHREAD_MUTEX_T); })))
        {
            mixin(enumMixinStr___SIZEOF_PTHREAD_MUTEX_T);
        }
    }

    static if (!is(typeof(_BITS_PTHREADTYPES_ARCH_H)))
    {
        private enum enumMixinStr__BITS_PTHREADTYPES_ARCH_H = `enum _BITS_PTHREADTYPES_ARCH_H = 1;`;
        static if (is(typeof({ mixin(enumMixinStr__BITS_PTHREADTYPES_ARCH_H); })))
        {
            mixin(enumMixinStr__BITS_PTHREADTYPES_ARCH_H);
        }
    }

    static if (!is(typeof(__LONG_DOUBLE_USES_FLOAT128)))
    {
        private enum enumMixinStr___LONG_DOUBLE_USES_FLOAT128 = `enum __LONG_DOUBLE_USES_FLOAT128 = 0;`;
        static if (is(typeof({ mixin(enumMixinStr___LONG_DOUBLE_USES_FLOAT128); })))
        {
            mixin(enumMixinStr___LONG_DOUBLE_USES_FLOAT128);
        }
    }

    static if (!is(typeof(__GLIBC_USE_IEC_60559_TYPES_EXT)))
    {
        private enum enumMixinStr___GLIBC_USE_IEC_60559_TYPES_EXT = `enum __GLIBC_USE_IEC_60559_TYPES_EXT = 0;`;
        static if (is(typeof({
                    mixin(enumMixinStr___GLIBC_USE_IEC_60559_TYPES_EXT);
                })))
        {
            mixin(enumMixinStr___GLIBC_USE_IEC_60559_TYPES_EXT);
        }
    }

    static if (!is(typeof(__GLIBC_USE_IEC_60559_FUNCS_EXT_C2X)))
    {
        private enum enumMixinStr___GLIBC_USE_IEC_60559_FUNCS_EXT_C2X = `enum __GLIBC_USE_IEC_60559_FUNCS_EXT_C2X = 0;`;
        static if (is(typeof({
                    mixin(enumMixinStr___GLIBC_USE_IEC_60559_FUNCS_EXT_C2X);
                })))
        {
            mixin(enumMixinStr___GLIBC_USE_IEC_60559_FUNCS_EXT_C2X);
        }
    }

    static if (!is(typeof(__GLIBC_USE_IEC_60559_FUNCS_EXT)))
    {
        private enum enumMixinStr___GLIBC_USE_IEC_60559_FUNCS_EXT = `enum __GLIBC_USE_IEC_60559_FUNCS_EXT = 0;`;
        static if (is(typeof({
                    mixin(enumMixinStr___GLIBC_USE_IEC_60559_FUNCS_EXT);
                })))
        {
            mixin(enumMixinStr___GLIBC_USE_IEC_60559_FUNCS_EXT);
        }
    }

    static if (!is(typeof(__GLIBC_USE_IEC_60559_BFP_EXT_C2X)))
    {
        private enum enumMixinStr___GLIBC_USE_IEC_60559_BFP_EXT_C2X = `enum __GLIBC_USE_IEC_60559_BFP_EXT_C2X = 0;`;
        static if (is(typeof({
                    mixin(enumMixinStr___GLIBC_USE_IEC_60559_BFP_EXT_C2X);
                })))
        {
            mixin(enumMixinStr___GLIBC_USE_IEC_60559_BFP_EXT_C2X);
        }
    }

    static if (!is(typeof(__GLIBC_USE_IEC_60559_BFP_EXT)))
    {
        private enum enumMixinStr___GLIBC_USE_IEC_60559_BFP_EXT = `enum __GLIBC_USE_IEC_60559_BFP_EXT = 0;`;
        static if (is(typeof({
                    mixin(enumMixinStr___GLIBC_USE_IEC_60559_BFP_EXT);
                })))
        {
            mixin(enumMixinStr___GLIBC_USE_IEC_60559_BFP_EXT);
        }
    }

    static if (!is(typeof(__GLIBC_USE_LIB_EXT2)))
    {
        private enum enumMixinStr___GLIBC_USE_LIB_EXT2 = `enum __GLIBC_USE_LIB_EXT2 = 0;`;
        static if (is(typeof({ mixin(enumMixinStr___GLIBC_USE_LIB_EXT2); })))
        {
            mixin(enumMixinStr___GLIBC_USE_LIB_EXT2);
        }
    }

    static if (!is(typeof(__BYTE_ORDER)))
    {
        private enum enumMixinStr___BYTE_ORDER = `enum __BYTE_ORDER = __LITTLE_ENDIAN;`;
        static if (is(typeof({ mixin(enumMixinStr___BYTE_ORDER); })))
        {
            mixin(enumMixinStr___BYTE_ORDER);
        }
    }

    static if (!is(typeof(_BITS_ENDIANNESS_H)))
    {
        private enum enumMixinStr__BITS_ENDIANNESS_H = `enum _BITS_ENDIANNESS_H = 1;`;
        static if (is(typeof({ mixin(enumMixinStr__BITS_ENDIANNESS_H); })))
        {
            mixin(enumMixinStr__BITS_ENDIANNESS_H);
        }
    }

    static if (!is(typeof(__FLOAT_WORD_ORDER)))
    {
        private enum enumMixinStr___FLOAT_WORD_ORDER = `enum __FLOAT_WORD_ORDER = __LITTLE_ENDIAN;`;
        static if (is(typeof({ mixin(enumMixinStr___FLOAT_WORD_ORDER); })))
        {
            mixin(enumMixinStr___FLOAT_WORD_ORDER);
        }
    }

    static if (!is(typeof(__PDP_ENDIAN)))
    {
        private enum enumMixinStr___PDP_ENDIAN = `enum __PDP_ENDIAN = 3412;`;
        static if (is(typeof({ mixin(enumMixinStr___PDP_ENDIAN); })))
        {
            mixin(enumMixinStr___PDP_ENDIAN);
        }
    }

    static if (!is(typeof(__BIG_ENDIAN)))
    {
        private enum enumMixinStr___BIG_ENDIAN = `enum __BIG_ENDIAN = 4321;`;
        static if (is(typeof({ mixin(enumMixinStr___BIG_ENDIAN); })))
        {
            mixin(enumMixinStr___BIG_ENDIAN);
        }
    }

    static if (!is(typeof(__LITTLE_ENDIAN)))
    {
        private enum enumMixinStr___LITTLE_ENDIAN = `enum __LITTLE_ENDIAN = 1234;`;
        static if (is(typeof({ mixin(enumMixinStr___LITTLE_ENDIAN); })))
        {
            mixin(enumMixinStr___LITTLE_ENDIAN);
        }
    }

    static if (!is(typeof(_BITS_ENDIAN_H)))
    {
        private enum enumMixinStr__BITS_ENDIAN_H = `enum _BITS_ENDIAN_H = 1;`;
        static if (is(typeof({ mixin(enumMixinStr__BITS_ENDIAN_H); })))
        {
            mixin(enumMixinStr__BITS_ENDIAN_H);
        }
    }
    static if (!is(typeof(_BITS_BYTESWAP_H)))
    {
        private enum enumMixinStr__BITS_BYTESWAP_H = `enum _BITS_BYTESWAP_H = 1;`;
        static if (is(typeof({ mixin(enumMixinStr__BITS_BYTESWAP_H); })))
        {
            mixin(enumMixinStr__BITS_BYTESWAP_H);
        }
    }

    static if (!is(typeof(__FILE_defined)))
    {
        private enum enumMixinStr___FILE_defined = `enum __FILE_defined = 1;`;
        static if (is(typeof({ mixin(enumMixinStr___FILE_defined); })))
        {
            mixin(enumMixinStr___FILE_defined);
        }
    }

    static if (!is(typeof(____FILE_defined)))
    {
        private enum enumMixinStr_____FILE_defined = `enum ____FILE_defined = 1;`;
        static if (is(typeof({ mixin(enumMixinStr_____FILE_defined); })))
        {
            mixin(enumMixinStr_____FILE_defined);
        }
    }

    static if (!is(typeof(TIME_UTC)))
    {
        private enum enumMixinStr_TIME_UTC = `enum TIME_UTC = 1;`;
        static if (is(typeof({ mixin(enumMixinStr_TIME_UTC); })))
        {
            mixin(enumMixinStr_TIME_UTC);
        }
    }

    static if (!is(typeof(_____fpos64_t_defined)))
    {
        private enum enumMixinStr______fpos64_t_defined = `enum _____fpos64_t_defined = 1;`;
        static if (is(typeof({ mixin(enumMixinStr______fpos64_t_defined); })))
        {
            mixin(enumMixinStr______fpos64_t_defined);
        }
    }

    static if (!is(typeof(_TIME_H)))
    {
        private enum enumMixinStr__TIME_H = `enum _TIME_H = 1;`;
        static if (is(typeof({ mixin(enumMixinStr__TIME_H); })))
        {
            mixin(enumMixinStr__TIME_H);
        }
    }

    static if (!is(typeof(stderr)))
    {
        private enum enumMixinStr_stderr = `enum stderr = stderr;`;
        static if (is(typeof({ mixin(enumMixinStr_stderr); })))
        {
            mixin(enumMixinStr_stderr);
        }
    }

    static if (!is(typeof(stdout)))
    {
        private enum enumMixinStr_stdout = `enum stdout = stdout;`;
        static if (is(typeof({ mixin(enumMixinStr_stdout); })))
        {
            mixin(enumMixinStr_stdout);
        }
    }

    static if (!is(typeof(_____fpos_t_defined)))
    {
        private enum enumMixinStr______fpos_t_defined = `enum _____fpos_t_defined = 1;`;
        static if (is(typeof({ mixin(enumMixinStr______fpos_t_defined); })))
        {
            mixin(enumMixinStr______fpos_t_defined);
        }
    }

    static if (!is(typeof(stdin)))
    {
        private enum enumMixinStr_stdin = `enum stdin = stdin;`;
        static if (is(typeof({ mixin(enumMixinStr_stdin); })))
        {
            mixin(enumMixinStr_stdin);
        }
    }

    static if (!is(typeof(P_tmpdir)))
    {
        private enum enumMixinStr_P_tmpdir = `enum P_tmpdir = "/tmp";`;
        static if (is(typeof({ mixin(enumMixinStr_P_tmpdir); })))
        {
            mixin(enumMixinStr_P_tmpdir);
        }
    }

    static if (!is(typeof(SEEK_END)))
    {
        private enum enumMixinStr_SEEK_END = `enum SEEK_END = 2;`;
        static if (is(typeof({ mixin(enumMixinStr_SEEK_END); })))
        {
            mixin(enumMixinStr_SEEK_END);
        }
    }

    static if (!is(typeof(SEEK_CUR)))
    {
        private enum enumMixinStr_SEEK_CUR = `enum SEEK_CUR = 1;`;
        static if (is(typeof({ mixin(enumMixinStr_SEEK_CUR); })))
        {
            mixin(enumMixinStr_SEEK_CUR);
        }
    }

    static if (!is(typeof(_BITS_TYPES___LOCALE_T_H)))
    {
        private enum enumMixinStr__BITS_TYPES___LOCALE_T_H = `enum _BITS_TYPES___LOCALE_T_H = 1;`;
        static if (is(typeof({ mixin(enumMixinStr__BITS_TYPES___LOCALE_T_H); })))
        {
            mixin(enumMixinStr__BITS_TYPES___LOCALE_T_H);
        }
    }

    static if (!is(typeof(SEEK_SET)))
    {
        private enum enumMixinStr_SEEK_SET = `enum SEEK_SET = 0;`;
        static if (is(typeof({ mixin(enumMixinStr_SEEK_SET); })))
        {
            mixin(enumMixinStr_SEEK_SET);
        }
    }

    static if (!is(typeof(EOF)))
    {
        private enum enumMixinStr_EOF = `enum EOF = ( - 1 );`;
        static if (is(typeof({ mixin(enumMixinStr_EOF); })))
        {
            mixin(enumMixinStr_EOF);
        }
    }

    static if (!is(typeof(____mbstate_t_defined)))
    {
        private enum enumMixinStr_____mbstate_t_defined = `enum ____mbstate_t_defined = 1;`;
        static if (is(typeof({ mixin(enumMixinStr_____mbstate_t_defined); })))
        {
            mixin(enumMixinStr_____mbstate_t_defined);
        }
    }

    static if (!is(typeof(BUFSIZ)))
    {
        private enum enumMixinStr_BUFSIZ = `enum BUFSIZ = 8192;`;
        static if (is(typeof({ mixin(enumMixinStr_BUFSIZ); })))
        {
            mixin(enumMixinStr_BUFSIZ);
        }
    }

    static if (!is(typeof(_IONBF)))
    {
        private enum enumMixinStr__IONBF = `enum _IONBF = 2;`;
        static if (is(typeof({ mixin(enumMixinStr__IONBF); })))
        {
            mixin(enumMixinStr__IONBF);
        }
    }

    static if (!is(typeof(_IOLBF)))
    {
        private enum enumMixinStr__IOLBF = `enum _IOLBF = 1;`;
        static if (is(typeof({ mixin(enumMixinStr__IOLBF); })))
        {
            mixin(enumMixinStr__IOLBF);
        }
    }

    static if (!is(typeof(_IOFBF)))
    {
        private enum enumMixinStr__IOFBF = `enum _IOFBF = 0;`;
        static if (is(typeof({ mixin(enumMixinStr__IOFBF); })))
        {
            mixin(enumMixinStr__IOFBF);
        }
    }

    static if (!is(typeof(_SIGSET_NWORDS)))
    {
        private enum enumMixinStr__SIGSET_NWORDS = `enum _SIGSET_NWORDS = ( 1024 / ( 8 * ( unsigned long int ) .sizeof ) );`;
        static if (is(typeof({ mixin(enumMixinStr__SIGSET_NWORDS); })))
        {
            mixin(enumMixinStr__SIGSET_NWORDS);
        }
    }
    static if (!is(typeof(__clock_t_defined)))
    {
        private enum enumMixinStr___clock_t_defined = `enum __clock_t_defined = 1;`;
        static if (is(typeof({ mixin(enumMixinStr___clock_t_defined); })))
        {
            mixin(enumMixinStr___clock_t_defined);
        }
    }

    static if (!is(typeof(__clockid_t_defined)))
    {
        private enum enumMixinStr___clockid_t_defined = `enum __clockid_t_defined = 1;`;
        static if (is(typeof({ mixin(enumMixinStr___clockid_t_defined); })))
        {
            mixin(enumMixinStr___clockid_t_defined);
        }
    }

    static if (!is(typeof(_BITS_TYPES_LOCALE_T_H)))
    {
        private enum enumMixinStr__BITS_TYPES_LOCALE_T_H = `enum _BITS_TYPES_LOCALE_T_H = 1;`;
        static if (is(typeof({ mixin(enumMixinStr__BITS_TYPES_LOCALE_T_H); })))
        {
            mixin(enumMixinStr__BITS_TYPES_LOCALE_T_H);
        }
    }

    static if (!is(typeof(_STDIO_H)))
    {
        private enum enumMixinStr__STDIO_H = `enum _STDIO_H = 1;`;
        static if (is(typeof({ mixin(enumMixinStr__STDIO_H); })))
        {
            mixin(enumMixinStr__STDIO_H);
        }
    }

    static if (!is(typeof(__sigset_t_defined)))
    {
        private enum enumMixinStr___sigset_t_defined = `enum __sigset_t_defined = 1;`;
        static if (is(typeof({ mixin(enumMixinStr___sigset_t_defined); })))
        {
            mixin(enumMixinStr___sigset_t_defined);
        }
    }
    static if (!is(typeof(__struct_FILE_defined)))
    {
        private enum enumMixinStr___struct_FILE_defined = `enum __struct_FILE_defined = 1;`;
        static if (is(typeof({ mixin(enumMixinStr___struct_FILE_defined); })))
        {
            mixin(enumMixinStr___struct_FILE_defined);
        }
    }
    static if (!is(typeof(_IO_EOF_SEEN)))
    {
        private enum enumMixinStr__IO_EOF_SEEN = `enum _IO_EOF_SEEN = 0x0010;`;
        static if (is(typeof({ mixin(enumMixinStr__IO_EOF_SEEN); })))
        {
            mixin(enumMixinStr__IO_EOF_SEEN);
        }
    }

    static if (!is(typeof(_IO_ERR_SEEN)))
    {
        private enum enumMixinStr__IO_ERR_SEEN = `enum _IO_ERR_SEEN = 0x0020;`;
        static if (is(typeof({ mixin(enumMixinStr__IO_ERR_SEEN); })))
        {
            mixin(enumMixinStr__IO_ERR_SEEN);
        }
    }

    static if (!is(typeof(_IO_USER_LOCK)))
    {
        private enum enumMixinStr__IO_USER_LOCK = `enum _IO_USER_LOCK = 0x8000;`;
        static if (is(typeof({ mixin(enumMixinStr__IO_USER_LOCK); })))
        {
            mixin(enumMixinStr__IO_USER_LOCK);
        }
    }

    static if (!is(typeof(__itimerspec_defined)))
    {
        private enum enumMixinStr___itimerspec_defined = `enum __itimerspec_defined = 1;`;
        static if (is(typeof({ mixin(enumMixinStr___itimerspec_defined); })))
        {
            mixin(enumMixinStr___itimerspec_defined);
        }
    }
    static if (!is(typeof(WINT_MAX)))
    {
        private enum enumMixinStr_WINT_MAX = `enum WINT_MAX = ( 4294967295u );`;
        static if (is(typeof({ mixin(enumMixinStr_WINT_MAX); })))
        {
            mixin(enumMixinStr_WINT_MAX);
        }
    }

    static if (!is(typeof(_STRUCT_TIMESPEC)))
    {
        private enum enumMixinStr__STRUCT_TIMESPEC = `enum _STRUCT_TIMESPEC = 1;`;
        static if (is(typeof({ mixin(enumMixinStr__STRUCT_TIMESPEC); })))
        {
            mixin(enumMixinStr__STRUCT_TIMESPEC);
        }
    }

    static if (!is(typeof(WINT_MIN)))
    {
        private enum enumMixinStr_WINT_MIN = `enum WINT_MIN = ( 0u );`;
        static if (is(typeof({ mixin(enumMixinStr_WINT_MIN); })))
        {
            mixin(enumMixinStr_WINT_MIN);
        }
    }

    static if (!is(typeof(WCHAR_MAX)))
    {
        private enum enumMixinStr_WCHAR_MAX = `enum WCHAR_MAX = __WCHAR_MAX;`;
        static if (is(typeof({ mixin(enumMixinStr_WCHAR_MAX); })))
        {
            mixin(enumMixinStr_WCHAR_MAX);
        }
    }

    static if (!is(typeof(WCHAR_MIN)))
    {
        private enum enumMixinStr_WCHAR_MIN = `enum WCHAR_MIN = __WCHAR_MIN;`;
        static if (is(typeof({ mixin(enumMixinStr_WCHAR_MIN); })))
        {
            mixin(enumMixinStr_WCHAR_MIN);
        }
    }

    static if (!is(typeof(SIZE_MAX)))
    {
        private enum enumMixinStr_SIZE_MAX = `enum SIZE_MAX = ( 18446744073709551615UL );`;
        static if (is(typeof({ mixin(enumMixinStr_SIZE_MAX); })))
        {
            mixin(enumMixinStr_SIZE_MAX);
        }
    }

    static if (!is(typeof(SIG_ATOMIC_MAX)))
    {
        private enum enumMixinStr_SIG_ATOMIC_MAX = `enum SIG_ATOMIC_MAX = ( 2147483647 );`;
        static if (is(typeof({ mixin(enumMixinStr_SIG_ATOMIC_MAX); })))
        {
            mixin(enumMixinStr_SIG_ATOMIC_MAX);
        }
    }

    static if (!is(typeof(SIG_ATOMIC_MIN)))
    {
        private enum enumMixinStr_SIG_ATOMIC_MIN = `enum SIG_ATOMIC_MIN = ( - 2147483647 - 1 );`;
        static if (is(typeof({ mixin(enumMixinStr_SIG_ATOMIC_MIN); })))
        {
            mixin(enumMixinStr_SIG_ATOMIC_MIN);
        }
    }

    static if (!is(typeof(PTRDIFF_MAX)))
    {
        private enum enumMixinStr_PTRDIFF_MAX = `enum PTRDIFF_MAX = ( 9223372036854775807L );`;
        static if (is(typeof({ mixin(enumMixinStr_PTRDIFF_MAX); })))
        {
            mixin(enumMixinStr_PTRDIFF_MAX);
        }
    }

    static if (!is(typeof(__timeval_defined)))
    {
        private enum enumMixinStr___timeval_defined = `enum __timeval_defined = 1;`;
        static if (is(typeof({ mixin(enumMixinStr___timeval_defined); })))
        {
            mixin(enumMixinStr___timeval_defined);
        }
    }

    static if (!is(typeof(PTRDIFF_MIN)))
    {
        private enum enumMixinStr_PTRDIFF_MIN = `enum PTRDIFF_MIN = ( - 9223372036854775807L - 1 );`;
        static if (is(typeof({ mixin(enumMixinStr_PTRDIFF_MIN); })))
        {
            mixin(enumMixinStr_PTRDIFF_MIN);
        }
    }

    static if (!is(typeof(UINTMAX_MAX)))
    {
        private enum enumMixinStr_UINTMAX_MAX = `enum UINTMAX_MAX = ( 18446744073709551615UL );`;
        static if (is(typeof({ mixin(enumMixinStr_UINTMAX_MAX); })))
        {
            mixin(enumMixinStr_UINTMAX_MAX);
        }
    }

    static if (!is(typeof(__struct_tm_defined)))
    {
        private enum enumMixinStr___struct_tm_defined = `enum __struct_tm_defined = 1;`;
        static if (is(typeof({ mixin(enumMixinStr___struct_tm_defined); })))
        {
            mixin(enumMixinStr___struct_tm_defined);
        }
    }

    static if (!is(typeof(INTMAX_MAX)))
    {
        private enum enumMixinStr_INTMAX_MAX = `enum INTMAX_MAX = ( 9223372036854775807L );`;
        static if (is(typeof({ mixin(enumMixinStr_INTMAX_MAX); })))
        {
            mixin(enumMixinStr_INTMAX_MAX);
        }
    }

    static if (!is(typeof(INTMAX_MIN)))
    {
        private enum enumMixinStr_INTMAX_MIN = `enum INTMAX_MIN = ( - 9223372036854775807L - 1 );`;
        static if (is(typeof({ mixin(enumMixinStr_INTMAX_MIN); })))
        {
            mixin(enumMixinStr_INTMAX_MIN);
        }
    }

    static if (!is(typeof(UINTPTR_MAX)))
    {
        private enum enumMixinStr_UINTPTR_MAX = `enum UINTPTR_MAX = ( 18446744073709551615UL );`;
        static if (is(typeof({ mixin(enumMixinStr_UINTPTR_MAX); })))
        {
            mixin(enumMixinStr_UINTPTR_MAX);
        }
    }

    static if (!is(typeof(__time_t_defined)))
    {
        private enum enumMixinStr___time_t_defined = `enum __time_t_defined = 1;`;
        static if (is(typeof({ mixin(enumMixinStr___time_t_defined); })))
        {
            mixin(enumMixinStr___time_t_defined);
        }
    }

    static if (!is(typeof(INTPTR_MAX)))
    {
        private enum enumMixinStr_INTPTR_MAX = `enum INTPTR_MAX = ( 9223372036854775807L );`;
        static if (is(typeof({ mixin(enumMixinStr_INTPTR_MAX); })))
        {
            mixin(enumMixinStr_INTPTR_MAX);
        }
    }

    static if (!is(typeof(INTPTR_MIN)))
    {
        private enum enumMixinStr_INTPTR_MIN = `enum INTPTR_MIN = ( - 9223372036854775807L - 1 );`;
        static if (is(typeof({ mixin(enumMixinStr_INTPTR_MIN); })))
        {
            mixin(enumMixinStr_INTPTR_MIN);
        }
    }

    static if (!is(typeof(__timer_t_defined)))
    {
        private enum enumMixinStr___timer_t_defined = `enum __timer_t_defined = 1;`;
        static if (is(typeof({ mixin(enumMixinStr___timer_t_defined); })))
        {
            mixin(enumMixinStr___timer_t_defined);
        }
    }

    static if (!is(typeof(UINT_FAST64_MAX)))
    {
        private enum enumMixinStr_UINT_FAST64_MAX = `enum UINT_FAST64_MAX = ( 18446744073709551615UL );`;
        static if (is(typeof({ mixin(enumMixinStr_UINT_FAST64_MAX); })))
        {
            mixin(enumMixinStr_UINT_FAST64_MAX);
        }
    }

    static if (!is(typeof(UINT_FAST32_MAX)))
    {
        private enum enumMixinStr_UINT_FAST32_MAX = `enum UINT_FAST32_MAX = ( 18446744073709551615UL );`;
        static if (is(typeof({ mixin(enumMixinStr_UINT_FAST32_MAX); })))
        {
            mixin(enumMixinStr_UINT_FAST32_MAX);
        }
    }

    static if (!is(typeof(UINT_FAST16_MAX)))
    {
        private enum enumMixinStr_UINT_FAST16_MAX = `enum UINT_FAST16_MAX = ( 18446744073709551615UL );`;
        static if (is(typeof({ mixin(enumMixinStr_UINT_FAST16_MAX); })))
        {
            mixin(enumMixinStr_UINT_FAST16_MAX);
        }
    }

    static if (!is(typeof(_BITS_TYPESIZES_H)))
    {
        private enum enumMixinStr__BITS_TYPESIZES_H = `enum _BITS_TYPESIZES_H = 1;`;
        static if (is(typeof({ mixin(enumMixinStr__BITS_TYPESIZES_H); })))
        {
            mixin(enumMixinStr__BITS_TYPESIZES_H);
        }
    }

    static if (!is(typeof(UINT_FAST8_MAX)))
    {
        private enum enumMixinStr_UINT_FAST8_MAX = `enum UINT_FAST8_MAX = ( 255 );`;
        static if (is(typeof({ mixin(enumMixinStr_UINT_FAST8_MAX); })))
        {
            mixin(enumMixinStr_UINT_FAST8_MAX);
        }
    }

    static if (!is(typeof(__SYSCALL_SLONG_TYPE)))
    {
        private enum enumMixinStr___SYSCALL_SLONG_TYPE = `enum __SYSCALL_SLONG_TYPE = long int;`;
        static if (is(typeof({ mixin(enumMixinStr___SYSCALL_SLONG_TYPE); })))
        {
            mixin(enumMixinStr___SYSCALL_SLONG_TYPE);
        }
    }

    static if (!is(typeof(__SYSCALL_ULONG_TYPE)))
    {
        private enum enumMixinStr___SYSCALL_ULONG_TYPE = `enum __SYSCALL_ULONG_TYPE = unsigned long int;`;
        static if (is(typeof({ mixin(enumMixinStr___SYSCALL_ULONG_TYPE); })))
        {
            mixin(enumMixinStr___SYSCALL_ULONG_TYPE);
        }
    }

    static if (!is(typeof(__DEV_T_TYPE)))
    {
        private enum enumMixinStr___DEV_T_TYPE = `enum __DEV_T_TYPE = unsigned long int;`;
        static if (is(typeof({ mixin(enumMixinStr___DEV_T_TYPE); })))
        {
            mixin(enumMixinStr___DEV_T_TYPE);
        }
    }

    static if (!is(typeof(__UID_T_TYPE)))
    {
        private enum enumMixinStr___UID_T_TYPE = `enum __UID_T_TYPE = unsigned int;`;
        static if (is(typeof({ mixin(enumMixinStr___UID_T_TYPE); })))
        {
            mixin(enumMixinStr___UID_T_TYPE);
        }
    }

    static if (!is(typeof(__GID_T_TYPE)))
    {
        private enum enumMixinStr___GID_T_TYPE = `enum __GID_T_TYPE = unsigned int;`;
        static if (is(typeof({ mixin(enumMixinStr___GID_T_TYPE); })))
        {
            mixin(enumMixinStr___GID_T_TYPE);
        }
    }

    static if (!is(typeof(__INO_T_TYPE)))
    {
        private enum enumMixinStr___INO_T_TYPE = `enum __INO_T_TYPE = unsigned long int;`;
        static if (is(typeof({ mixin(enumMixinStr___INO_T_TYPE); })))
        {
            mixin(enumMixinStr___INO_T_TYPE);
        }
    }

    static if (!is(typeof(__INO64_T_TYPE)))
    {
        private enum enumMixinStr___INO64_T_TYPE = `enum __INO64_T_TYPE = unsigned long int;`;
        static if (is(typeof({ mixin(enumMixinStr___INO64_T_TYPE); })))
        {
            mixin(enumMixinStr___INO64_T_TYPE);
        }
    }

    static if (!is(typeof(__MODE_T_TYPE)))
    {
        private enum enumMixinStr___MODE_T_TYPE = `enum __MODE_T_TYPE = unsigned int;`;
        static if (is(typeof({ mixin(enumMixinStr___MODE_T_TYPE); })))
        {
            mixin(enumMixinStr___MODE_T_TYPE);
        }
    }

    static if (!is(typeof(INT_FAST64_MAX)))
    {
        private enum enumMixinStr_INT_FAST64_MAX = `enum INT_FAST64_MAX = ( 9223372036854775807L );`;
        static if (is(typeof({ mixin(enumMixinStr_INT_FAST64_MAX); })))
        {
            mixin(enumMixinStr_INT_FAST64_MAX);
        }
    }

    static if (!is(typeof(__NLINK_T_TYPE)))
    {
        private enum enumMixinStr___NLINK_T_TYPE = `enum __NLINK_T_TYPE = unsigned long int;`;
        static if (is(typeof({ mixin(enumMixinStr___NLINK_T_TYPE); })))
        {
            mixin(enumMixinStr___NLINK_T_TYPE);
        }
    }

    static if (!is(typeof(__FSWORD_T_TYPE)))
    {
        private enum enumMixinStr___FSWORD_T_TYPE = `enum __FSWORD_T_TYPE = long int;`;
        static if (is(typeof({ mixin(enumMixinStr___FSWORD_T_TYPE); })))
        {
            mixin(enumMixinStr___FSWORD_T_TYPE);
        }
    }

    static if (!is(typeof(__OFF_T_TYPE)))
    {
        private enum enumMixinStr___OFF_T_TYPE = `enum __OFF_T_TYPE = long int;`;
        static if (is(typeof({ mixin(enumMixinStr___OFF_T_TYPE); })))
        {
            mixin(enumMixinStr___OFF_T_TYPE);
        }
    }

    static if (!is(typeof(__OFF64_T_TYPE)))
    {
        private enum enumMixinStr___OFF64_T_TYPE = `enum __OFF64_T_TYPE = long int;`;
        static if (is(typeof({ mixin(enumMixinStr___OFF64_T_TYPE); })))
        {
            mixin(enumMixinStr___OFF64_T_TYPE);
        }
    }

    static if (!is(typeof(__PID_T_TYPE)))
    {
        private enum enumMixinStr___PID_T_TYPE = `enum __PID_T_TYPE = int;`;
        static if (is(typeof({ mixin(enumMixinStr___PID_T_TYPE); })))
        {
            mixin(enumMixinStr___PID_T_TYPE);
        }
    }

    static if (!is(typeof(__RLIM_T_TYPE)))
    {
        private enum enumMixinStr___RLIM_T_TYPE = `enum __RLIM_T_TYPE = unsigned long int;`;
        static if (is(typeof({ mixin(enumMixinStr___RLIM_T_TYPE); })))
        {
            mixin(enumMixinStr___RLIM_T_TYPE);
        }
    }

    static if (!is(typeof(__RLIM64_T_TYPE)))
    {
        private enum enumMixinStr___RLIM64_T_TYPE = `enum __RLIM64_T_TYPE = unsigned long int;`;
        static if (is(typeof({ mixin(enumMixinStr___RLIM64_T_TYPE); })))
        {
            mixin(enumMixinStr___RLIM64_T_TYPE);
        }
    }

    static if (!is(typeof(__BLKCNT_T_TYPE)))
    {
        private enum enumMixinStr___BLKCNT_T_TYPE = `enum __BLKCNT_T_TYPE = long int;`;
        static if (is(typeof({ mixin(enumMixinStr___BLKCNT_T_TYPE); })))
        {
            mixin(enumMixinStr___BLKCNT_T_TYPE);
        }
    }

    static if (!is(typeof(__BLKCNT64_T_TYPE)))
    {
        private enum enumMixinStr___BLKCNT64_T_TYPE = `enum __BLKCNT64_T_TYPE = long int;`;
        static if (is(typeof({ mixin(enumMixinStr___BLKCNT64_T_TYPE); })))
        {
            mixin(enumMixinStr___BLKCNT64_T_TYPE);
        }
    }

    static if (!is(typeof(__FSBLKCNT_T_TYPE)))
    {
        private enum enumMixinStr___FSBLKCNT_T_TYPE = `enum __FSBLKCNT_T_TYPE = unsigned long int;`;
        static if (is(typeof({ mixin(enumMixinStr___FSBLKCNT_T_TYPE); })))
        {
            mixin(enumMixinStr___FSBLKCNT_T_TYPE);
        }
    }

    static if (!is(typeof(__FSBLKCNT64_T_TYPE)))
    {
        private enum enumMixinStr___FSBLKCNT64_T_TYPE = `enum __FSBLKCNT64_T_TYPE = unsigned long int;`;
        static if (is(typeof({ mixin(enumMixinStr___FSBLKCNT64_T_TYPE); })))
        {
            mixin(enumMixinStr___FSBLKCNT64_T_TYPE);
        }
    }

    static if (!is(typeof(__FSFILCNT_T_TYPE)))
    {
        private enum enumMixinStr___FSFILCNT_T_TYPE = `enum __FSFILCNT_T_TYPE = unsigned long int;`;
        static if (is(typeof({ mixin(enumMixinStr___FSFILCNT_T_TYPE); })))
        {
            mixin(enumMixinStr___FSFILCNT_T_TYPE);
        }
    }

    static if (!is(typeof(__FSFILCNT64_T_TYPE)))
    {
        private enum enumMixinStr___FSFILCNT64_T_TYPE = `enum __FSFILCNT64_T_TYPE = unsigned long int;`;
        static if (is(typeof({ mixin(enumMixinStr___FSFILCNT64_T_TYPE); })))
        {
            mixin(enumMixinStr___FSFILCNT64_T_TYPE);
        }
    }

    static if (!is(typeof(__ID_T_TYPE)))
    {
        private enum enumMixinStr___ID_T_TYPE = `enum __ID_T_TYPE = unsigned int;`;
        static if (is(typeof({ mixin(enumMixinStr___ID_T_TYPE); })))
        {
            mixin(enumMixinStr___ID_T_TYPE);
        }
    }

    static if (!is(typeof(__CLOCK_T_TYPE)))
    {
        private enum enumMixinStr___CLOCK_T_TYPE = `enum __CLOCK_T_TYPE = long int;`;
        static if (is(typeof({ mixin(enumMixinStr___CLOCK_T_TYPE); })))
        {
            mixin(enumMixinStr___CLOCK_T_TYPE);
        }
    }

    static if (!is(typeof(__TIME_T_TYPE)))
    {
        private enum enumMixinStr___TIME_T_TYPE = `enum __TIME_T_TYPE = long int;`;
        static if (is(typeof({ mixin(enumMixinStr___TIME_T_TYPE); })))
        {
            mixin(enumMixinStr___TIME_T_TYPE);
        }
    }

    static if (!is(typeof(__USECONDS_T_TYPE)))
    {
        private enum enumMixinStr___USECONDS_T_TYPE = `enum __USECONDS_T_TYPE = unsigned int;`;
        static if (is(typeof({ mixin(enumMixinStr___USECONDS_T_TYPE); })))
        {
            mixin(enumMixinStr___USECONDS_T_TYPE);
        }
    }

    static if (!is(typeof(__SUSECONDS_T_TYPE)))
    {
        private enum enumMixinStr___SUSECONDS_T_TYPE = `enum __SUSECONDS_T_TYPE = long int;`;
        static if (is(typeof({ mixin(enumMixinStr___SUSECONDS_T_TYPE); })))
        {
            mixin(enumMixinStr___SUSECONDS_T_TYPE);
        }
    }

    static if (!is(typeof(__DADDR_T_TYPE)))
    {
        private enum enumMixinStr___DADDR_T_TYPE = `enum __DADDR_T_TYPE = int;`;
        static if (is(typeof({ mixin(enumMixinStr___DADDR_T_TYPE); })))
        {
            mixin(enumMixinStr___DADDR_T_TYPE);
        }
    }

    static if (!is(typeof(__KEY_T_TYPE)))
    {
        private enum enumMixinStr___KEY_T_TYPE = `enum __KEY_T_TYPE = int;`;
        static if (is(typeof({ mixin(enumMixinStr___KEY_T_TYPE); })))
        {
            mixin(enumMixinStr___KEY_T_TYPE);
        }
    }

    static if (!is(typeof(__CLOCKID_T_TYPE)))
    {
        private enum enumMixinStr___CLOCKID_T_TYPE = `enum __CLOCKID_T_TYPE = int;`;
        static if (is(typeof({ mixin(enumMixinStr___CLOCKID_T_TYPE); })))
        {
            mixin(enumMixinStr___CLOCKID_T_TYPE);
        }
    }

    static if (!is(typeof(__TIMER_T_TYPE)))
    {
        private enum enumMixinStr___TIMER_T_TYPE = `enum __TIMER_T_TYPE = void *;`;
        static if (is(typeof({ mixin(enumMixinStr___TIMER_T_TYPE); })))
        {
            mixin(enumMixinStr___TIMER_T_TYPE);
        }
    }

    static if (!is(typeof(__BLKSIZE_T_TYPE)))
    {
        private enum enumMixinStr___BLKSIZE_T_TYPE = `enum __BLKSIZE_T_TYPE = long int;`;
        static if (is(typeof({ mixin(enumMixinStr___BLKSIZE_T_TYPE); })))
        {
            mixin(enumMixinStr___BLKSIZE_T_TYPE);
        }
    }

    static if (!is(typeof(__FSID_T_TYPE)))
    {
        private enum enumMixinStr___FSID_T_TYPE = `enum __FSID_T_TYPE = { int __val [ 2 ] ; };`;
        static if (is(typeof({ mixin(enumMixinStr___FSID_T_TYPE); })))
        {
            mixin(enumMixinStr___FSID_T_TYPE);
        }
    }

    static if (!is(typeof(__SSIZE_T_TYPE)))
    {
        private enum enumMixinStr___SSIZE_T_TYPE = `enum __SSIZE_T_TYPE = long int;`;
        static if (is(typeof({ mixin(enumMixinStr___SSIZE_T_TYPE); })))
        {
            mixin(enumMixinStr___SSIZE_T_TYPE);
        }
    }

    static if (!is(typeof(__CPU_MASK_TYPE)))
    {
        private enum enumMixinStr___CPU_MASK_TYPE = `enum __CPU_MASK_TYPE = unsigned long int;`;
        static if (is(typeof({ mixin(enumMixinStr___CPU_MASK_TYPE); })))
        {
            mixin(enumMixinStr___CPU_MASK_TYPE);
        }
    }

    static if (!is(typeof(INT_FAST32_MAX)))
    {
        private enum enumMixinStr_INT_FAST32_MAX = `enum INT_FAST32_MAX = ( 9223372036854775807L );`;
        static if (is(typeof({ mixin(enumMixinStr_INT_FAST32_MAX); })))
        {
            mixin(enumMixinStr_INT_FAST32_MAX);
        }
    }

    static if (!is(typeof(__OFF_T_MATCHES_OFF64_T)))
    {
        private enum enumMixinStr___OFF_T_MATCHES_OFF64_T = `enum __OFF_T_MATCHES_OFF64_T = 1;`;
        static if (is(typeof({ mixin(enumMixinStr___OFF_T_MATCHES_OFF64_T); })))
        {
            mixin(enumMixinStr___OFF_T_MATCHES_OFF64_T);
        }
    }

    static if (!is(typeof(__INO_T_MATCHES_INO64_T)))
    {
        private enum enumMixinStr___INO_T_MATCHES_INO64_T = `enum __INO_T_MATCHES_INO64_T = 1;`;
        static if (is(typeof({ mixin(enumMixinStr___INO_T_MATCHES_INO64_T); })))
        {
            mixin(enumMixinStr___INO_T_MATCHES_INO64_T);
        }
    }

    static if (!is(typeof(__RLIM_T_MATCHES_RLIM64_T)))
    {
        private enum enumMixinStr___RLIM_T_MATCHES_RLIM64_T = `enum __RLIM_T_MATCHES_RLIM64_T = 1;`;
        static if (is(typeof({ mixin(enumMixinStr___RLIM_T_MATCHES_RLIM64_T); })))
        {
            mixin(enumMixinStr___RLIM_T_MATCHES_RLIM64_T);
        }
    }

    static if (!is(typeof(__STATFS_MATCHES_STATFS64)))
    {
        private enum enumMixinStr___STATFS_MATCHES_STATFS64 = `enum __STATFS_MATCHES_STATFS64 = 1;`;
        static if (is(typeof({ mixin(enumMixinStr___STATFS_MATCHES_STATFS64); })))
        {
            mixin(enumMixinStr___STATFS_MATCHES_STATFS64);
        }
    }

    static if (!is(typeof(__FD_SETSIZE)))
    {
        private enum enumMixinStr___FD_SETSIZE = `enum __FD_SETSIZE = 1024;`;
        static if (is(typeof({ mixin(enumMixinStr___FD_SETSIZE); })))
        {
            mixin(enumMixinStr___FD_SETSIZE);
        }
    }

    static if (!is(typeof(INT_FAST16_MAX)))
    {
        private enum enumMixinStr_INT_FAST16_MAX = `enum INT_FAST16_MAX = ( 9223372036854775807L );`;
        static if (is(typeof({ mixin(enumMixinStr_INT_FAST16_MAX); })))
        {
            mixin(enumMixinStr_INT_FAST16_MAX);
        }
    }

    static if (!is(typeof(_BITS_UINTN_IDENTITY_H)))
    {
        private enum enumMixinStr__BITS_UINTN_IDENTITY_H = `enum _BITS_UINTN_IDENTITY_H = 1;`;
        static if (is(typeof({ mixin(enumMixinStr__BITS_UINTN_IDENTITY_H); })))
        {
            mixin(enumMixinStr__BITS_UINTN_IDENTITY_H);
        }
    }

    static if (!is(typeof(INT_FAST8_MAX)))
    {
        private enum enumMixinStr_INT_FAST8_MAX = `enum INT_FAST8_MAX = ( 127 );`;
        static if (is(typeof({ mixin(enumMixinStr_INT_FAST8_MAX); })))
        {
            mixin(enumMixinStr_INT_FAST8_MAX);
        }
    }

    static if (!is(typeof(INT_FAST64_MIN)))
    {
        private enum enumMixinStr_INT_FAST64_MIN = `enum INT_FAST64_MIN = ( - 9223372036854775807L - 1 );`;
        static if (is(typeof({ mixin(enumMixinStr_INT_FAST64_MIN); })))
        {
            mixin(enumMixinStr_INT_FAST64_MIN);
        }
    }

    static if (!is(typeof(INT_FAST32_MIN)))
    {
        private enum enumMixinStr_INT_FAST32_MIN = `enum INT_FAST32_MIN = ( - 9223372036854775807L - 1 );`;
        static if (is(typeof({ mixin(enumMixinStr_INT_FAST32_MIN); })))
        {
            mixin(enumMixinStr_INT_FAST32_MIN);
        }
    }

    static if (!is(typeof(INT_FAST16_MIN)))
    {
        private enum enumMixinStr_INT_FAST16_MIN = `enum INT_FAST16_MIN = ( - 9223372036854775807L - 1 );`;
        static if (is(typeof({ mixin(enumMixinStr_INT_FAST16_MIN); })))
        {
            mixin(enumMixinStr_INT_FAST16_MIN);
        }
    }

    static if (!is(typeof(_BITS_WCHAR_H)))
    {
        private enum enumMixinStr__BITS_WCHAR_H = `enum _BITS_WCHAR_H = 1;`;
        static if (is(typeof({ mixin(enumMixinStr__BITS_WCHAR_H); })))
        {
            mixin(enumMixinStr__BITS_WCHAR_H);
        }
    }

    static if (!is(typeof(INT_FAST8_MIN)))
    {
        private enum enumMixinStr_INT_FAST8_MIN = `enum INT_FAST8_MIN = ( - 128 );`;
        static if (is(typeof({ mixin(enumMixinStr_INT_FAST8_MIN); })))
        {
            mixin(enumMixinStr_INT_FAST8_MIN);
        }
    }

    static if (!is(typeof(__WCHAR_MAX)))
    {
        private enum enumMixinStr___WCHAR_MAX = `enum __WCHAR_MAX = 0x7fffffff;`;
        static if (is(typeof({ mixin(enumMixinStr___WCHAR_MAX); })))
        {
            mixin(enumMixinStr___WCHAR_MAX);
        }
    }

    static if (!is(typeof(__WCHAR_MIN)))
    {
        private enum enumMixinStr___WCHAR_MIN = `enum __WCHAR_MIN = ( - 0x7fffffff - 1 );`;
        static if (is(typeof({ mixin(enumMixinStr___WCHAR_MIN); })))
        {
            mixin(enumMixinStr___WCHAR_MIN);
        }
    }

    static if (!is(typeof(UINT_LEAST64_MAX)))
    {
        private enum enumMixinStr_UINT_LEAST64_MAX = `enum UINT_LEAST64_MAX = ( 18446744073709551615UL );`;
        static if (is(typeof({ mixin(enumMixinStr_UINT_LEAST64_MAX); })))
        {
            mixin(enumMixinStr_UINT_LEAST64_MAX);
        }
    }

    static if (!is(typeof(UINT_LEAST32_MAX)))
    {
        private enum enumMixinStr_UINT_LEAST32_MAX = `enum UINT_LEAST32_MAX = ( 4294967295U );`;
        static if (is(typeof({ mixin(enumMixinStr_UINT_LEAST32_MAX); })))
        {
            mixin(enumMixinStr_UINT_LEAST32_MAX);
        }
    }

    static if (!is(typeof(UINT_LEAST16_MAX)))
    {
        private enum enumMixinStr_UINT_LEAST16_MAX = `enum UINT_LEAST16_MAX = ( 65535 );`;
        static if (is(typeof({ mixin(enumMixinStr_UINT_LEAST16_MAX); })))
        {
            mixin(enumMixinStr_UINT_LEAST16_MAX);
        }
    }

    static if (!is(typeof(UINT_LEAST8_MAX)))
    {
        private enum enumMixinStr_UINT_LEAST8_MAX = `enum UINT_LEAST8_MAX = ( 255 );`;
        static if (is(typeof({ mixin(enumMixinStr_UINT_LEAST8_MAX); })))
        {
            mixin(enumMixinStr_UINT_LEAST8_MAX);
        }
    }

    static if (!is(typeof(INT_LEAST64_MAX)))
    {
        private enum enumMixinStr_INT_LEAST64_MAX = `enum INT_LEAST64_MAX = ( 9223372036854775807L );`;
        static if (is(typeof({ mixin(enumMixinStr_INT_LEAST64_MAX); })))
        {
            mixin(enumMixinStr_INT_LEAST64_MAX);
        }
    }

    static if (!is(typeof(__WORDSIZE)))
    {
        private enum enumMixinStr___WORDSIZE = `enum __WORDSIZE = 64;`;
        static if (is(typeof({ mixin(enumMixinStr___WORDSIZE); })))
        {
            mixin(enumMixinStr___WORDSIZE);
        }
    }

    static if (!is(typeof(INT_LEAST32_MAX)))
    {
        private enum enumMixinStr_INT_LEAST32_MAX = `enum INT_LEAST32_MAX = ( 2147483647 );`;
        static if (is(typeof({ mixin(enumMixinStr_INT_LEAST32_MAX); })))
        {
            mixin(enumMixinStr_INT_LEAST32_MAX);
        }
    }

    static if (!is(typeof(INT_LEAST16_MAX)))
    {
        private enum enumMixinStr_INT_LEAST16_MAX = `enum INT_LEAST16_MAX = ( 32767 );`;
        static if (is(typeof({ mixin(enumMixinStr_INT_LEAST16_MAX); })))
        {
            mixin(enumMixinStr_INT_LEAST16_MAX);
        }
    }

    static if (!is(typeof(INT_LEAST8_MAX)))
    {
        private enum enumMixinStr_INT_LEAST8_MAX = `enum INT_LEAST8_MAX = ( 127 );`;
        static if (is(typeof({ mixin(enumMixinStr_INT_LEAST8_MAX); })))
        {
            mixin(enumMixinStr_INT_LEAST8_MAX);
        }
    }

    static if (!is(typeof(INT_LEAST64_MIN)))
    {
        private enum enumMixinStr_INT_LEAST64_MIN = `enum INT_LEAST64_MIN = ( - 9223372036854775807L - 1 );`;
        static if (is(typeof({ mixin(enumMixinStr_INT_LEAST64_MIN); })))
        {
            mixin(enumMixinStr_INT_LEAST64_MIN);
        }
    }

    static if (!is(typeof(INT_LEAST32_MIN)))
    {
        private enum enumMixinStr_INT_LEAST32_MIN = `enum INT_LEAST32_MIN = ( - 2147483647 - 1 );`;
        static if (is(typeof({ mixin(enumMixinStr_INT_LEAST32_MIN); })))
        {
            mixin(enumMixinStr_INT_LEAST32_MIN);
        }
    }

    static if (!is(typeof(__WORDSIZE_TIME64_COMPAT32)))
    {
        private enum enumMixinStr___WORDSIZE_TIME64_COMPAT32 = `enum __WORDSIZE_TIME64_COMPAT32 = 1;`;
        static if (is(typeof({ mixin(enumMixinStr___WORDSIZE_TIME64_COMPAT32); })))
        {
            mixin(enumMixinStr___WORDSIZE_TIME64_COMPAT32);
        }
    }

    static if (!is(typeof(__SYSCALL_WORDSIZE)))
    {
        private enum enumMixinStr___SYSCALL_WORDSIZE = `enum __SYSCALL_WORDSIZE = 64;`;
        static if (is(typeof({ mixin(enumMixinStr___SYSCALL_WORDSIZE); })))
        {
            mixin(enumMixinStr___SYSCALL_WORDSIZE);
        }
    }
    static if (!is(typeof(INT_LEAST16_MIN)))
    {
        private enum enumMixinStr_INT_LEAST16_MIN = `enum INT_LEAST16_MIN = ( - 32767 - 1 );`;
        static if (is(typeof({ mixin(enumMixinStr_INT_LEAST16_MIN); })))
        {
            mixin(enumMixinStr_INT_LEAST16_MIN);
        }
    }

    static if (!is(typeof(INT_LEAST8_MIN)))
    {
        private enum enumMixinStr_INT_LEAST8_MIN = `enum INT_LEAST8_MIN = ( - 128 );`;
        static if (is(typeof({ mixin(enumMixinStr_INT_LEAST8_MIN); })))
        {
            mixin(enumMixinStr_INT_LEAST8_MIN);
        }
    }

    static if (!is(typeof(UINT64_MAX)))
    {
        private enum enumMixinStr_UINT64_MAX = `enum UINT64_MAX = ( 18446744073709551615UL );`;
        static if (is(typeof({ mixin(enumMixinStr_UINT64_MAX); })))
        {
            mixin(enumMixinStr_UINT64_MAX);
        }
    }

    static if (!is(typeof(UINT32_MAX)))
    {
        private enum enumMixinStr_UINT32_MAX = `enum UINT32_MAX = ( 4294967295U );`;
        static if (is(typeof({ mixin(enumMixinStr_UINT32_MAX); })))
        {
            mixin(enumMixinStr_UINT32_MAX);
        }
    }

    static if (!is(typeof(UINT16_MAX)))
    {
        private enum enumMixinStr_UINT16_MAX = `enum UINT16_MAX = ( 65535 );`;
        static if (is(typeof({ mixin(enumMixinStr_UINT16_MAX); })))
        {
            mixin(enumMixinStr_UINT16_MAX);
        }
    }

    static if (!is(typeof(_SYS_CDEFS_H)))
    {
        private enum enumMixinStr__SYS_CDEFS_H = `enum _SYS_CDEFS_H = 1;`;
        static if (is(typeof({ mixin(enumMixinStr__SYS_CDEFS_H); })))
        {
            mixin(enumMixinStr__SYS_CDEFS_H);
        }
    }

    static if (!is(typeof(UINT8_MAX)))
    {
        private enum enumMixinStr_UINT8_MAX = `enum UINT8_MAX = ( 255 );`;
        static if (is(typeof({ mixin(enumMixinStr_UINT8_MAX); })))
        {
            mixin(enumMixinStr_UINT8_MAX);
        }
    }

    static if (!is(typeof(INT64_MAX)))
    {
        private enum enumMixinStr_INT64_MAX = `enum INT64_MAX = ( 9223372036854775807L );`;
        static if (is(typeof({ mixin(enumMixinStr_INT64_MAX); })))
        {
            mixin(enumMixinStr_INT64_MAX);
        }
    }

    static if (!is(typeof(INT32_MAX)))
    {
        private enum enumMixinStr_INT32_MAX = `enum INT32_MAX = ( 2147483647 );`;
        static if (is(typeof({ mixin(enumMixinStr_INT32_MAX); })))
        {
            mixin(enumMixinStr_INT32_MAX);
        }
    }

    static if (!is(typeof(INT16_MAX)))
    {
        private enum enumMixinStr_INT16_MAX = `enum INT16_MAX = ( 32767 );`;
        static if (is(typeof({ mixin(enumMixinStr_INT16_MAX); })))
        {
            mixin(enumMixinStr_INT16_MAX);
        }
    }

    static if (!is(typeof(INT8_MAX)))
    {
        private enum enumMixinStr_INT8_MAX = `enum INT8_MAX = ( 127 );`;
        static if (is(typeof({ mixin(enumMixinStr_INT8_MAX); })))
        {
            mixin(enumMixinStr_INT8_MAX);
        }
    }
    static if (!is(typeof(INT64_MIN)))
    {
        private enum enumMixinStr_INT64_MIN = `enum INT64_MIN = ( - 9223372036854775807L - 1 );`;
        static if (is(typeof({ mixin(enumMixinStr_INT64_MIN); })))
        {
            mixin(enumMixinStr_INT64_MIN);
        }
    }

    static if (!is(typeof(__THROW)))
    {
        private enum enumMixinStr___THROW = `enum __THROW = __attribute__ ( ( __nothrow__ ) );`;
        static if (is(typeof({ mixin(enumMixinStr___THROW); })))
        {
            mixin(enumMixinStr___THROW);
        }
    }

    static if (!is(typeof(__THROWNL)))
    {
        private enum enumMixinStr___THROWNL = `enum __THROWNL = __attribute__ ( ( __nothrow__ ) );`;
        static if (is(typeof({ mixin(enumMixinStr___THROWNL); })))
        {
            mixin(enumMixinStr___THROWNL);
        }
    }
    static if (!is(typeof(INT32_MIN)))
    {
        private enum enumMixinStr_INT32_MIN = `enum INT32_MIN = ( - 2147483647 - 1 );`;
        static if (is(typeof({ mixin(enumMixinStr_INT32_MIN); })))
        {
            mixin(enumMixinStr_INT32_MIN);
        }
    }

    static if (!is(typeof(INT16_MIN)))
    {
        private enum enumMixinStr_INT16_MIN = `enum INT16_MIN = ( - 32767 - 1 );`;
        static if (is(typeof({ mixin(enumMixinStr_INT16_MIN); })))
        {
            mixin(enumMixinStr_INT16_MIN);
        }
    }
    static if (!is(typeof(__ptr_t)))
    {
        private enum enumMixinStr___ptr_t = `enum __ptr_t = void *;`;
        static if (is(typeof({ mixin(enumMixinStr___ptr_t); })))
        {
            mixin(enumMixinStr___ptr_t);
        }
    }
    static if (!is(typeof(INT8_MIN)))
    {
        private enum enumMixinStr_INT8_MIN = `enum INT8_MIN = ( - 128 );`;
        static if (is(typeof({ mixin(enumMixinStr_INT8_MIN); })))
        {
            mixin(enumMixinStr_INT8_MIN);
        }
    }
    static if (!is(typeof(__flexarr)))
    {
        private enum enumMixinStr___flexarr = `enum __flexarr = [ ];`;
        static if (is(typeof({ mixin(enumMixinStr___flexarr); })))
        {
            mixin(enumMixinStr___flexarr);
        }
    }

    static if (!is(typeof(__glibc_c99_flexarr_available)))
    {
        private enum enumMixinStr___glibc_c99_flexarr_available = `enum __glibc_c99_flexarr_available = 1;`;
        static if (is(typeof({
                    mixin(enumMixinStr___glibc_c99_flexarr_available);
                })))
        {
            mixin(enumMixinStr___glibc_c99_flexarr_available);
        }
    }
    static if (!is(typeof(_STDINT_H)))
    {
        private enum enumMixinStr__STDINT_H = `enum _STDINT_H = 1;`;
        static if (is(typeof({ mixin(enumMixinStr__STDINT_H); })))
        {
            mixin(enumMixinStr__STDINT_H);
        }
    }

    static if (!is(typeof(__attribute_malloc__)))
    {
        private enum enumMixinStr___attribute_malloc__ = `enum __attribute_malloc__ = __attribute__ ( ( __malloc__ ) );`;
        static if (is(typeof({ mixin(enumMixinStr___attribute_malloc__); })))
        {
            mixin(enumMixinStr___attribute_malloc__);
        }
    }

    static if (!is(typeof(_STDC_PREDEF_H)))
    {
        private enum enumMixinStr__STDC_PREDEF_H = `enum _STDC_PREDEF_H = 1;`;
        static if (is(typeof({ mixin(enumMixinStr__STDC_PREDEF_H); })))
        {
            mixin(enumMixinStr__STDC_PREDEF_H);
        }
    }

    static if (!is(typeof(__attribute_pure__)))
    {
        private enum enumMixinStr___attribute_pure__ = `enum __attribute_pure__ = __attribute__ ( ( __pure__ ) );`;
        static if (is(typeof({ mixin(enumMixinStr___attribute_pure__); })))
        {
            mixin(enumMixinStr___attribute_pure__);
        }
    }

    static if (!is(typeof(__attribute_const__)))
    {
        private enum enumMixinStr___attribute_const__ = `enum __attribute_const__ = __attribute__ ( cast( __const__ ) );`;
        static if (is(typeof({ mixin(enumMixinStr___attribute_const__); })))
        {
            mixin(enumMixinStr___attribute_const__);
        }
    }

    static if (!is(typeof(__GLIBC_MINOR__)))
    {
        private enum enumMixinStr___GLIBC_MINOR__ = `enum __GLIBC_MINOR__ = 31;`;
        static if (is(typeof({ mixin(enumMixinStr___GLIBC_MINOR__); })))
        {
            mixin(enumMixinStr___GLIBC_MINOR__);
        }
    }

    static if (!is(typeof(__attribute_used__)))
    {
        private enum enumMixinStr___attribute_used__ = `enum __attribute_used__ = __attribute__ ( ( __used__ ) );`;
        static if (is(typeof({ mixin(enumMixinStr___attribute_used__); })))
        {
            mixin(enumMixinStr___attribute_used__);
        }
    }

    static if (!is(typeof(__attribute_noinline__)))
    {
        private enum enumMixinStr___attribute_noinline__ = `enum __attribute_noinline__ = __attribute__ ( ( __noinline__ ) );`;
        static if (is(typeof({ mixin(enumMixinStr___attribute_noinline__); })))
        {
            mixin(enumMixinStr___attribute_noinline__);
        }
    }

    static if (!is(typeof(__GLIBC__)))
    {
        private enum enumMixinStr___GLIBC__ = `enum __GLIBC__ = 2;`;
        static if (is(typeof({ mixin(enumMixinStr___GLIBC__); })))
        {
            mixin(enumMixinStr___GLIBC__);
        }
    }

    static if (!is(typeof(__attribute_deprecated__)))
    {
        private enum enumMixinStr___attribute_deprecated__ = `enum __attribute_deprecated__ = __attribute__ ( ( __deprecated__ ) );`;
        static if (is(typeof({ mixin(enumMixinStr___attribute_deprecated__); })))
        {
            mixin(enumMixinStr___attribute_deprecated__);
        }
    }

    static if (!is(typeof(__GNU_LIBRARY__)))
    {
        private enum enumMixinStr___GNU_LIBRARY__ = `enum __GNU_LIBRARY__ = 6;`;
        static if (is(typeof({ mixin(enumMixinStr___GNU_LIBRARY__); })))
        {
            mixin(enumMixinStr___GNU_LIBRARY__);
        }
    }

    static if (!is(typeof(__GLIBC_USE_DEPRECATED_SCANF)))
    {
        private enum enumMixinStr___GLIBC_USE_DEPRECATED_SCANF = `enum __GLIBC_USE_DEPRECATED_SCANF = 0;`;
        static if (is(typeof({ mixin(enumMixinStr___GLIBC_USE_DEPRECATED_SCANF); })))
        {
            mixin(enumMixinStr___GLIBC_USE_DEPRECATED_SCANF);
        }
    }

    static if (!is(typeof(__GLIBC_USE_DEPRECATED_GETS)))
    {
        private enum enumMixinStr___GLIBC_USE_DEPRECATED_GETS = `enum __GLIBC_USE_DEPRECATED_GETS = 0;`;
        static if (is(typeof({ mixin(enumMixinStr___GLIBC_USE_DEPRECATED_GETS); })))
        {
            mixin(enumMixinStr___GLIBC_USE_DEPRECATED_GETS);
        }
    }

    static if (!is(typeof(__USE_FORTIFY_LEVEL)))
    {
        private enum enumMixinStr___USE_FORTIFY_LEVEL = `enum __USE_FORTIFY_LEVEL = 0;`;
        static if (is(typeof({ mixin(enumMixinStr___USE_FORTIFY_LEVEL); })))
        {
            mixin(enumMixinStr___USE_FORTIFY_LEVEL);
        }
    }

    static if (!is(typeof(__USE_ATFILE)))
    {
        private enum enumMixinStr___USE_ATFILE = `enum __USE_ATFILE = 1;`;
        static if (is(typeof({ mixin(enumMixinStr___USE_ATFILE); })))
        {
            mixin(enumMixinStr___USE_ATFILE);
        }
    }

    static if (!is(typeof(__USE_MISC)))
    {
        private enum enumMixinStr___USE_MISC = `enum __USE_MISC = 1;`;
        static if (is(typeof({ mixin(enumMixinStr___USE_MISC); })))
        {
            mixin(enumMixinStr___USE_MISC);
        }
    }

    static if (!is(typeof(__attribute_warn_unused_result__)))
    {
        private enum enumMixinStr___attribute_warn_unused_result__ = `enum __attribute_warn_unused_result__ = __attribute__ ( ( __warn_unused_result__ ) );`;
        static if (is(typeof({
                    mixin(enumMixinStr___attribute_warn_unused_result__);
                })))
        {
            mixin(enumMixinStr___attribute_warn_unused_result__);
        }
    }

    static if (!is(typeof(_ATFILE_SOURCE)))
    {
        private enum enumMixinStr__ATFILE_SOURCE = `enum _ATFILE_SOURCE = 1;`;
        static if (is(typeof({ mixin(enumMixinStr__ATFILE_SOURCE); })))
        {
            mixin(enumMixinStr__ATFILE_SOURCE);
        }
    }

    static if (!is(typeof(__USE_XOPEN2K8)))
    {
        private enum enumMixinStr___USE_XOPEN2K8 = `enum __USE_XOPEN2K8 = 1;`;
        static if (is(typeof({ mixin(enumMixinStr___USE_XOPEN2K8); })))
        {
            mixin(enumMixinStr___USE_XOPEN2K8);
        }
    }

    static if (!is(typeof(__always_inline)))
    {
        private enum enumMixinStr___always_inline = `enum __always_inline = __inline __attribute__ ( ( __always_inline__ ) );`;
        static if (is(typeof({ mixin(enumMixinStr___always_inline); })))
        {
            mixin(enumMixinStr___always_inline);
        }
    }

    static if (!is(typeof(__USE_ISOC99)))
    {
        private enum enumMixinStr___USE_ISOC99 = `enum __USE_ISOC99 = 1;`;
        static if (is(typeof({ mixin(enumMixinStr___USE_ISOC99); })))
        {
            mixin(enumMixinStr___USE_ISOC99);
        }
    }

    static if (!is(typeof(__USE_ISOC95)))
    {
        private enum enumMixinStr___USE_ISOC95 = `enum __USE_ISOC95 = 1;`;
        static if (is(typeof({ mixin(enumMixinStr___USE_ISOC95); })))
        {
            mixin(enumMixinStr___USE_ISOC95);
        }
    }

    static if (!is(typeof(__USE_XOPEN2K)))
    {
        private enum enumMixinStr___USE_XOPEN2K = `enum __USE_XOPEN2K = 1;`;
        static if (is(typeof({ mixin(enumMixinStr___USE_XOPEN2K); })))
        {
            mixin(enumMixinStr___USE_XOPEN2K);
        }
    }

    static if (!is(typeof(__USE_POSIX199506)))
    {
        private enum enumMixinStr___USE_POSIX199506 = `enum __USE_POSIX199506 = 1;`;
        static if (is(typeof({ mixin(enumMixinStr___USE_POSIX199506); })))
        {
            mixin(enumMixinStr___USE_POSIX199506);
        }
    }

    static if (!is(typeof(__USE_POSIX199309)))
    {
        private enum enumMixinStr___USE_POSIX199309 = `enum __USE_POSIX199309 = 1;`;
        static if (is(typeof({ mixin(enumMixinStr___USE_POSIX199309); })))
        {
            mixin(enumMixinStr___USE_POSIX199309);
        }
    }

    static if (!is(typeof(__extern_inline)))
    {
        private enum enumMixinStr___extern_inline = `enum __extern_inline = extern __inline __attribute__ ( ( __gnu_inline__ ) );`;
        static if (is(typeof({ mixin(enumMixinStr___extern_inline); })))
        {
            mixin(enumMixinStr___extern_inline);
        }
    }

    static if (!is(typeof(__extern_always_inline)))
    {
        private enum enumMixinStr___extern_always_inline = `enum __extern_always_inline = extern __inline __attribute__ ( ( __always_inline__ ) ) __attribute__ ( ( __gnu_inline__ ) );`;
        static if (is(typeof({ mixin(enumMixinStr___extern_always_inline); })))
        {
            mixin(enumMixinStr___extern_always_inline);
        }
    }

    static if (!is(typeof(__USE_POSIX2)))
    {
        private enum enumMixinStr___USE_POSIX2 = `enum __USE_POSIX2 = 1;`;
        static if (is(typeof({ mixin(enumMixinStr___USE_POSIX2); })))
        {
            mixin(enumMixinStr___USE_POSIX2);
        }
    }

    static if (!is(typeof(__fortify_function)))
    {
        private enum enumMixinStr___fortify_function = `enum __fortify_function = extern __inline __attribute__ ( ( __always_inline__ ) ) __attribute__ ( ( __gnu_inline__ ) ) ;`;
        static if (is(typeof({ mixin(enumMixinStr___fortify_function); })))
        {
            mixin(enumMixinStr___fortify_function);
        }
    }

    static if (!is(typeof(__USE_POSIX)))
    {
        private enum enumMixinStr___USE_POSIX = `enum __USE_POSIX = 1;`;
        static if (is(typeof({ mixin(enumMixinStr___USE_POSIX); })))
        {
            mixin(enumMixinStr___USE_POSIX);
        }
    }

    static if (!is(typeof(_POSIX_C_SOURCE)))
    {
        private enum enumMixinStr__POSIX_C_SOURCE = `enum _POSIX_C_SOURCE = 200809L;`;
        static if (is(typeof({ mixin(enumMixinStr__POSIX_C_SOURCE); })))
        {
            mixin(enumMixinStr__POSIX_C_SOURCE);
        }
    }

    static if (!is(typeof(_POSIX_SOURCE)))
    {
        private enum enumMixinStr__POSIX_SOURCE = `enum _POSIX_SOURCE = 1;`;
        static if (is(typeof({ mixin(enumMixinStr__POSIX_SOURCE); })))
        {
            mixin(enumMixinStr__POSIX_SOURCE);
        }
    }

    static if (!is(typeof(__USE_POSIX_IMPLICITLY)))
    {
        private enum enumMixinStr___USE_POSIX_IMPLICITLY = `enum __USE_POSIX_IMPLICITLY = 1;`;
        static if (is(typeof({ mixin(enumMixinStr___USE_POSIX_IMPLICITLY); })))
        {
            mixin(enumMixinStr___USE_POSIX_IMPLICITLY);
        }
    }

    static if (!is(typeof(__restrict_arr)))
    {
        private enum enumMixinStr___restrict_arr = `enum __restrict_arr = __restrict;`;
        static if (is(typeof({ mixin(enumMixinStr___restrict_arr); })))
        {
            mixin(enumMixinStr___restrict_arr);
        }
    }
    static if (!is(typeof(__USE_ISOC11)))
    {
        private enum enumMixinStr___USE_ISOC11 = `enum __USE_ISOC11 = 1;`;
        static if (is(typeof({ mixin(enumMixinStr___USE_ISOC11); })))
        {
            mixin(enumMixinStr___USE_ISOC11);
        }
    }

    static if (!is(typeof(__GLIBC_USE_ISOC2X)))
    {
        private enum enumMixinStr___GLIBC_USE_ISOC2X = `enum __GLIBC_USE_ISOC2X = 0;`;
        static if (is(typeof({ mixin(enumMixinStr___GLIBC_USE_ISOC2X); })))
        {
            mixin(enumMixinStr___GLIBC_USE_ISOC2X);
        }
    }

    static if (!is(typeof(_DEFAULT_SOURCE)))
    {
        private enum enumMixinStr__DEFAULT_SOURCE = `enum _DEFAULT_SOURCE = 1;`;
        static if (is(typeof({ mixin(enumMixinStr__DEFAULT_SOURCE); })))
        {
            mixin(enumMixinStr__DEFAULT_SOURCE);
        }
    }
    static if (!is(typeof(_FEATURES_H)))
    {
        private enum enumMixinStr__FEATURES_H = `enum _FEATURES_H = 1;`;
        static if (is(typeof({ mixin(enumMixinStr__FEATURES_H); })))
        {
            mixin(enumMixinStr__FEATURES_H);
        }
    }
    static if (!is(typeof(__HAVE_GENERIC_SELECTION)))
    {
        private enum enumMixinStr___HAVE_GENERIC_SELECTION = `enum __HAVE_GENERIC_SELECTION = 1;`;
        static if (is(typeof({ mixin(enumMixinStr___HAVE_GENERIC_SELECTION); })))
        {
            mixin(enumMixinStr___HAVE_GENERIC_SELECTION);
        }
    }

    static if (!is(typeof(_SYS_SELECT_H)))
    {
        private enum enumMixinStr__SYS_SELECT_H = `enum _SYS_SELECT_H = 1;`;
        static if (is(typeof({ mixin(enumMixinStr__SYS_SELECT_H); })))
        {
            mixin(enumMixinStr__SYS_SELECT_H);
        }
    }

    static if (!is(typeof(BYTE_ORDER)))
    {
        private enum enumMixinStr_BYTE_ORDER = `enum BYTE_ORDER = 1234;`;
        static if (is(typeof({ mixin(enumMixinStr_BYTE_ORDER); })))
        {
            mixin(enumMixinStr_BYTE_ORDER);
        }
    }

    static if (!is(typeof(PDP_ENDIAN)))
    {
        private enum enumMixinStr_PDP_ENDIAN = `enum PDP_ENDIAN = 3412;`;
        static if (is(typeof({ mixin(enumMixinStr_PDP_ENDIAN); })))
        {
            mixin(enumMixinStr_PDP_ENDIAN);
        }
    }

    static if (!is(typeof(BIG_ENDIAN)))
    {
        private enum enumMixinStr_BIG_ENDIAN = `enum BIG_ENDIAN = 4321;`;
        static if (is(typeof({ mixin(enumMixinStr_BIG_ENDIAN); })))
        {
            mixin(enumMixinStr_BIG_ENDIAN);
        }
    }

    static if (!is(typeof(LITTLE_ENDIAN)))
    {
        private enum enumMixinStr_LITTLE_ENDIAN = `enum LITTLE_ENDIAN = 1234;`;
        static if (is(typeof({ mixin(enumMixinStr_LITTLE_ENDIAN); })))
        {
            mixin(enumMixinStr_LITTLE_ENDIAN);
        }
    }

    static if (!is(typeof(_ENDIAN_H)))
    {
        private enum enumMixinStr__ENDIAN_H = `enum _ENDIAN_H = 1;`;
        static if (is(typeof({ mixin(enumMixinStr__ENDIAN_H); })))
        {
            mixin(enumMixinStr__ENDIAN_H);
        }
    }

    static if (!is(typeof(__NFDBITS)))
    {
        private enum enumMixinStr___NFDBITS = `enum __NFDBITS = ( 8 * cast( int ) ( __fd_mask ) .sizeof );`;
        static if (is(typeof({ mixin(enumMixinStr___NFDBITS); })))
        {
            mixin(enumMixinStr___NFDBITS);
        }
    }
    static if (!is(typeof(FD_SETSIZE)))
    {
        private enum enumMixinStr_FD_SETSIZE = `enum FD_SETSIZE = 1024;`;
        static if (is(typeof({ mixin(enumMixinStr_FD_SETSIZE); })))
        {
            mixin(enumMixinStr_FD_SETSIZE);
        }
    }

    static if (!is(typeof(NFDBITS)))
    {
        private enum enumMixinStr_NFDBITS = `enum NFDBITS = ( 8 * cast( int ) ( __fd_mask ) .sizeof );`;
        static if (is(typeof({ mixin(enumMixinStr_NFDBITS); })))
        {
            mixin(enumMixinStr_NFDBITS);
        }
    }
    static if (!is(typeof(_SYS_TYPES_H)))
    {
        private enum enumMixinStr__SYS_TYPES_H = `enum _SYS_TYPES_H = 1;`;
        static if (is(typeof({ mixin(enumMixinStr__SYS_TYPES_H); })))
        {
            mixin(enumMixinStr__SYS_TYPES_H);
        }
    }
    static if (!is(typeof(__BIT_TYPES_DEFINED__)))
    {
        private enum enumMixinStr___BIT_TYPES_DEFINED__ = `enum __BIT_TYPES_DEFINED__ = 1;`;
        static if (is(typeof({ mixin(enumMixinStr___BIT_TYPES_DEFINED__); })))
        {
            mixin(enumMixinStr___BIT_TYPES_DEFINED__);
        }
    }
    static if (!is(typeof(ZIP_EXTERN)))
    {
        private enum enumMixinStr_ZIP_EXTERN = `enum ZIP_EXTERN = __attribute__ ( ( visibility ( "default" ) ) );`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_EXTERN); })))
        {
            mixin(enumMixinStr_ZIP_EXTERN);
        }
    }

    static if (!is(typeof(ZIP_CREATE)))
    {
        private enum enumMixinStr_ZIP_CREATE = `enum ZIP_CREATE = 1;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_CREATE); })))
        {
            mixin(enumMixinStr_ZIP_CREATE);
        }
    }

    static if (!is(typeof(ZIP_EXCL)))
    {
        private enum enumMixinStr_ZIP_EXCL = `enum ZIP_EXCL = 2;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_EXCL); })))
        {
            mixin(enumMixinStr_ZIP_EXCL);
        }
    }

    static if (!is(typeof(ZIP_CHECKCONS)))
    {
        private enum enumMixinStr_ZIP_CHECKCONS = `enum ZIP_CHECKCONS = 4;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_CHECKCONS); })))
        {
            mixin(enumMixinStr_ZIP_CHECKCONS);
        }
    }

    static if (!is(typeof(ZIP_TRUNCATE)))
    {
        private enum enumMixinStr_ZIP_TRUNCATE = `enum ZIP_TRUNCATE = 8;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_TRUNCATE); })))
        {
            mixin(enumMixinStr_ZIP_TRUNCATE);
        }
    }

    static if (!is(typeof(ZIP_RDONLY)))
    {
        private enum enumMixinStr_ZIP_RDONLY = `enum ZIP_RDONLY = 16;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_RDONLY); })))
        {
            mixin(enumMixinStr_ZIP_RDONLY);
        }
    }

    static if (!is(typeof(ZIP_FL_NOCASE)))
    {
        private enum enumMixinStr_ZIP_FL_NOCASE = `enum ZIP_FL_NOCASE = 1u;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_FL_NOCASE); })))
        {
            mixin(enumMixinStr_ZIP_FL_NOCASE);
        }
    }

    static if (!is(typeof(ZIP_FL_NODIR)))
    {
        private enum enumMixinStr_ZIP_FL_NODIR = `enum ZIP_FL_NODIR = 2u;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_FL_NODIR); })))
        {
            mixin(enumMixinStr_ZIP_FL_NODIR);
        }
    }

    static if (!is(typeof(ZIP_FL_COMPRESSED)))
    {
        private enum enumMixinStr_ZIP_FL_COMPRESSED = `enum ZIP_FL_COMPRESSED = 4u;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_FL_COMPRESSED); })))
        {
            mixin(enumMixinStr_ZIP_FL_COMPRESSED);
        }
    }

    static if (!is(typeof(ZIP_FL_UNCHANGED)))
    {
        private enum enumMixinStr_ZIP_FL_UNCHANGED = `enum ZIP_FL_UNCHANGED = 8u;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_FL_UNCHANGED); })))
        {
            mixin(enumMixinStr_ZIP_FL_UNCHANGED);
        }
    }

    static if (!is(typeof(ZIP_FL_RECOMPRESS)))
    {
        private enum enumMixinStr_ZIP_FL_RECOMPRESS = `enum ZIP_FL_RECOMPRESS = 16u;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_FL_RECOMPRESS); })))
        {
            mixin(enumMixinStr_ZIP_FL_RECOMPRESS);
        }
    }

    static if (!is(typeof(ZIP_FL_ENCRYPTED)))
    {
        private enum enumMixinStr_ZIP_FL_ENCRYPTED = `enum ZIP_FL_ENCRYPTED = 32u;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_FL_ENCRYPTED); })))
        {
            mixin(enumMixinStr_ZIP_FL_ENCRYPTED);
        }
    }

    static if (!is(typeof(ZIP_FL_ENC_GUESS)))
    {
        private enum enumMixinStr_ZIP_FL_ENC_GUESS = `enum ZIP_FL_ENC_GUESS = 0u;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_FL_ENC_GUESS); })))
        {
            mixin(enumMixinStr_ZIP_FL_ENC_GUESS);
        }
    }

    static if (!is(typeof(ZIP_FL_ENC_RAW)))
    {
        private enum enumMixinStr_ZIP_FL_ENC_RAW = `enum ZIP_FL_ENC_RAW = 64u;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_FL_ENC_RAW); })))
        {
            mixin(enumMixinStr_ZIP_FL_ENC_RAW);
        }
    }

    static if (!is(typeof(ZIP_FL_ENC_STRICT)))
    {
        private enum enumMixinStr_ZIP_FL_ENC_STRICT = `enum ZIP_FL_ENC_STRICT = 128u;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_FL_ENC_STRICT); })))
        {
            mixin(enumMixinStr_ZIP_FL_ENC_STRICT);
        }
    }

    static if (!is(typeof(ZIP_FL_LOCAL)))
    {
        private enum enumMixinStr_ZIP_FL_LOCAL = `enum ZIP_FL_LOCAL = 256u;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_FL_LOCAL); })))
        {
            mixin(enumMixinStr_ZIP_FL_LOCAL);
        }
    }

    static if (!is(typeof(ZIP_FL_CENTRAL)))
    {
        private enum enumMixinStr_ZIP_FL_CENTRAL = `enum ZIP_FL_CENTRAL = 512u;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_FL_CENTRAL); })))
        {
            mixin(enumMixinStr_ZIP_FL_CENTRAL);
        }
    }

    static if (!is(typeof(ZIP_FL_ENC_UTF_8)))
    {
        private enum enumMixinStr_ZIP_FL_ENC_UTF_8 = `enum ZIP_FL_ENC_UTF_8 = 2048u;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_FL_ENC_UTF_8); })))
        {
            mixin(enumMixinStr_ZIP_FL_ENC_UTF_8);
        }
    }

    static if (!is(typeof(ZIP_FL_ENC_CP437)))
    {
        private enum enumMixinStr_ZIP_FL_ENC_CP437 = `enum ZIP_FL_ENC_CP437 = 4096u;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_FL_ENC_CP437); })))
        {
            mixin(enumMixinStr_ZIP_FL_ENC_CP437);
        }
    }

    static if (!is(typeof(ZIP_FL_OVERWRITE)))
    {
        private enum enumMixinStr_ZIP_FL_OVERWRITE = `enum ZIP_FL_OVERWRITE = 8192u;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_FL_OVERWRITE); })))
        {
            mixin(enumMixinStr_ZIP_FL_OVERWRITE);
        }
    }

    static if (!is(typeof(ZIP_AFL_RDONLY)))
    {
        private enum enumMixinStr_ZIP_AFL_RDONLY = `enum ZIP_AFL_RDONLY = 2u;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_AFL_RDONLY); })))
        {
            mixin(enumMixinStr_ZIP_AFL_RDONLY);
        }
    }

    static if (!is(typeof(ZIP_EXTRA_FIELD_ALL)))
    {
        private enum enumMixinStr_ZIP_EXTRA_FIELD_ALL = `enum ZIP_EXTRA_FIELD_ALL = ZIP_UINT16_MAX;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_EXTRA_FIELD_ALL); })))
        {
            mixin(enumMixinStr_ZIP_EXTRA_FIELD_ALL);
        }
    }

    static if (!is(typeof(ZIP_EXTRA_FIELD_NEW)))
    {
        private enum enumMixinStr_ZIP_EXTRA_FIELD_NEW = `enum ZIP_EXTRA_FIELD_NEW = ZIP_UINT16_MAX;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_EXTRA_FIELD_NEW); })))
        {
            mixin(enumMixinStr_ZIP_EXTRA_FIELD_NEW);
        }
    }

    static if (!is(typeof(ZIP_ER_OK)))
    {
        private enum enumMixinStr_ZIP_ER_OK = `enum ZIP_ER_OK = 0;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_ER_OK); })))
        {
            mixin(enumMixinStr_ZIP_ER_OK);
        }
    }

    static if (!is(typeof(ZIP_ER_MULTIDISK)))
    {
        private enum enumMixinStr_ZIP_ER_MULTIDISK = `enum ZIP_ER_MULTIDISK = 1;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_ER_MULTIDISK); })))
        {
            mixin(enumMixinStr_ZIP_ER_MULTIDISK);
        }
    }

    static if (!is(typeof(ZIP_ER_RENAME)))
    {
        private enum enumMixinStr_ZIP_ER_RENAME = `enum ZIP_ER_RENAME = 2;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_ER_RENAME); })))
        {
            mixin(enumMixinStr_ZIP_ER_RENAME);
        }
    }

    static if (!is(typeof(ZIP_ER_CLOSE)))
    {
        private enum enumMixinStr_ZIP_ER_CLOSE = `enum ZIP_ER_CLOSE = 3;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_ER_CLOSE); })))
        {
            mixin(enumMixinStr_ZIP_ER_CLOSE);
        }
    }

    static if (!is(typeof(ZIP_ER_SEEK)))
    {
        private enum enumMixinStr_ZIP_ER_SEEK = `enum ZIP_ER_SEEK = 4;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_ER_SEEK); })))
        {
            mixin(enumMixinStr_ZIP_ER_SEEK);
        }
    }

    static if (!is(typeof(ZIP_ER_READ)))
    {
        private enum enumMixinStr_ZIP_ER_READ = `enum ZIP_ER_READ = 5;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_ER_READ); })))
        {
            mixin(enumMixinStr_ZIP_ER_READ);
        }
    }

    static if (!is(typeof(ZIP_ER_WRITE)))
    {
        private enum enumMixinStr_ZIP_ER_WRITE = `enum ZIP_ER_WRITE = 6;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_ER_WRITE); })))
        {
            mixin(enumMixinStr_ZIP_ER_WRITE);
        }
    }

    static if (!is(typeof(ZIP_ER_CRC)))
    {
        private enum enumMixinStr_ZIP_ER_CRC = `enum ZIP_ER_CRC = 7;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_ER_CRC); })))
        {
            mixin(enumMixinStr_ZIP_ER_CRC);
        }
    }

    static if (!is(typeof(ZIP_ER_ZIPCLOSED)))
    {
        private enum enumMixinStr_ZIP_ER_ZIPCLOSED = `enum ZIP_ER_ZIPCLOSED = 8;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_ER_ZIPCLOSED); })))
        {
            mixin(enumMixinStr_ZIP_ER_ZIPCLOSED);
        }
    }

    static if (!is(typeof(ZIP_ER_NOENT)))
    {
        private enum enumMixinStr_ZIP_ER_NOENT = `enum ZIP_ER_NOENT = 9;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_ER_NOENT); })))
        {
            mixin(enumMixinStr_ZIP_ER_NOENT);
        }
    }

    static if (!is(typeof(ZIP_ER_EXISTS)))
    {
        private enum enumMixinStr_ZIP_ER_EXISTS = `enum ZIP_ER_EXISTS = 10;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_ER_EXISTS); })))
        {
            mixin(enumMixinStr_ZIP_ER_EXISTS);
        }
    }

    static if (!is(typeof(ZIP_ER_OPEN)))
    {
        private enum enumMixinStr_ZIP_ER_OPEN = `enum ZIP_ER_OPEN = 11;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_ER_OPEN); })))
        {
            mixin(enumMixinStr_ZIP_ER_OPEN);
        }
    }

    static if (!is(typeof(ZIP_ER_TMPOPEN)))
    {
        private enum enumMixinStr_ZIP_ER_TMPOPEN = `enum ZIP_ER_TMPOPEN = 12;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_ER_TMPOPEN); })))
        {
            mixin(enumMixinStr_ZIP_ER_TMPOPEN);
        }
    }

    static if (!is(typeof(ZIP_ER_ZLIB)))
    {
        private enum enumMixinStr_ZIP_ER_ZLIB = `enum ZIP_ER_ZLIB = 13;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_ER_ZLIB); })))
        {
            mixin(enumMixinStr_ZIP_ER_ZLIB);
        }
    }

    static if (!is(typeof(ZIP_ER_MEMORY)))
    {
        private enum enumMixinStr_ZIP_ER_MEMORY = `enum ZIP_ER_MEMORY = 14;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_ER_MEMORY); })))
        {
            mixin(enumMixinStr_ZIP_ER_MEMORY);
        }
    }

    static if (!is(typeof(ZIP_ER_CHANGED)))
    {
        private enum enumMixinStr_ZIP_ER_CHANGED = `enum ZIP_ER_CHANGED = 15;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_ER_CHANGED); })))
        {
            mixin(enumMixinStr_ZIP_ER_CHANGED);
        }
    }

    static if (!is(typeof(ZIP_ER_COMPNOTSUPP)))
    {
        private enum enumMixinStr_ZIP_ER_COMPNOTSUPP = `enum ZIP_ER_COMPNOTSUPP = 16;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_ER_COMPNOTSUPP); })))
        {
            mixin(enumMixinStr_ZIP_ER_COMPNOTSUPP);
        }
    }

    static if (!is(typeof(ZIP_ER_EOF)))
    {
        private enum enumMixinStr_ZIP_ER_EOF = `enum ZIP_ER_EOF = 17;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_ER_EOF); })))
        {
            mixin(enumMixinStr_ZIP_ER_EOF);
        }
    }

    static if (!is(typeof(ZIP_ER_INVAL)))
    {
        private enum enumMixinStr_ZIP_ER_INVAL = `enum ZIP_ER_INVAL = 18;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_ER_INVAL); })))
        {
            mixin(enumMixinStr_ZIP_ER_INVAL);
        }
    }

    static if (!is(typeof(ZIP_ER_NOZIP)))
    {
        private enum enumMixinStr_ZIP_ER_NOZIP = `enum ZIP_ER_NOZIP = 19;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_ER_NOZIP); })))
        {
            mixin(enumMixinStr_ZIP_ER_NOZIP);
        }
    }

    static if (!is(typeof(ZIP_ER_INTERNAL)))
    {
        private enum enumMixinStr_ZIP_ER_INTERNAL = `enum ZIP_ER_INTERNAL = 20;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_ER_INTERNAL); })))
        {
            mixin(enumMixinStr_ZIP_ER_INTERNAL);
        }
    }

    static if (!is(typeof(ZIP_ER_INCONS)))
    {
        private enum enumMixinStr_ZIP_ER_INCONS = `enum ZIP_ER_INCONS = 21;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_ER_INCONS); })))
        {
            mixin(enumMixinStr_ZIP_ER_INCONS);
        }
    }

    static if (!is(typeof(ZIP_ER_REMOVE)))
    {
        private enum enumMixinStr_ZIP_ER_REMOVE = `enum ZIP_ER_REMOVE = 22;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_ER_REMOVE); })))
        {
            mixin(enumMixinStr_ZIP_ER_REMOVE);
        }
    }

    static if (!is(typeof(ZIP_ER_DELETED)))
    {
        private enum enumMixinStr_ZIP_ER_DELETED = `enum ZIP_ER_DELETED = 23;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_ER_DELETED); })))
        {
            mixin(enumMixinStr_ZIP_ER_DELETED);
        }
    }

    static if (!is(typeof(ZIP_ER_ENCRNOTSUPP)))
    {
        private enum enumMixinStr_ZIP_ER_ENCRNOTSUPP = `enum ZIP_ER_ENCRNOTSUPP = 24;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_ER_ENCRNOTSUPP); })))
        {
            mixin(enumMixinStr_ZIP_ER_ENCRNOTSUPP);
        }
    }

    static if (!is(typeof(ZIP_ER_RDONLY)))
    {
        private enum enumMixinStr_ZIP_ER_RDONLY = `enum ZIP_ER_RDONLY = 25;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_ER_RDONLY); })))
        {
            mixin(enumMixinStr_ZIP_ER_RDONLY);
        }
    }

    static if (!is(typeof(ZIP_ER_NOPASSWD)))
    {
        private enum enumMixinStr_ZIP_ER_NOPASSWD = `enum ZIP_ER_NOPASSWD = 26;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_ER_NOPASSWD); })))
        {
            mixin(enumMixinStr_ZIP_ER_NOPASSWD);
        }
    }

    static if (!is(typeof(ZIP_ER_WRONGPASSWD)))
    {
        private enum enumMixinStr_ZIP_ER_WRONGPASSWD = `enum ZIP_ER_WRONGPASSWD = 27;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_ER_WRONGPASSWD); })))
        {
            mixin(enumMixinStr_ZIP_ER_WRONGPASSWD);
        }
    }

    static if (!is(typeof(ZIP_ER_OPNOTSUPP)))
    {
        private enum enumMixinStr_ZIP_ER_OPNOTSUPP = `enum ZIP_ER_OPNOTSUPP = 28;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_ER_OPNOTSUPP); })))
        {
            mixin(enumMixinStr_ZIP_ER_OPNOTSUPP);
        }
    }

    static if (!is(typeof(ZIP_ER_INUSE)))
    {
        private enum enumMixinStr_ZIP_ER_INUSE = `enum ZIP_ER_INUSE = 29;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_ER_INUSE); })))
        {
            mixin(enumMixinStr_ZIP_ER_INUSE);
        }
    }

    static if (!is(typeof(ZIP_ER_TELL)))
    {
        private enum enumMixinStr_ZIP_ER_TELL = `enum ZIP_ER_TELL = 30;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_ER_TELL); })))
        {
            mixin(enumMixinStr_ZIP_ER_TELL);
        }
    }

    static if (!is(typeof(ZIP_ER_COMPRESSED_DATA)))
    {
        private enum enumMixinStr_ZIP_ER_COMPRESSED_DATA = `enum ZIP_ER_COMPRESSED_DATA = 31;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_ER_COMPRESSED_DATA); })))
        {
            mixin(enumMixinStr_ZIP_ER_COMPRESSED_DATA);
        }
    }

    static if (!is(typeof(ZIP_ET_NONE)))
    {
        private enum enumMixinStr_ZIP_ET_NONE = `enum ZIP_ET_NONE = 0;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_ET_NONE); })))
        {
            mixin(enumMixinStr_ZIP_ET_NONE);
        }
    }

    static if (!is(typeof(ZIP_ET_SYS)))
    {
        private enum enumMixinStr_ZIP_ET_SYS = `enum ZIP_ET_SYS = 1;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_ET_SYS); })))
        {
            mixin(enumMixinStr_ZIP_ET_SYS);
        }
    }

    static if (!is(typeof(ZIP_ET_ZLIB)))
    {
        private enum enumMixinStr_ZIP_ET_ZLIB = `enum ZIP_ET_ZLIB = 2;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_ET_ZLIB); })))
        {
            mixin(enumMixinStr_ZIP_ET_ZLIB);
        }
    }

    static if (!is(typeof(ZIP_CM_DEFAULT)))
    {
        private enum enumMixinStr_ZIP_CM_DEFAULT = `enum ZIP_CM_DEFAULT = - 1;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_CM_DEFAULT); })))
        {
            mixin(enumMixinStr_ZIP_CM_DEFAULT);
        }
    }

    static if (!is(typeof(ZIP_CM_STORE)))
    {
        private enum enumMixinStr_ZIP_CM_STORE = `enum ZIP_CM_STORE = 0;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_CM_STORE); })))
        {
            mixin(enumMixinStr_ZIP_CM_STORE);
        }
    }

    static if (!is(typeof(ZIP_CM_SHRINK)))
    {
        private enum enumMixinStr_ZIP_CM_SHRINK = `enum ZIP_CM_SHRINK = 1;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_CM_SHRINK); })))
        {
            mixin(enumMixinStr_ZIP_CM_SHRINK);
        }
    }

    static if (!is(typeof(ZIP_CM_REDUCE_1)))
    {
        private enum enumMixinStr_ZIP_CM_REDUCE_1 = `enum ZIP_CM_REDUCE_1 = 2;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_CM_REDUCE_1); })))
        {
            mixin(enumMixinStr_ZIP_CM_REDUCE_1);
        }
    }

    static if (!is(typeof(ZIP_CM_REDUCE_2)))
    {
        private enum enumMixinStr_ZIP_CM_REDUCE_2 = `enum ZIP_CM_REDUCE_2 = 3;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_CM_REDUCE_2); })))
        {
            mixin(enumMixinStr_ZIP_CM_REDUCE_2);
        }
    }

    static if (!is(typeof(ZIP_CM_REDUCE_3)))
    {
        private enum enumMixinStr_ZIP_CM_REDUCE_3 = `enum ZIP_CM_REDUCE_3 = 4;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_CM_REDUCE_3); })))
        {
            mixin(enumMixinStr_ZIP_CM_REDUCE_3);
        }
    }

    static if (!is(typeof(ZIP_CM_REDUCE_4)))
    {
        private enum enumMixinStr_ZIP_CM_REDUCE_4 = `enum ZIP_CM_REDUCE_4 = 5;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_CM_REDUCE_4); })))
        {
            mixin(enumMixinStr_ZIP_CM_REDUCE_4);
        }
    }

    static if (!is(typeof(ZIP_CM_IMPLODE)))
    {
        private enum enumMixinStr_ZIP_CM_IMPLODE = `enum ZIP_CM_IMPLODE = 6;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_CM_IMPLODE); })))
        {
            mixin(enumMixinStr_ZIP_CM_IMPLODE);
        }
    }

    static if (!is(typeof(ZIP_CM_DEFLATE)))
    {
        private enum enumMixinStr_ZIP_CM_DEFLATE = `enum ZIP_CM_DEFLATE = 8;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_CM_DEFLATE); })))
        {
            mixin(enumMixinStr_ZIP_CM_DEFLATE);
        }
    }

    static if (!is(typeof(ZIP_CM_DEFLATE64)))
    {
        private enum enumMixinStr_ZIP_CM_DEFLATE64 = `enum ZIP_CM_DEFLATE64 = 9;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_CM_DEFLATE64); })))
        {
            mixin(enumMixinStr_ZIP_CM_DEFLATE64);
        }
    }

    static if (!is(typeof(ZIP_CM_PKWARE_IMPLODE)))
    {
        private enum enumMixinStr_ZIP_CM_PKWARE_IMPLODE = `enum ZIP_CM_PKWARE_IMPLODE = 10;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_CM_PKWARE_IMPLODE); })))
        {
            mixin(enumMixinStr_ZIP_CM_PKWARE_IMPLODE);
        }
    }

    static if (!is(typeof(ZIP_CM_BZIP2)))
    {
        private enum enumMixinStr_ZIP_CM_BZIP2 = `enum ZIP_CM_BZIP2 = 12;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_CM_BZIP2); })))
        {
            mixin(enumMixinStr_ZIP_CM_BZIP2);
        }
    }

    static if (!is(typeof(ZIP_CM_LZMA)))
    {
        private enum enumMixinStr_ZIP_CM_LZMA = `enum ZIP_CM_LZMA = 14;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_CM_LZMA); })))
        {
            mixin(enumMixinStr_ZIP_CM_LZMA);
        }
    }

    static if (!is(typeof(ZIP_CM_TERSE)))
    {
        private enum enumMixinStr_ZIP_CM_TERSE = `enum ZIP_CM_TERSE = 18;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_CM_TERSE); })))
        {
            mixin(enumMixinStr_ZIP_CM_TERSE);
        }
    }

    static if (!is(typeof(ZIP_CM_LZ77)))
    {
        private enum enumMixinStr_ZIP_CM_LZ77 = `enum ZIP_CM_LZ77 = 19;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_CM_LZ77); })))
        {
            mixin(enumMixinStr_ZIP_CM_LZ77);
        }
    }

    static if (!is(typeof(ZIP_CM_XZ)))
    {
        private enum enumMixinStr_ZIP_CM_XZ = `enum ZIP_CM_XZ = 95;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_CM_XZ); })))
        {
            mixin(enumMixinStr_ZIP_CM_XZ);
        }
    }

    static if (!is(typeof(ZIP_CM_JPEG)))
    {
        private enum enumMixinStr_ZIP_CM_JPEG = `enum ZIP_CM_JPEG = 96;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_CM_JPEG); })))
        {
            mixin(enumMixinStr_ZIP_CM_JPEG);
        }
    }

    static if (!is(typeof(ZIP_CM_WAVPACK)))
    {
        private enum enumMixinStr_ZIP_CM_WAVPACK = `enum ZIP_CM_WAVPACK = 97;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_CM_WAVPACK); })))
        {
            mixin(enumMixinStr_ZIP_CM_WAVPACK);
        }
    }

    static if (!is(typeof(ZIP_CM_PPMD)))
    {
        private enum enumMixinStr_ZIP_CM_PPMD = `enum ZIP_CM_PPMD = 98;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_CM_PPMD); })))
        {
            mixin(enumMixinStr_ZIP_CM_PPMD);
        }
    }

    static if (!is(typeof(ZIP_EM_NONE)))
    {
        private enum enumMixinStr_ZIP_EM_NONE = `enum ZIP_EM_NONE = 0;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_EM_NONE); })))
        {
            mixin(enumMixinStr_ZIP_EM_NONE);
        }
    }

    static if (!is(typeof(ZIP_EM_TRAD_PKWARE)))
    {
        private enum enumMixinStr_ZIP_EM_TRAD_PKWARE = `enum ZIP_EM_TRAD_PKWARE = 1;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_EM_TRAD_PKWARE); })))
        {
            mixin(enumMixinStr_ZIP_EM_TRAD_PKWARE);
        }
    }

    static if (!is(typeof(ZIP_EM_AES_128)))
    {
        private enum enumMixinStr_ZIP_EM_AES_128 = `enum ZIP_EM_AES_128 = 0x0101;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_EM_AES_128); })))
        {
            mixin(enumMixinStr_ZIP_EM_AES_128);
        }
    }

    static if (!is(typeof(ZIP_EM_AES_192)))
    {
        private enum enumMixinStr_ZIP_EM_AES_192 = `enum ZIP_EM_AES_192 = 0x0102;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_EM_AES_192); })))
        {
            mixin(enumMixinStr_ZIP_EM_AES_192);
        }
    }

    static if (!is(typeof(ZIP_EM_AES_256)))
    {
        private enum enumMixinStr_ZIP_EM_AES_256 = `enum ZIP_EM_AES_256 = 0x0103;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_EM_AES_256); })))
        {
            mixin(enumMixinStr_ZIP_EM_AES_256);
        }
    }

    static if (!is(typeof(ZIP_EM_UNKNOWN)))
    {
        private enum enumMixinStr_ZIP_EM_UNKNOWN = `enum ZIP_EM_UNKNOWN = 0xffff;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_EM_UNKNOWN); })))
        {
            mixin(enumMixinStr_ZIP_EM_UNKNOWN);
        }
    }

    static if (!is(typeof(ZIP_OPSYS_DOS)))
    {
        private enum enumMixinStr_ZIP_OPSYS_DOS = `enum ZIP_OPSYS_DOS = 0x00u;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_OPSYS_DOS); })))
        {
            mixin(enumMixinStr_ZIP_OPSYS_DOS);
        }
    }

    static if (!is(typeof(ZIP_OPSYS_AMIGA)))
    {
        private enum enumMixinStr_ZIP_OPSYS_AMIGA = `enum ZIP_OPSYS_AMIGA = 0x01u;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_OPSYS_AMIGA); })))
        {
            mixin(enumMixinStr_ZIP_OPSYS_AMIGA);
        }
    }

    static if (!is(typeof(ZIP_OPSYS_OPENVMS)))
    {
        private enum enumMixinStr_ZIP_OPSYS_OPENVMS = `enum ZIP_OPSYS_OPENVMS = 0x02u;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_OPSYS_OPENVMS); })))
        {
            mixin(enumMixinStr_ZIP_OPSYS_OPENVMS);
        }
    }

    static if (!is(typeof(ZIP_OPSYS_UNIX)))
    {
        private enum enumMixinStr_ZIP_OPSYS_UNIX = `enum ZIP_OPSYS_UNIX = 0x03u;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_OPSYS_UNIX); })))
        {
            mixin(enumMixinStr_ZIP_OPSYS_UNIX);
        }
    }

    static if (!is(typeof(ZIP_OPSYS_VM_CMS)))
    {
        private enum enumMixinStr_ZIP_OPSYS_VM_CMS = `enum ZIP_OPSYS_VM_CMS = 0x04u;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_OPSYS_VM_CMS); })))
        {
            mixin(enumMixinStr_ZIP_OPSYS_VM_CMS);
        }
    }

    static if (!is(typeof(ZIP_OPSYS_ATARI_ST)))
    {
        private enum enumMixinStr_ZIP_OPSYS_ATARI_ST = `enum ZIP_OPSYS_ATARI_ST = 0x05u;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_OPSYS_ATARI_ST); })))
        {
            mixin(enumMixinStr_ZIP_OPSYS_ATARI_ST);
        }
    }

    static if (!is(typeof(ZIP_OPSYS_OS_2)))
    {
        private enum enumMixinStr_ZIP_OPSYS_OS_2 = `enum ZIP_OPSYS_OS_2 = 0x06u;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_OPSYS_OS_2); })))
        {
            mixin(enumMixinStr_ZIP_OPSYS_OS_2);
        }
    }

    static if (!is(typeof(ZIP_OPSYS_MACINTOSH)))
    {
        private enum enumMixinStr_ZIP_OPSYS_MACINTOSH = `enum ZIP_OPSYS_MACINTOSH = 0x07u;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_OPSYS_MACINTOSH); })))
        {
            mixin(enumMixinStr_ZIP_OPSYS_MACINTOSH);
        }
    }

    static if (!is(typeof(ZIP_OPSYS_Z_SYSTEM)))
    {
        private enum enumMixinStr_ZIP_OPSYS_Z_SYSTEM = `enum ZIP_OPSYS_Z_SYSTEM = 0x08u;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_OPSYS_Z_SYSTEM); })))
        {
            mixin(enumMixinStr_ZIP_OPSYS_Z_SYSTEM);
        }
    }

    static if (!is(typeof(ZIP_OPSYS_CPM)))
    {
        private enum enumMixinStr_ZIP_OPSYS_CPM = `enum ZIP_OPSYS_CPM = 0x09u;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_OPSYS_CPM); })))
        {
            mixin(enumMixinStr_ZIP_OPSYS_CPM);
        }
    }

    static if (!is(typeof(ZIP_OPSYS_WINDOWS_NTFS)))
    {
        private enum enumMixinStr_ZIP_OPSYS_WINDOWS_NTFS = `enum ZIP_OPSYS_WINDOWS_NTFS = 0x0au;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_OPSYS_WINDOWS_NTFS); })))
        {
            mixin(enumMixinStr_ZIP_OPSYS_WINDOWS_NTFS);
        }
    }

    static if (!is(typeof(ZIP_OPSYS_MVS)))
    {
        private enum enumMixinStr_ZIP_OPSYS_MVS = `enum ZIP_OPSYS_MVS = 0x0bu;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_OPSYS_MVS); })))
        {
            mixin(enumMixinStr_ZIP_OPSYS_MVS);
        }
    }

    static if (!is(typeof(ZIP_OPSYS_VSE)))
    {
        private enum enumMixinStr_ZIP_OPSYS_VSE = `enum ZIP_OPSYS_VSE = 0x0cu;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_OPSYS_VSE); })))
        {
            mixin(enumMixinStr_ZIP_OPSYS_VSE);
        }
    }

    static if (!is(typeof(ZIP_OPSYS_ACORN_RISC)))
    {
        private enum enumMixinStr_ZIP_OPSYS_ACORN_RISC = `enum ZIP_OPSYS_ACORN_RISC = 0x0du;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_OPSYS_ACORN_RISC); })))
        {
            mixin(enumMixinStr_ZIP_OPSYS_ACORN_RISC);
        }
    }

    static if (!is(typeof(ZIP_OPSYS_VFAT)))
    {
        private enum enumMixinStr_ZIP_OPSYS_VFAT = `enum ZIP_OPSYS_VFAT = 0x0eu;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_OPSYS_VFAT); })))
        {
            mixin(enumMixinStr_ZIP_OPSYS_VFAT);
        }
    }

    static if (!is(typeof(ZIP_OPSYS_ALTERNATE_MVS)))
    {
        private enum enumMixinStr_ZIP_OPSYS_ALTERNATE_MVS = `enum ZIP_OPSYS_ALTERNATE_MVS = 0x0fu;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_OPSYS_ALTERNATE_MVS); })))
        {
            mixin(enumMixinStr_ZIP_OPSYS_ALTERNATE_MVS);
        }
    }

    static if (!is(typeof(ZIP_OPSYS_BEOS)))
    {
        private enum enumMixinStr_ZIP_OPSYS_BEOS = `enum ZIP_OPSYS_BEOS = 0x10u;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_OPSYS_BEOS); })))
        {
            mixin(enumMixinStr_ZIP_OPSYS_BEOS);
        }
    }

    static if (!is(typeof(ZIP_OPSYS_TANDEM)))
    {
        private enum enumMixinStr_ZIP_OPSYS_TANDEM = `enum ZIP_OPSYS_TANDEM = 0x11u;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_OPSYS_TANDEM); })))
        {
            mixin(enumMixinStr_ZIP_OPSYS_TANDEM);
        }
    }

    static if (!is(typeof(ZIP_OPSYS_OS_400)))
    {
        private enum enumMixinStr_ZIP_OPSYS_OS_400 = `enum ZIP_OPSYS_OS_400 = 0x12u;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_OPSYS_OS_400); })))
        {
            mixin(enumMixinStr_ZIP_OPSYS_OS_400);
        }
    }

    static if (!is(typeof(ZIP_OPSYS_OS_X)))
    {
        private enum enumMixinStr_ZIP_OPSYS_OS_X = `enum ZIP_OPSYS_OS_X = 0x13u;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_OPSYS_OS_X); })))
        {
            mixin(enumMixinStr_ZIP_OPSYS_OS_X);
        }
    }

    static if (!is(typeof(ZIP_OPSYS_DEFAULT)))
    {
        private enum enumMixinStr_ZIP_OPSYS_DEFAULT = `enum ZIP_OPSYS_DEFAULT = 0x03u;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_OPSYS_DEFAULT); })))
        {
            mixin(enumMixinStr_ZIP_OPSYS_DEFAULT);
        }
    }

    static if (!is(typeof(ZIP_SOURCE_SUPPORTS_READABLE)))
    {
        private enum enumMixinStr_ZIP_SOURCE_SUPPORTS_READABLE = `enum ZIP_SOURCE_SUPPORTS_READABLE = ( ( ( cast( zip_int64_t ) 1 ) << ( ZIP_SOURCE_OPEN ) ) | ( ( cast( zip_int64_t ) 1 ) << ( ZIP_SOURCE_READ ) ) | ( ( cast( zip_int64_t ) 1 ) << ( ZIP_SOURCE_CLOSE ) ) | ( ( cast( zip_int64_t ) 1 ) << ( ZIP_SOURCE_STAT ) ) | ( ( cast( zip_int64_t ) 1 ) << ( ZIP_SOURCE_ERROR ) ) | ( ( cast( zip_int64_t ) 1 ) << ( ZIP_SOURCE_FREE ) ) );`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_SOURCE_SUPPORTS_READABLE); })))
        {
            mixin(enumMixinStr_ZIP_SOURCE_SUPPORTS_READABLE);
        }
    }

    static if (!is(typeof(ZIP_SOURCE_SUPPORTS_SEEKABLE)))
    {
        private enum enumMixinStr_ZIP_SOURCE_SUPPORTS_SEEKABLE = `enum ZIP_SOURCE_SUPPORTS_SEEKABLE = ( ( ( ( cast( zip_int64_t ) 1 ) << ( ZIP_SOURCE_OPEN ) ) | ( ( cast( zip_int64_t ) 1 ) << ( ZIP_SOURCE_READ ) ) | ( ( cast( zip_int64_t ) 1 ) << ( ZIP_SOURCE_CLOSE ) ) | ( ( cast( zip_int64_t ) 1 ) << ( ZIP_SOURCE_STAT ) ) | ( ( cast( zip_int64_t ) 1 ) << ( ZIP_SOURCE_ERROR ) ) | ( ( cast( zip_int64_t ) 1 ) << ( ZIP_SOURCE_FREE ) ) ) | ( ( cast( zip_int64_t ) 1 ) << ( ZIP_SOURCE_SEEK ) ) | ( ( cast( zip_int64_t ) 1 ) << ( ZIP_SOURCE_TELL ) ) | ( ( cast( zip_int64_t ) 1 ) << ( ZIP_SOURCE_SUPPORTS ) ) );`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_SOURCE_SUPPORTS_SEEKABLE); })))
        {
            mixin(enumMixinStr_ZIP_SOURCE_SUPPORTS_SEEKABLE);
        }
    }

    static if (!is(typeof(ZIP_SOURCE_SUPPORTS_WRITABLE)))
    {
        private enum enumMixinStr_ZIP_SOURCE_SUPPORTS_WRITABLE = `enum ZIP_SOURCE_SUPPORTS_WRITABLE = ( ( ( ( ( cast( zip_int64_t ) 1 ) << ( ZIP_SOURCE_OPEN ) ) | ( ( cast( zip_int64_t ) 1 ) << ( ZIP_SOURCE_READ ) ) | ( ( cast( zip_int64_t ) 1 ) << ( ZIP_SOURCE_CLOSE ) ) | ( ( cast( zip_int64_t ) 1 ) << ( ZIP_SOURCE_STAT ) ) | ( ( cast( zip_int64_t ) 1 ) << ( ZIP_SOURCE_ERROR ) ) | ( ( cast( zip_int64_t ) 1 ) << ( ZIP_SOURCE_FREE ) ) ) | ( ( cast( zip_int64_t ) 1 ) << ( ZIP_SOURCE_SEEK ) ) | ( ( cast( zip_int64_t ) 1 ) << ( ZIP_SOURCE_TELL ) ) | ( ( cast( zip_int64_t ) 1 ) << ( ZIP_SOURCE_SUPPORTS ) ) ) | ( ( cast( zip_int64_t ) 1 ) << ( ZIP_SOURCE_BEGIN_WRITE ) ) | ( ( cast( zip_int64_t ) 1 ) << ( ZIP_SOURCE_COMMIT_WRITE ) ) | ( ( cast( zip_int64_t ) 1 ) << ( ZIP_SOURCE_ROLLBACK_WRITE ) ) | ( ( cast( zip_int64_t ) 1 ) << ( ZIP_SOURCE_WRITE ) ) | ( ( cast( zip_int64_t ) 1 ) << ( ZIP_SOURCE_SEEK_WRITE ) ) | ( ( cast( zip_int64_t ) 1 ) << ( ZIP_SOURCE_TELL_WRITE ) ) | ( ( cast( zip_int64_t ) 1 ) << ( ZIP_SOURCE_REMOVE ) ) );`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_SOURCE_SUPPORTS_WRITABLE); })))
        {
            mixin(enumMixinStr_ZIP_SOURCE_SUPPORTS_WRITABLE);
        }
    }

    static if (!is(typeof(ZIP_STAT_NAME)))
    {
        private enum enumMixinStr_ZIP_STAT_NAME = `enum ZIP_STAT_NAME = 0x0001u;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_STAT_NAME); })))
        {
            mixin(enumMixinStr_ZIP_STAT_NAME);
        }
    }

    static if (!is(typeof(ZIP_STAT_INDEX)))
    {
        private enum enumMixinStr_ZIP_STAT_INDEX = `enum ZIP_STAT_INDEX = 0x0002u;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_STAT_INDEX); })))
        {
            mixin(enumMixinStr_ZIP_STAT_INDEX);
        }
    }

    static if (!is(typeof(ZIP_STAT_SIZE)))
    {
        private enum enumMixinStr_ZIP_STAT_SIZE = `enum ZIP_STAT_SIZE = 0x0004u;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_STAT_SIZE); })))
        {
            mixin(enumMixinStr_ZIP_STAT_SIZE);
        }
    }

    static if (!is(typeof(ZIP_STAT_COMP_SIZE)))
    {
        private enum enumMixinStr_ZIP_STAT_COMP_SIZE = `enum ZIP_STAT_COMP_SIZE = 0x0008u;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_STAT_COMP_SIZE); })))
        {
            mixin(enumMixinStr_ZIP_STAT_COMP_SIZE);
        }
    }

    static if (!is(typeof(ZIP_STAT_MTIME)))
    {
        private enum enumMixinStr_ZIP_STAT_MTIME = `enum ZIP_STAT_MTIME = 0x0010u;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_STAT_MTIME); })))
        {
            mixin(enumMixinStr_ZIP_STAT_MTIME);
        }
    }

    static if (!is(typeof(ZIP_STAT_CRC)))
    {
        private enum enumMixinStr_ZIP_STAT_CRC = `enum ZIP_STAT_CRC = 0x0020u;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_STAT_CRC); })))
        {
            mixin(enumMixinStr_ZIP_STAT_CRC);
        }
    }

    static if (!is(typeof(ZIP_STAT_COMP_METHOD)))
    {
        private enum enumMixinStr_ZIP_STAT_COMP_METHOD = `enum ZIP_STAT_COMP_METHOD = 0x0040u;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_STAT_COMP_METHOD); })))
        {
            mixin(enumMixinStr_ZIP_STAT_COMP_METHOD);
        }
    }

    static if (!is(typeof(ZIP_STAT_ENCRYPTION_METHOD)))
    {
        private enum enumMixinStr_ZIP_STAT_ENCRYPTION_METHOD = `enum ZIP_STAT_ENCRYPTION_METHOD = 0x0080u;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_STAT_ENCRYPTION_METHOD); })))
        {
            mixin(enumMixinStr_ZIP_STAT_ENCRYPTION_METHOD);
        }
    }

    static if (!is(typeof(ZIP_STAT_FLAGS)))
    {
        private enum enumMixinStr_ZIP_STAT_FLAGS = `enum ZIP_STAT_FLAGS = 0x0100u;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_STAT_FLAGS); })))
        {
            mixin(enumMixinStr_ZIP_STAT_FLAGS);
        }
    }

    static if (!is(typeof(LIBZIP_VERSION)))
    {
        private enum enumMixinStr_LIBZIP_VERSION = `enum LIBZIP_VERSION = "1.5.1";`;
        static if (is(typeof({ mixin(enumMixinStr_LIBZIP_VERSION); })))
        {
            mixin(enumMixinStr_LIBZIP_VERSION);
        }
    }

    static if (!is(typeof(LIBZIP_VERSION_MAJOR)))
    {
        private enum enumMixinStr_LIBZIP_VERSION_MAJOR = `enum LIBZIP_VERSION_MAJOR = 1;`;
        static if (is(typeof({ mixin(enumMixinStr_LIBZIP_VERSION_MAJOR); })))
        {
            mixin(enumMixinStr_LIBZIP_VERSION_MAJOR);
        }
    }

    static if (!is(typeof(LIBZIP_VERSION_MINOR)))
    {
        private enum enumMixinStr_LIBZIP_VERSION_MINOR = `enum LIBZIP_VERSION_MINOR = 5;`;
        static if (is(typeof({ mixin(enumMixinStr_LIBZIP_VERSION_MINOR); })))
        {
            mixin(enumMixinStr_LIBZIP_VERSION_MINOR);
        }
    }

    static if (!is(typeof(LIBZIP_VERSION_MICRO)))
    {
        private enum enumMixinStr_LIBZIP_VERSION_MICRO = `enum LIBZIP_VERSION_MICRO = 1;`;
        static if (is(typeof({ mixin(enumMixinStr_LIBZIP_VERSION_MICRO); })))
        {
            mixin(enumMixinStr_LIBZIP_VERSION_MICRO);
        }
    }

    static if (!is(typeof(ZIP_INT8_MIN)))
    {
        private enum enumMixinStr_ZIP_INT8_MIN = `enum ZIP_INT8_MIN = ( - ZIP_INT8_MAX - 1 );`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_INT8_MIN); })))
        {
            mixin(enumMixinStr_ZIP_INT8_MIN);
        }
    }

    static if (!is(typeof(ZIP_INT8_MAX)))
    {
        private enum enumMixinStr_ZIP_INT8_MAX = `enum ZIP_INT8_MAX = 0x7f;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_INT8_MAX); })))
        {
            mixin(enumMixinStr_ZIP_INT8_MAX);
        }
    }

    static if (!is(typeof(ZIP_UINT8_MAX)))
    {
        private enum enumMixinStr_ZIP_UINT8_MAX = `enum ZIP_UINT8_MAX = 0xff;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_UINT8_MAX); })))
        {
            mixin(enumMixinStr_ZIP_UINT8_MAX);
        }
    }

    static if (!is(typeof(ZIP_INT16_MIN)))
    {
        private enum enumMixinStr_ZIP_INT16_MIN = `enum ZIP_INT16_MIN = ( - ZIP_INT16_MAX - 1 );`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_INT16_MIN); })))
        {
            mixin(enumMixinStr_ZIP_INT16_MIN);
        }
    }

    static if (!is(typeof(ZIP_INT16_MAX)))
    {
        private enum enumMixinStr_ZIP_INT16_MAX = `enum ZIP_INT16_MAX = 0x7fff;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_INT16_MAX); })))
        {
            mixin(enumMixinStr_ZIP_INT16_MAX);
        }
    }

    static if (!is(typeof(ZIP_UINT16_MAX)))
    {
        private enum enumMixinStr_ZIP_UINT16_MAX = `enum ZIP_UINT16_MAX = 0xffff;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_UINT16_MAX); })))
        {
            mixin(enumMixinStr_ZIP_UINT16_MAX);
        }
    }

    static if (!is(typeof(ZIP_INT32_MIN)))
    {
        private enum enumMixinStr_ZIP_INT32_MIN = `enum ZIP_INT32_MIN = ( - ZIP_INT32_MAX - 1L );`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_INT32_MIN); })))
        {
            mixin(enumMixinStr_ZIP_INT32_MIN);
        }
    }

    static if (!is(typeof(ZIP_INT32_MAX)))
    {
        private enum enumMixinStr_ZIP_INT32_MAX = `enum ZIP_INT32_MAX = 0x7fffffffL;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_INT32_MAX); })))
        {
            mixin(enumMixinStr_ZIP_INT32_MAX);
        }
    }

    static if (!is(typeof(ZIP_UINT32_MAX)))
    {
        private enum enumMixinStr_ZIP_UINT32_MAX = `enum ZIP_UINT32_MAX = 0xffffffffLU;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_UINT32_MAX); })))
        {
            mixin(enumMixinStr_ZIP_UINT32_MAX);
        }
    }

    static if (!is(typeof(ZIP_INT64_MIN)))
    {
        private enum enumMixinStr_ZIP_INT64_MIN = `enum ZIP_INT64_MIN = ( - ZIP_INT64_MAX - 1LL );`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_INT64_MIN); })))
        {
            mixin(enumMixinStr_ZIP_INT64_MIN);
        }
    }

    static if (!is(typeof(ZIP_INT64_MAX)))
    {
        private enum enumMixinStr_ZIP_INT64_MAX = `enum ZIP_INT64_MAX = 0x7fffffffffffffffL;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_INT64_MAX); })))
        {
            mixin(enumMixinStr_ZIP_INT64_MAX);
        }
    }

    static if (!is(typeof(ZIP_UINT64_MAX)))
    {
        private enum enumMixinStr_ZIP_UINT64_MAX = `enum ZIP_UINT64_MAX = 0xffffffffffffffffLU;`;
        static if (is(typeof({ mixin(enumMixinStr_ZIP_UINT64_MAX); })))
        {
            mixin(enumMixinStr_ZIP_UINT64_MAX);
        }
    }
    static if (!is(typeof(__GNUC_VA_LIST)))
    {
        private enum enumMixinStr___GNUC_VA_LIST = `enum __GNUC_VA_LIST = 1;`;
        static if (is(typeof({ mixin(enumMixinStr___GNUC_VA_LIST); })))
        {
            mixin(enumMixinStr___GNUC_VA_LIST);
        }
    }

    static if (!is(typeof(NULL)))
    {
        private enum enumMixinStr_NULL = `enum NULL = ( cast( void * ) 0 );`;
        static if (is(typeof({ mixin(enumMixinStr_NULL); })))
        {
            mixin(enumMixinStr_NULL);
        }
    }

}

struct __va_list_tag;
