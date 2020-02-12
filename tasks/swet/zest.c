
/*
 *          |          _                     _______________________
 *          |\       _/ \_                  |                       |
 *          | \_    /_    \_                |    Alexandre Botao    |
 *          \   \__/  \__   \               |     www.botao.org     |
 *           \_    \__/  \_  \              |    55-11-8244-UNIX    |
 *             \_   _/     \ |              |  alexandre@botao.org  |
 *               \_/        \|              |_______________________|
 *                           |
 */

/*______________________________________________________________________
 |                                                                      |
 |  This code is free software: you can redistribute it and/or modify   |
 |  it under the terms of the GNU General Public License as published   |
 |  by the Free Software Foundation, either version 3 of the License,   |
 |  or (at your option) any later version.                              |
 |                                                                      |
 |  This code is distributed in the hope that it will be useful,        |
 |  but WITHOUT ANY WARRANTY; without even the implied warranty of      |
 |  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.                |
 |  See the GNU General Public License for more details.                |
 |                                                                      |
 |  You should have received a copy of the GNU General Public License   |
 |  along with this code.  If not, see <http://www.gnu.org/licenses/>,  |
 |  or write to the Free Software Foundation, Inc.,                     |
 |  59 Temple Place, Suite 330, Boston, MA  02111-1307  USA.            |
 |______________________________________________________________________|
 */

/*
 *
 *		  /\		 ___________________________________________________
 *		 /  \		|													|
 *		/ OO \		|	zest.c						system info probe	|
 *		\ \/ /		|	(c) 1995-2012			alexandre v. r. botao	|
 *		 \  /		|___________________________________________________|
 *		  \/
 *
 */

# include <ctype.h>
# include <stdio.h>
# include <stdlib.h>
# include <string.h>
# include <sys/types.h>
# include <sys/utsname.h>

# include	"bud.h"

# include	"config.h"

static int zrd ;
static struct utsname utsbuf ;
static char * zosname = NULL ;

/*\___________________________________________________________________________
\*/

void zestinit () {
	if ( zosname == NULL ) {
		zrd = uname ( &utsbuf ) ;
		zosname = strdup ( ( zrd == -1 ) ? "unkOS" : utsbuf.sysname ) ;
	}
}

/*\___________________________________________________________________________
\*/

char * getverno (buf) char * buf ; {
	static		char vbuf [64] ;
	register	char * bp ;
	register	char * vp ;

	for ( bp = buf , vp = vbuf ; *bp && ( isdigit ((int)(*bp)) || *bp == '.' ) ; ++bp , ++vp )
		*vp = *bp ;
	*vp = '\0' ;
	return vbuf ;
}

/*\___________________________________________________________________________
\*/

char * getosname () {
	zestinit () ;
	return zosname ;
}

char * cpufam = "weird" ;

