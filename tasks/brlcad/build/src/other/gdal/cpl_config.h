/* port/cpl_config.h.in */

#if defined(_MSC_VER)

#if !defined(CPL_DISABLE_STDCALL)
#  define CPL_STDCALL __stdcall
#endif
#define HAVE_VPRINTF 1
#define HAVE_VSNPRINTF 1
#define HAVE_SNPRINTF 1
#if defined(_MSC_VER) && (_MSC_VER < 1500)
#  define vsnprintf _vsnprintf
#endif
#if defined(_MSC_VER) && (_MSC_VER < 1900)
#  define snprintf _snprintf
#endif


#define HAVE_GETCWD 1
/* gmt_notunix.h from GMT project also redefines getcwd. See #3138 */
#ifndef getcwd
#define getcwd _getcwd
#endif

/* Define to `__inline__' or `__inline' if that's what the C compiler
 * calls it, or to nothing if 'inline' is not supported under any name.  */
#ifndef __cplusplus
#  ifndef inline
#    define inline __inline
#  endif
#endif

#define lfind _lfind

#if (_MSC_VER < 1310)
#  define VSI_STAT64 _stat
#  define VSI_STAT64_T _stat
#else
#  define VSI_STAT64 _stat64
#  define VSI_STAT64_T __stat64
#endif

/* VC6 doesn't known intptr_t */
#if (_MSC_VER <= 1200)
    typedef int intptr_t;
#endif

#pragma warning(disable: 4786)

#endif /* _MSC_VER */

/* Define if you want to use pthreads based multiprocessing support */
#define CPL_MULTIPROC_PTHREAD

/* Define to 1 if you have the `PTHREAD_MUTEX_RECURSIVE' constant. */
/* #undef HAVE_PTHREAD_MUTEX_RECURSIVE */

/* Define to 1 if you have the `PTHREAD_MUTEX_ADAPTIVE_NP' constant. */
/* #undef HAVE_PTHREAD_MUTEX_ADAPTIVE_NP */

/* Define to 1 if you have the `pthread_spinlock_t' type. */
#define HAVE_PTHREAD_SPINLOCK 1

/* Define to 1 if you have the 5 args `mremap' function. */
/* #undef HAVE_5ARGS_MREMAP */

/* --prefix directory for GDAL install */
/* #undef GDAL_PREFIX */

/* Define to 1 if you have the <assert.h> header file. */
#define HAVE_ASSERT_H 1

/* Define to 1 if you have the `atoll' function. */
#define HAVE_ATOLL 1

/* Define to 1 if you have the <csf.h> header file. */
/* #undef HAVE_CSF_H */

/* Define to 1 if you have the <dbmalloc.h> header file. */
/* #undef HAVE_DBMALLOC_H */

/* Define to 1 if you have the declaration of `strtof', and to 0 if you don't. */
/* #undef HAVE_DECL_STRTOF */

/* Define to 1 if you have the <direct.h> header file. */
/* #undef HAVE_DIRECT_H */

/* Define to 1 if you have the <dlfcn.h> header file. */
#define HAVE_DLFCN_H 1

/* Define to 1 if you don't have `vprintf' but do have `_doprnt.' */
/* #undef HAVE_DOPRNT */

/* Define to 1 if you have the <errno.h> header file. */
#define HAVE_ERRNO_H 1

/* Define to 1 if you have the <fcntl.h> header file. */
#define HAVE_FCNTL_H 1

/* Define to 1 if you have the <float.h> header file. */
#define HAVE_FLOAT_H 1

/* Define to 1 if you have the `getcwd' function. */
#if !defined(_MSC_VER)
#define HAVE_GETCWD 1
#endif

/* Define if you have the iconv() function and it works. */
#define HAVE_ICONV 

/* Define as 0 or 1 according to the floating point format supported by the
   machine */
#define HAVE_IEEEFP 1

/* Define to 1 if the system has the type `int16'. */
/* #undef HAVE_INT16 */

/* Define to 1 if the system has the type `int32'. */
/* #undef HAVE_INT32 */

/* Define to 1 if the system has the type `int8'. */
/* #undef HAVE_INT8 */

/* Define to 1 if the system has the type `__uint128_t'. */
#define HAVE_UINT128_T 1

/* Define to 1 if you have the <inttypes.h> header file. */
#define HAVE_INTTYPES_H 1

/* Define to 1 if you have the <jpeglib.h> header file. */
/* #undef HAVE_JPEGLIB_H */

/* Define to 1 if you have the `dl' library (-ldl). */
#define HAVE_LIBDL 1

/* Define to 1 if you have the `m' library (-lm). */
#define HAVE_LIBM 1

/* Define to 1 if you have the `pq' library (-lpq). */
/* #undef HAVE_LIBPQ */

/* Define to 1 if you have the `rt' library (-lrt). */
/* #undef HAVE_LIBRT */

/* Define to 1 if you have the <limits.h> header file. */
#define HAVE_LIMITS_H 1

/* Define to 1 if you have the <locale.h> header file. */
#define HAVE_LOCALE_H 1

/* Define to 1 if you have the <xlocale.h> header file. */
/* #undef HAVE_XLOCALE_H */

/* Define to 1, if your compiler supports long long data type */
#define HAVE_LONG_LONG 1

/* Define to 1, if your compiler supports uintptr_t data type */
#define HAVE_UINTPTR_T 1

