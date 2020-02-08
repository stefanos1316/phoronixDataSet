/*                    B U _ T E S T . C . I N
 * BRL-CAD
 *
 * Copyright (c) 2011-2018 United States Government as represented by
 * the U.S. Army Research Laboratory.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public License
 * version 2.1 as published by the Free Software Foundation.
 *
 * This library is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this file; see the file named COPYING for more
 * information.
 */

#include "common.h"

#include <stdio.h>
#include <string.h>

#include "bu.h"

#if defined(HAVE_ISINF) && !defined(HAVE_DECL_ISINF) && !defined(isinf)
extern int isinf(double x);
#endif

/* test sources */

#define main b64_main
#include "libbu/tests/b64.c"
#undef main

#define main badmagic_main
#include "libbu/tests/badmagic.c"
#undef main

#define main basename_main
#include "libbu/tests/basename.c"
#undef main

#define main bitv_main
#include "libbu/tests/bitv.c"
#undef main

#define main booleanize_main
#include "libbu/tests/booleanize.c"
#undef main

#define main color_main
#include "libbu/tests/color.c"
#undef main

#define main datetime_main
#include "libbu/tests/datetime.c"
#undef main

#define main dir_main
#include "libbu/tests/dir.c"
#undef main

#define main dirname_main
#include "libbu/tests/dirname.c"
#undef main

#define main encode_main
#include "libbu/tests/encode.c"
#undef main

#define main escape_main
#include "libbu/tests/escape.c"
#undef main

#define main file_mime_main
#include "libbu/tests/file_mime.c"
#undef main

#define main heap_main
#include "libbu/tests/heap.c"
#undef main

#define main hook_main
#include "libbu/tests/hook.c"
#undef main

#define main humanize_number_main
#include "libbu/tests/humanize_number.c"
#undef main

#define main vls_incr_main
#include "libbu/tests/vls_incr.c"
#undef main

#define main vls_simplify_main
#include "libbu/tests/vls_simplify.c"
#undef main

#define main opt_main
#include "libbu/tests/opt.c"
#undef main

#define main parallel_main
#include "libbu/tests/parallel.c"
#undef main

#define main path_component_main
#include "libbu/tests/path_component.c"
#undef main

#define main ptbl_main
#include "libbu/tests/ptbl.c"
#undef main

#define main redblack_main
#include "libbu/tests/redblack.c"
#undef main

#define main semaphore_main
#include "libbu/tests/semaphore.c"
#undef main

#define main sort_main
#include "libbu/tests/sort.c"
#undef main

#define main str_main
#include "libbu/tests/str.c"
#undef main

#define main str_isprint_main
#include "libbu/tests/str_isprint.c"
#undef main

#define main uuid_main
#include "libbu/tests/uuid.c"
#undef main

#define main vls_main
#include "libbu/tests/vls.c"
#undef main

#define main vls_vprintf_main
#include "libbu/tests/vls_vprintf.c"
#undef main


int
main(int ac, char *av[])
{
    if (ac < 2)
	bu_exit(1, "Usage: %s [test] [options]\n\nAvailable tests:\n\n	b64\n	badmagic\n	basename\n	bitv\n	booleanize\n	color\n	datetime\n	dir\n	dirname\n	encode\n	escape\n	file_mime\n	heap\n	hook\n	humanize_number\n	vls_incr\n	vls_simplify\n	opt\n	parallel\n	path_component\n	ptbl\n	redblack\n	semaphore\n	sort\n	str\n	str_isprint\n	uuid\n	vls\n	vls_vprintf", av[0]);

    ac--; av++;

    
	if (BU_STR_EQUAL(av[0], "b64")) return b64_main(ac,av);
	if (BU_STR_EQUAL(av[0], "badmagic")) return badmagic_main(ac,av);
	if (BU_STR_EQUAL(av[0], "basename")) return basename_main(ac,av);
	if (BU_STR_EQUAL(av[0], "bitv")) return bitv_main(ac,av);
	if (BU_STR_EQUAL(av[0], "booleanize")) return booleanize_main(ac,av);
	if (BU_STR_EQUAL(av[0], "color")) return color_main(ac,av);
	if (BU_STR_EQUAL(av[0], "datetime")) return datetime_main(ac,av);
	if (BU_STR_EQUAL(av[0], "dir")) return dir_main(ac,av);
	if (BU_STR_EQUAL(av[0], "dirname")) return dirname_main(ac,av);
	if (BU_STR_EQUAL(av[0], "encode")) return encode_main(ac,av);
	if (BU_STR_EQUAL(av[0], "escape")) return escape_main(ac,av);
	if (BU_STR_EQUAL(av[0], "file_mime")) return file_mime_main(ac,av);
	if (BU_STR_EQUAL(av[0], "heap")) return heap_main(ac,av);
	if (BU_STR_EQUAL(av[0], "hook")) return hook_main(ac,av);
	if (BU_STR_EQUAL(av[0], "humanize_number")) return humanize_number_main(ac,av);
	if (BU_STR_EQUAL(av[0], "vls_incr")) return vls_incr_main(ac,av);
	if (BU_STR_EQUAL(av[0], "vls_simplify")) return vls_simplify_main(ac,av);
	if (BU_STR_EQUAL(av[0], "opt")) return opt_main(ac,av);
	if (BU_STR_EQUAL(av[0], "parallel")) return parallel_main(ac,av);
	if (BU_STR_EQUAL(av[0], "path_component")) return path_component_main(ac,av);
	if (BU_STR_EQUAL(av[0], "ptbl")) return ptbl_main(ac,av);
	if (BU_STR_EQUAL(av[0], "redblack")) return redblack_main(ac,av);
	if (BU_STR_EQUAL(av[0], "semaphore")) return semaphore_main(ac,av);
	if (BU_STR_EQUAL(av[0], "sort")) return sort_main(ac,av);
	if (BU_STR_EQUAL(av[0], "str")) return str_main(ac,av);
	if (BU_STR_EQUAL(av[0], "str_isprint")) return str_isprint_main(ac,av);
	if (BU_STR_EQUAL(av[0], "uuid")) return uuid_main(ac,av);
	if (BU_STR_EQUAL(av[0], "vls")) return vls_main(ac,av);
	if (BU_STR_EQUAL(av[0], "vls_vprintf")) return vls_vprintf_main(ac,av);

    bu_log("\nError: Unknown test type: %s\n\n", av[0]);

    return 1;
}


/*
 * Local Variables:
 * mode: C
 * tab-width: 8
 * indent-tabs-mode: t
 * c-file-style: "stroustrup"
 * End:
 * ex: shiftwidth=4 tabstop=8
 */