char * getosvers () {
	struct utsname * unp ;
	static		char tbuf [64] ;
	zestinit () ;
	unp = &utsbuf ;
#ifdef HPUX
				long cpuver ;
#endif

	if ( 0 == strcmp ( unp->sysname , "AIX" ) ) {
#ifdef AIX
		if ( _system_configuration.architecture == POWER_RS ) {
			cpufam = strdup ("rspower");
		} else if ( _system_configuration.architecture == IA64 ) {
			cpufam = strdup ("ia64");
		} else if ( _system_configuration.architecture == POWER_PC ) {
			if ( _system_configuration.implementation == POWER_4 ) {
				cpufam = strdup ("power4");
			} else if ( _system_configuration.implementation == POWER_5 ) {
				cpufam = strdup ("power5");
			} else if ( _system_configuration.implementation == POWER_6 ) {
				cpufam = strdup ("power6");
			} else if ( _system_configuration.implementation == POWER_7 ) {
				cpufam = strdup ("power7");
			} else {
				cpufam = strdup ("powerpc");
			}
		} else {
			cpufam = strdup ("ibmaixcpu") ;
		}
# ifdef CF_CPU_FAM
		cpufam = strdup (CF_CPU_FAM) ;
# endif
#endif
		sprintf (tbuf, "%s.%s", unp->version, unp->release) ;
		return tbuf ;
	}

	if ( 0 == strcmp ( unp->sysname , "SunOS" ) ) {
#ifdef SUNX
		if ( sysinfo ( SI_ARCHITECTURE , tbuf , 64 ) < 0 )
			cpufam = "sunoscpu" ;
		else
			cpufam = strdup ( tbuf ) ;
#endif
		return unp->release ;
	}

	if ( 0 == strcmp ( unp->sysname , "HP-UX" ) ) {
#ifdef HPUX
#ifndef CPU_IA64_ARCHREV_0
/* HP-UX 11.11 doesn't define this, so take it from 11.31's <sys/unistd.h> */
#define CPU_IA64_ARCHREV_0       0x300 /* IA-64 archrev 0 */
#endif
		if ( 0 == strcmp ( unp->machine , "ia64" ) ) {
			{
				cpufam = strdup ( unp->machine ) ;
			}
		} else {
			cpuver = sysconf (_SC_CPU_VERSION);
			if (cpuver == CPU_IA64_ARCHREV_0) {
				cpufam = strdup ("ia64");
			} else if (CPU_IS_HP_MC68K(cpuver)) {
				cpufam = strdup ("mc68k");
			} else if (CPU_IS_PA_RISC(cpuver)) {
				cpufam = strdup ("parisc");
			} else {
				cpufam = "hpuxcpu" ;
			}
		}
#endif
		return unp->release ;
	}

	if ( 0 == strcmp ( unp->sysname , "OpenBSD" ) ) {
		cpufam = strdup ( unp->machine ) ;
		return unp->release ;
	}

	if ( 0 == strcmp ( unp->sysname , "NetBSD" ) ) {
		cpufam = strdup ( unp->machine ) ;
		return unp->release ;
	}

	if ( 0 == strcmp ( unp->sysname , "FreeBSD" ) ) {
		cpufam = strdup ( unp->machine ) ;
		return getverno ( unp->release ) ;
	}

	if ( 0 == strncmp ( unp->sysname, "CYGWIN" , 6 ) ) {
		cpufam = strdup ( unp->machine ) ;
# ifdef L8R
		*(osname+6) = '\0' ;
# endif
		return getverno ( unp->release ) ;
	}

	if ( 0 == strcmp ( unp->sysname , "Linux" ) ) {
		cpufam = strdup ( unp->machine ) ;
		return getverno ( unp->release ) ;
	}

	cpufam = "gencpu" ;
	return "?.?" ;
}

/*\	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
\*/

#ifdef LINUX

struct distroinf {
	char *	di_sys ;
	char *	di_nam ;
	char *	di_rel ;
} ;

typedef		struct distroinf		DISTROINF ;

DISTROINF distrotab [ ] = {
	{ "SuSE",		"suse",			"/etc/SuSE-release"				} ,
	{ "SuSE",		"suse",			"/etc/SUSE-release"				} ,
	{ "Fedora",		"fedora",		"/etc/fedora-release"			} ,
	{ "RedHat",		"red hat",		"/etc/redhat-release"			} ,
	{ "CentOS",		"centos",		"/etc/redhat-release"			} ,
	{ "RedHat",		"red hat",		"/etc/redhat_version"			} ,
	{ "Slackware",	"slackware",	"/etc/slackware-release"		} ,
	{ "Slackware",	"slackware",	"/etc/slackware-version"		} ,
	{ "Ubuntu",		"ubuntu",		"/etc/lsb-release"				} ,
	{ "Debian",		"debian",		"/etc/debian_release"			} ,
	{ "Debian",		"debian",		"/etc/debian_version"			} ,
	{ "Mandriva",	"mandriva",		"/etc/mandriva-release"			} ,
	{ "Mandrake",	"mandrake",		"/etc/mandrake-release"			} ,
	{ "Mandrake",	"mandrake",		"/etc/mandrakelinux-release"	} ,
	{ "YellowDog",	"yellow dog",	"/etc/yellowdog-release"		} ,
	{ "YellowDog",	"yellowdog",	"/etc/yellowdog-release"		} ,
	{ "SunJDS",		"sunjds",		"/etc/sun-release"				} ,
	{ "Solaris",	"solaris",		"/etc/release"					} ,
	{ "Gentoo",		"gentoo",		"/etc/gentoo-release"			} ,
	{ "United",		"united",		"/etc/UnitedLinux-release"		} ,
	{ "RSA",		"RSA",			"/etc/distro-release"			} ,
	{ NULL,			NULL,			NULL							} 
} ;