/* Define to 1 if you have the <memory.h> header file. */
#define HAVE_MEMORY_H 1

/* Define to 1 if you have the <png.h> header file. */
/* #undef HAVE_PNG_H */

/* Define to 1 if you have the `snprintf' function. */
#if !defined(_MSC_VER)
#define HAVE_SNPRINTF 1
#endif

/* Define to 1 if you have the <stdint.h> header file. */
#define HAVE_STDINT_H 1

/* Define to 1 if you have the <stdlib.h> header file. */
#define HAVE_STDLIB_H 1

/* Define to 1 if you have the <strings.h> header file. */
#define HAVE_STRINGS_H 1

/* Define to 1 if you have the <string.h> header file. */
#define HAVE_STRING_H 1

/* Define to 1 if you have the `strtof' function. */
#define HAVE_STRTOF 1

/* Define to 1 if you have the <sys/stat.h> header file. */
#define HAVE_SYS_STAT_H 1

/* Define to 1 if you have the <sys/types.h> header file. */
#define HAVE_SYS_TYPES_H 1

/* Define to 1 if you have the <unistd.h> header file. */
#define HAVE_UNISTD_H 1

/* Define to 1 if you have the <values.h> header file. */
#define HAVE_VALUES_H 1

/* Define to 1 if you have the `vprintf' function. */
#define HAVE_VPRINTF 1

/* Define to 1 if you have the `vsnprintf' function. */
#define HAVE_VSNPRINTF 1

/* Define to 1 if you have the `readlink' function. */
#define HAVE_READLINK 1

/* Define to 1 if you have the `posix_spawnp' function. */
#define HAVE_POSIX_SPAWNP 1

/* Define to 1 if you have the `posix_memalign' function. */
#define HAVE_POSIX_MEMALIGN 1

/* Define to 1 if you have the `vfork' function. */
#define HAVE_VFORK 1

/* Define to 1 if you have the `mmap' function. */
#define HAVE_MMAP 1

/* Define to 1 if you have the statvfs' function. */
#define HAVE_STATVFS 1

/* Define to 1 if you have the `statvfs64' function. */
#define HAVE_STATVFS64 1

/* Define to 1 if you have the `lstat' function. */
#define HAVE_LSTAT 1

/* Set the native cpu bit order (FILLORDER_LSB2MSB or FILLORDER_MSB2LSB) */
#define HOST_FILLORDER FILLORDER_LSB2MSB

/* Define as const if the declaration of iconv() needs const. */
#define ICONV_CONST 

/* For .cpp files, define as const if the declaration of iconv() needs const. */
#define ICONV_CPP_CONST 

/* Define to 1 if libjvm.so should be dlopen'd */
/* #undef JVM_LIB_DLOPEN */

/* Define for Mac OSX Framework build */
/* #undef MACOSX_FRAMEWORK */

/* The size of `int', as computed by sizeof. */
#define SIZEOF_INT 4

/* The size of `long', as computed by sizeof. */
#define SIZEOF_LONG 8

/* The size of `unsigned long', as computed by sizeof. */
#define SIZEOF_UNSIGNED_LONG 8

/* The size of `void*', as computed by sizeof. */
#define SIZEOF_VOIDP 8

/* Define to 1 if you have the ANSI C header files. */
#define STDC_HEADERS 1

/* Define to 1 if you have fseek64, ftell64 */
/* #undef UNIX_STDIO_64 */

/* Define to 1 if you want to use the -fvisibility GCC flag */
/* #undef USE_GCC_VISIBILITY_FLAG */

/* Define to 1 if GCC atomic builtins are available */
/* #undef HAVE_GCC_ATOMIC_BUILTINS */

/* Define to 1 if GCC bswap builtins are available */
/* #undef HAVE_GCC_BSWAP */

/* Define to name of 64bit fopen function */
/* #undef VSI_FOPEN64 */

/* Define to name of 64bit ftruncate function */
/* #undef VSI_FTRUNCATE64 */

/* Define to name of 64bit fseek func */
/* #undef VSI_FSEEK64 */

/* Define to name of 64bit ftell func */
/* #undef VSI_FTELL64 */

/* Define to 1, if you have 64 bit STDIO API */
/* #undef VSI_LARGE_API_SUPPORTED */

/* Define to 1, if you have LARGEFILE64_SOURCE */
/* #undef VSI_NEED_LARGEFILE64_SOURCE */

/* Define to name of 64bit stat function */
#if !defined(_MSC_VER)
/* #undef VSI_STAT64 */
#endif

/* Define to name of 64bit stat structure */
#if !defined(_MSC_VER)
/* #undef VSI_STAT64_T */
#endif

/* Define to 1 if your processor stores words with the most significant byte
   first (like Motorola and SPARC, unlike Intel and VAX). */
/* #undef WORDS_BIGENDIAN */

/* Define to 1 if you have the `getaddrinfo' function. */
#define HAVE_GETADDRINFO 1

/* Define to 1 if you have the _SC_PHYS_PAGES' constant. */
/* #undef HAVE_SC_PHYS_PAGES */

/* Define to 1 if you have the `uselocale' function. */
#define HAVE_USELOCALE 1

/* Define to 1 if you have the `std::isnan' function. */
/* #undef HAVE_STD_IS_NAN */
