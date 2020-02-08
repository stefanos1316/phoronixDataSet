/*                  B R L C A D _ I D E N T . H
 * BRL-CAD
 *
 * Copyright (c) 2007-2018 United States Government as represented by
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
/** @file brlcad_version.h
 *
 * Header for determining compile-time information about BRL-CAD.
 *
 * External applications are discouraged from using compile-time API.
 * They should use the library-specific LIBRARY_version() functions.
 * (e.g. bu_version())
 *
 * NOTE: In order to use compile-time API, applicaitons need to define
 * BRLCADBUILD and HAVE_CONFIG_H before including this header.
 */

#ifndef BRLCAD_IDENT_H
#define BRLCAD_IDENT_H

#include "common.h"

/* for snprintf */
#include <stdio.h>
/* for strlen */
#include <string.h>

#include "brlcad_version.h"


/* Compilation Settings */

/**
 * Compilation date, updated every time a build pass occurs.
 */
static const char *BRLCAD_DATE = "Sat, 08 Feb 2020 20:03:25 +0200";

/**
 * Compilation host, updated every time a build pass occurs.
 */
static const char *BRLCAD_HOST = "sgeorgiou";

/**
 * Compilation user, updated every time a build pass occurs.
 */
static const char *BRLCAD_USER = "sgeorgiou";

/**
 * Compilation count, updated every time a build pass occurs.
 */
static const int BRLCAD_COUNT = 0;

/**
 * Configured installation root, sometimes not used.
 */
static const char *BRLCAD_ROOT = "/usr/brlcad/rel-7.28.0";


/**
 * Provides the release identifier details along with basic
 * configuration and compilation information.
 */
static const char *
brlcad_ident(const char *title)
{
    static char ident[1024] = {0};
    size_t isize = 0;

    /* header */
    snprintf(ident, 1024, "BRL-CAD Release %s", brlcad_version());

    /* optional title */
    isize = strlen(ident);

    /* TODO - BRLCAD_ROOT has nothing to do with printing the title.
     * Ugly hack to quell a compiler warning about BRLCAD_ROOT sometimes being
     * unused, until the proper fix is in place. */
    if (title && BRLCAD_ROOT)
	snprintf(ident + isize, 1024 - isize, "  %s\n", title);

    /* compile info */
    isize = strlen(ident);
    snprintf(ident + isize, 1024 - isize,
	     "    %s, Compilation %d\n"
	     "    %s@%s\n",
	     BRLCAD_DATE, BRLCAD_COUNT,
	     BRLCAD_USER, BRLCAD_HOST
	);

    return ident;
}


#endif /* BRLCAD_IDENT_H */

/*
 * Local Variables:
 * tab-width: 8
 * mode: C
 * indent-tabs-mode: t
 * c-file-style: "stroustrup"
 * End:
 * ex: shiftwidth=4 tabstop=8
 */