char * getdistro () {
			int i ;
			DISTROINF * dip ;
			char * np = NULL ;
			char tmplinbuf [256] ;
			char provernam [32] ;
			char etcrelnam [32] ;
	static	char distronam [32] ;
			FILE * fp = fopen ("/proc/version", "r") ;
	zestinit () ;
	tmplinbuf [0] = provernam [0] = etcrelnam [0] = distronam [0] = '\0' ;
	if ( fp != NULL ) {
		if ( fgets ( tmplinbuf, 256, fp ) != NULL ) {
			fclose (fp) ;
			for ( i = 0 ; i < 256 && tmplinbuf[i] != '\0' ; ++i ) {
				tmplinbuf[i] = tolower ( (int)tmplinbuf[i] ) ;
			}
			for ( dip = distrotab ; dip->di_sys != NULL ; ++dip ) {
				if ( NULL != strstr ( tmplinbuf , dip->di_nam ) ) {
					strcpy ( provernam , dip->di_sys ) ;
					break ;
				}
			}
		}
	}
	for ( dip = distrotab , tmplinbuf[0] = '\0' ; dip->di_sys != NULL ; ++dip ) {
		if ( access ( dip->di_rel , F_OK ) == 0 ) {
			strcpy ( etcrelnam , dip->di_sys ) ;
			if ( NULL != ( fp = fopen ( dip->di_rel, "r" ) ) ) {
				while ( fgets ( tmplinbuf, 256, fp ) != NULL ) {
					for ( i = 0 ; i < 256 && tmplinbuf[i] != '\0' ; ++i ) {
						if ( isdigit ( (int)tmplinbuf[i] ) ) {
							np = &tmplinbuf[i] ;
							break ;
						}
					}
					if ( np != NULL ) {
						break ;
					}
				}
				fclose (fp) ;
			}
			break ;
		}
	}
	if ( provernam[0] == '\0' ) {
		if ( etcrelnam[0] == '\0' ) {
			return "gnu-2" ;
		} else {
			strcpy ( distronam , etcrelnam ) ;
		}
	} else {
		strcpy ( distronam , provernam ) ;
	}
	if ( etcrelnam[0] != '\0' && tmplinbuf[0] != '\0' ) {
		if ( NULL != strstr ( tmplinbuf , "Red Hat Enterprise Linux" ) ) {
			strcpy ( distronam , "RHEL" ) ;
			if ( NULL != strstr ( tmplinbuf , " AS " ) ) {
				strcat ( distronam , "-AS" ) ;
			} else if ( NULL != strstr ( tmplinbuf , " ES " ) ) {
				strcat ( distronam , "-ES" ) ;
			} else if ( NULL != strstr ( tmplinbuf , " WS " ) ) {
				strcat ( distronam , "-WS" ) ;
			}
		} else if ( NULL != strstr ( tmplinbuf , "CentOS" ) ) {
			strcpy ( distronam , "CentOS" ) ;
		} else if ( NULL != strstr ( tmplinbuf , "Fedora" ) ) {
			strcpy ( distronam , "Fedora" ) ;
		} else if ( NULL != strstr ( tmplinbuf , "SUSE Linux Enterprise Server" ) ) {
			strcpy ( distronam , "SLES" ) ;
		} else if ( NULL != strstr ( tmplinbuf , "Mandriva Linux Corporate Server" ) ) {
			strcpy ( distronam , "MLCS" ) ;
		}
	}
	if ( np != NULL ) {
		strcat ( distronam , "-" ) ;
		strcat ( distronam , getverno ( np ) ) ;
	}
	return distronam ;
}

#endif

/*\___________________________________________________________________________
\*/

long hms2sec (s) char * s ; {
	long nsec = 0 , tsec = 0 ;
	int ck = 0 ;
	register char * p = s ;
	if ( p == NULL )
		return -1L ;
	if ( ! ( *p >= '0' && *p <= '9' ) )
		return -2L ;
	while ( *p ) {
		if ( *p >= '0' && *p <= '9' ) {
			nsec = ( 10 * nsec ) + ( *p - '0' ) ;
		} else if ( *p == ':' ) {
			if ( ++ck > 2 ) {
				return -2L ;
			}
			tsec = ( 60 * tsec ) + ( 60 * nsec ) ; nsec = 0 ;
		} else {
			return -2L ;
		}
		++p ;
	}
	return tsec + nsec ;
}

#ifdef TSTHMS2SEC
main (argc, argv) char * * argv ; {

	while (*++argv)
		printf ("<%s>=%lds\n", *argv, hms2sec(*argv)) ;
}
#endif

/*__________________________________________________________________________
 *	binio : bit stringz...
 */

unsigned long long bits2ull (bsp) char * bsp ; {
	unsigned long long bit = 0ULL ;
	unsigned long long val = 0ULL ;
	register int bsl = 0 ;
	if ( bsp == NULL )
		return 0ULL ;
	bsl = strlen (bsp) ;
	if ( bsl > 64 )
		return 0ULL ;
	for ( --bsl , bit = 0x01ULL ; bsl >= 0 ; --bsl , bit <<= 1 )
		if ( *(bsp+bsl) == '1' )
			val |= bit ;
	return val ;
}

char * ull2bits (val) unsigned long long val ; {
	unsigned long long bit = 0ULL ;
	static char bitbuf [65] ;
	register int i = 0 ;
	bitbuf[64] = '\0' ;
	for ( i = 0 , bit = 0x8000000000000000ULL ; bit != 0x00 ; ++i , bit >>= 1 )
		bitbuf [i] = val & bit ? '1' : '0' ;
	return bitbuf ;
}

#ifdef TSTBINIO
long long llval ;
void usage () {
	printf ("use: binio [-?] [-d decval] [-b binval]\n") ;
	exit (1) ;
}
int main (argc, argv) int argc ; char * * argv ; {
	char * bsp = NULL ;
	while ( *++argv ) {
		if ( strcmp (*argv, "-?") == 0 ) {
			usage () ;
		} else if ( strcmp (*argv, "-b") == 0 ) {
			bsp = *++argv ;
			printf ( "%s=%lld\n" , bsp , bits2ull ( bsp ) ) ;
		} else if ( strcmp (*argv, "-d") == 0 ) {
			sscanf ( *++argv, "%lld", &llval ) ;
			printf ( "%lld=%s\n" , llval , ull2bits ( llval ) ) ;
		} else {
			usage () ;
		}
	}
	return 0 ;
}
#endif

/*____________________________________________________________________________
*/

char *signame(sig) int sig;
{
#ifdef NO_STRSIGNAL
   static char sigmess[BUFSIZ];
   (void)sprintf(sigmess,"SIG%d",sig);
   return(sigmess);
#else
   return strsignal (sig) ;
#endif
}

/*____________________________________________________________________________
*/

# ifdef USEITOSTR
char * itostr (int x) {
	static char s[32] ;
	sprintf (s, "%d", x) ;
	return s ;
}
# endif

/*____________________________________________________________________________
*/

long long getsysram () {
	long long z = -1LL ;
#ifdef AIX
	z = (long long) sysconf(_SC_AIX_REALMEM) ;
	z = 1024LL * z ;
#endif
#ifdef HPUX
	z = (long long) sysconf(_SC_MEM_MBYTES);
	z = 1000000LL * z ;
#endif
#if defined(LINUX) || defined(SUNX) || defined(CYGWIN)
	long pp = sysconf(_SC_PHYS_PAGES) ;
	long ps = sysconf(_SC_PAGE_SIZE) ;
	z = (long long)pp * (long long)ps ;
#endif
	return z ;
}

/*____________________________________________________________________________
*/

int			cpucount = 0 ;
long long	cpuclock = 0 ;	/*	in Hz	*/
char *      cpumodel = "generic" ;

char *      cpunotfound = "unavailable" ;

char		txtcpucount [32] ;
char		txtcpuclock [32] ;
char		txtcpumodel [32] ;
char		txtcpubrand [32] ;

/*\	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
\*/

char * getcpuinf (what) char * what ; {

	cpucount = 0 ;
	cpuclock = 0 ;

#ifdef SUNX

	processorid_t i , cpuid_max ;
	processor_info_t infop ;

	cpuid_max = sysconf(_SC_CPUID_MAX) ;
	if ( (long)cpuid_max == -1L ) {
		return cpunotfound ;
	}
   	for ( i = 0 ; i <= cpuid_max ; i++ ) {
		if ( p_online ( i , P_STATUS ) != -1 ) {
			++cpucount ;
			if ( processor_info ( i , &infop ) != -1 ) {
				cpuclock = 1000000LL * infop.pi_clock ;
			}
		}
   	}

#endif /* SUNX */

/*\	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
\*/

#ifdef AIX

	struct CuDv *q;
	CLASS_SYMBOL cudv;
	char * devname = "proc0" ;
	char * attrname = "frequency" ;
	int getall = 0 ;
	int howmany ;
	struct CuAt * captr ;

	if (odm_initialize())
		return cpunotfound ;

    cudv = odm_open_class_rdonly(CuDv_CLASS);

    if (cudv == (CLASS_SYMBOL) -1) {
		odm_terminate();
		return cpunotfound ;
    }

    q = odm_get_first(cudv, "name like 'proc*'", NULL);

    if ((q == NULL) || (q == (struct CuDv *) -1)) {
		odm_close_class(cudv);
		odm_terminate();
		return cpunotfound ;
    }

    devname = strdup (q->name);

	do {
		++cpucount ;
		q = odm_get_next (cudv, NULL);
	} while ( ( q != NULL ) && ( q != (struct CuDv *) -1 ) ) ;

    free(q);
    odm_close_class(cudv);

	captr = getattr (devname, attrname, getall, &howmany) ;

	if ( captr == NULL ) {
		odm_terminate();
        return cpunotfound ;
	}

	sscanf ( captr->value , "%lld" , &cpuclock ) ;

    captr = getattr (devname, "type", getall, &howmany) ;

    if ( captr == NULL ) {
        odm_terminate();
        return cpunotfound ;
    }

    cpumodel = strdup ( captr->value ) ;

	odm_terminate () ;

#endif /* AIX */

/*\	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
\*/

#ifdef HPUX

	struct pst_processor pinfo;
	struct pst_dynamic psd;
	long clktck = 0 , chiptype = 0 , cpuver = 0 ;
	static char * cpuarcht [] = { "HP" , "PA-RISC" , "Itanium" , NULL } ;

	if (pstat_getdynamic(&psd, sizeof(psd), 1, 0) == -1) {
		return cpunotfound ;
	}

	cpucount = (int)(psd.psd_proc_cnt);

	if (pstat_getprocessor(&pinfo, sizeof(pinfo), 1, 0) == -1) {
		return cpunotfound ;
	}

#ifdef HPUX1131
	cpuclock = (long long)(pinfo.psp_cpu_frequency);
#endif /* HPUX1131 */

	if ( cpuclock <= 0 ) {
		clktck = sysconf(_SC_CLK_TCK);
		if ( clktck == -1L ) {
			return cpunotfound ;
		} else {
			cpuclock = (long long)(pinfo.psp_iticksperclktick) * clktck ;
		}
	}

#ifdef HPUX1131
	cpumodel = cpuarcht [ (int) pinfo.psp_cpu_architecture ] ;
#endif /* HPUX1131 */

	chiptype = sysconf(_SC_CPU_CHIP_TYPE);
	cpuver = sysconf(_SC_CPU_VERSION);

	switch ( chiptype ) {
		case 0x20000704 : cpumodel = strdup ( "Itanium2-9000" ) ;	break ;
		case 0x20010104 : cpumodel = strdup ( "Itanium2-9100" ) ;	break ;
		case 0x00000285 : cpumodel = strdup ( "PA8800" ) ;			break ;
		case 0x0000028a : cpumodel = strdup ( "PA8900" ) ;			break ;
	}

# ifdef CHIPRANG
	switch ( chiptype >> 5 ) {
		case	0x000b : cpumodel = strdup ( "PA7200"		) ;		break ;
		case	0x000d : cpumodel = strdup ( "PA7100LC"		) ;		break ;
		case	0x000e : cpumodel = strdup ( "PA8000"		) ;		break ;
		case	0x000f : cpumodel = strdup ( "PA7300LC"		) ;		break ;
		case	0x0010 : cpumodel = strdup ( "PA8200"		) ;		break ;
		case	0x0011 : cpumodel = strdup ( "PA8500"		) ;		break ;
		case	0x0012 : cpumodel = strdup ( "PA8600"		) ;		break ;
		case	0x0013 : cpumodel = strdup ( "PA8700"		) ;		break ;
		case	0x0015 : cpumodel = strdup ( "PA8750"		) ;		break ;
	}
# endif /* CHIPRANG */

#endif /* HPUX */

/*\	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
\*/

#if defined(LINUX) || defined(CYGWIN)

	FILE * fp = NULL ;
	char pciline [512] ;
	char * np = NULL ;
	double dclock = 0.0 ;

	fp = fopen ( "/proc/cpuinfo" , "r" ) ;

	if ( fp == NULL ) {
		return cpunotfound ;
	}

	while ( NULL != fgets ( pciline , 512 , fp ) ) {
		if ( NULL != (char *) strcasestr ( pciline , "cpu" ) ) {
			if ( NULL != (char *) strcasestr ( pciline , "mhz" ) ) {
				++cpucount ;
				if ( NULL != ( np = strchr ( pciline , ':' ) ) ) {
					sscanf ( 1+np , "%lf" , &dclock ) ;
					cpuclock = (long long) ( 1000000.0 * dclock ) ;
				}
			}
		}
	}

	fclose (fp) ;

#endif /* LNX/CYG */

/*\	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
\*/
	if ( 0 == strcmp ( what , "count" ) ) {
		sprintf ( txtcpucount , "%d" , cpucount ) ;
		return txtcpucount ;
	} else if ( 0 == strcmp ( what , "clock" ) ) {
		sprintf ( txtcpuclock , "%lld" , cpuclock ) ;
		return txtcpuclock ;
	} else if ( 0 == strcmp ( what , "model" ) ) {
		strcpy ( txtcpumodel , cpumodel ) ;
		return txtcpumodel ;
	} else if ( 0 == strcmp ( what , "brand" ) ) {
		strcpy ( txtcpubrand , cpufam ) ;
		return txtcpubrand ;
	} else {
		return cpunotfound ;
	}

} /* getcpuinf() */

/*\___________________________________________________________________________
\*/

long long getcpufhz () {
	char * tp ;
	tp = getcpuinf ("clock") ;
	if ( tp == NULL ) {
		return -1L ;
	} else {
		return cpuclock ;
	}
}

/*\___________________________________________________________________________
\*/

int isbigend () {
	int no = 1;
	char *chk = (char *)&no;

	if (chk[0] == 1)
		return 0;
	else
		return 1;
}

int islilend () {
	return ! isbigend () ;
}

/*\___________________________________________________________________________
\*/

char * zest () {
	static char zestbuff [512] ;
	static char tempbuff  [32] ;
	zestbuff[0] = '\0' ;
	sprintf ( tempbuff, "%s ", getosname ( ) ) ;
	strcat  ( zestbuff, tempbuff ) ;
	sprintf ( tempbuff, "%s ", getosvers ( ) ) ;
	strcat  ( zestbuff, tempbuff ) ;
#ifdef LINUX
	sprintf ( tempbuff, "%s ", getdistro () ) ;
	strcat  ( zestbuff, tempbuff ) ;
#endif
	sprintf ( tempbuff, "%s-", CPUMODEL /* getcpuinf ("brand") */ ) ;
	strcat  ( zestbuff, tempbuff ) ;
	sprintf ( tempbuff, "%s ", getcpuinf ("model") ) ;
	strcat  ( zestbuff, tempbuff ) ;
	sprintf ( tempbuff, "%s x ", getcpuinf ("count") ) ;
	strcat  ( zestbuff, tempbuff ) ;
	sprintf ( tempbuff, "%s Hz ", getcpuinf ("clock") ) ;
	strcat  ( zestbuff, tempbuff ) ;
	sprintf ( tempbuff, "%lld Bytes ", getsysram () ) ;
	strcat  ( zestbuff, tempbuff ) ;
	return zestbuff ;
}

/*\___________________________________________________________________________
\*/

# ifdef TESTIT

main () {
	printf ("zest ") ;
	printf ( "%s ", getosname () ) ;
	printf ( "%s ", getosvers () ) ;
#ifdef LINUX
	printf ( "%s ", getdistro () ) ;
#endif
	printf ( "ram=%lld ", getsysram () ) ;
	printf ( "brand=%s ", getcpuinf ("brand") ) ;
	printf ( "model=%s ", getcpuinf ("model") ) ;
	printf ( "count=%s ", getcpuinf ("count") ) ;
	printf ( "clock=%s ", getcpuinf ("clock") ) ;
	printf ( "%s", "\n" ) ;
}

# endif /* TESTIT */

/*		 _______________________________________________________________
 *		|																|
 *		|  date....   version   history ..............................	|
 *		|			 		   											|
 *		|  yy mm dd   v.v rls   ......................................	|
 *		|_______________________________________________________________|
 *		|																|
 *		|  + ...														|
 *		|_______________________________________________________________|
 */

/*
 * vi:nu tabstop=4
 */
