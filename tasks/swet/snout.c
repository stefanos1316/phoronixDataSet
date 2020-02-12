
# include "snout.h"

static int	ansiflag = 0 ;
static int	borderflag = 0 ;
static int	csvflag = 0 ;
static int	flushflag = 0 ;
static int	frameflag = 0 ;
static int	freeflag = 1 ;
static int	htmlflag = 0 ;

char	csvsep = ',' ;

char	sno_vertbar = '|' ;
char	sno_horzbar = '-' ;
char	sno_plusign = '+' ;
char	sno_upprtee = 'v' ;
char	sno_lowrtee = '^' ;
char	sno_lefttee = '>' ;
char	sno_rightee = '<' ;
char	sno_upprleft = '/' ;
char	sno_uppright = '\\' ;
char	sno_lowrleft = '\\' ;
char	sno_lowright = '/' ;

char *	sno_smacs = "\033(0" ;
char *	sno_rmacs = "\033(B" ;

/*	__	__	__	__	__	__	__	__	__
*/

void sno_setsep (sep) int sep ; {
	csvsep = sep ;
}

/*	__	__	__	__	__	__	__	__	__
*/

void sno_setflag (flag) int flag ; {
	if ( flag & SNO_ANSI )
		++ansiflag ;
	if ( flag & SNO_BORDER )
		++borderflag ;
	if ( flag & SNO_CSV )
		++csvflag ;
	if ( flag & SNO_FRAME )
		++frameflag ;
	if ( flag & SNO_HTML )
		++htmlflag ;
	if ( flag & SNO_FLUSH )
		++flushflag ;
}

/*	__	__	__	__	__	__	__	__	__
*/

void sno_clrflag (flag) int flag ; {
	if ( flag & SNO_FREE )
		freeflag = 0 ;
}

/*	__	__	__	__	__	__	__	__	__
*/

int sno_qryflag (flag) int flag ; {
	int result = 0x00 ;
	if ( flag & SNO_ANSI )
		result |= ( ansiflag ? SNO_ANSI : 0x00 ) ;
	if ( flag & SNO_BORDER )
		result |= ( borderflag ? SNO_BORDER : 0x00 ) ;
	if ( flag & SNO_CSV )
		result |= ( csvflag ? SNO_CSV : 0x00 ) ;
	if ( flag & SNO_FRAME )
		result |= ( frameflag ? SNO_FRAME : 0x00 ) ;
	if ( flag & SNO_HTML )
		result |= ( htmlflag ? SNO_HTML : 0x00 ) ;
	if ( flag & SNO_FLUSH )
		result |= ( flushflag ? SNO_FLUSH : 0x00 ) ;
	return result ;
}

/*	__	__	__	__	__	__	__	__	__
*/

FILE * sno_init (ofp) FILE * ofp ; {
	if ( ofp == NULL ) {
		ofp = stdout ;
	}

	if ( ansiflag ) {
		sno_vertbar = 'x' ;
		sno_horzbar = 'q' ; /* ?r? */
		sno_plusign = 'n' ;
		sno_upprtee = 'w' ;
		sno_lowrtee = 'v' ;
		sno_lefttee = 't' ;
		sno_rightee = 'u' ;
		sno_upprleft = 'l' ;
		sno_uppright = 'k' ;
		sno_lowrleft = 'm' ;
		sno_lowright = 'j' ;
		++frameflag ;
	}

	if ( borderflag ) {
		++htmlflag ;
	}

	if ( frameflag ) {
		csvflag = htmlflag = 0 ;
	}

	if ( csvflag ) {
		frameflag = htmlflag = 0 ;
	}

	if ( htmlflag ) {
		csvflag = frameflag = 0 ;
	}

	return ofp ;
}

/*	__	__	__	__	__	__	__	__	__
*/

void dodraw (ofp, chr) FILE * ofp ; int chr ; {
	if (ansiflag)
		fprintf (ofp, "%s%c%s", sno_smacs, chr, sno_rmacs) ;
	else
		fprintf (ofp, "%c", chr) ;
}

/*	__	__	__	__	__	__	__	__	__
*/

# define	MAXTHR		8192	/* SYNC w/ MAXTHREAD */

struct mtsol {
	int		mts_atsol ;
	FILE *	mts_filep ;
} ;

typedef		struct mtsol	MTSOL ;

int * thisol ( fp , sa , kp ) FILE * fp ; MTSOL * sa ; int * kp ; {
	int i ;
	int found ;

	if ( *kp == 0 ) {
		sa[*kp].mts_filep = fp ;
		*kp = 1 ;
		return &sa[0].mts_atsol ;
	} else {
		found = 0 ;
		for ( i = 0 ; i < *kp ; ++i ) {
			if ( sa[i].mts_filep == fp ) {
				found = 1 ; break ;
			}
		}
		if ( ! found ) {
			sa[*kp].mts_filep = fp ; *kp += 1 ;
		}
		return &sa[i].mts_atsol ;
	}
}

/*	__	__	__	__	__	__	__	__	__
*/

char *			sno_unit = "units" ;
int				sno_bigwid = 15 ;
int				sno_gigaflag = 0 ;

MTSOL			showsol [ MAXTHR ] ;
int				showsok = 0 ;

void showinfo (ofp, ptr, wid, flg) FILE * ofp ; char * ptr ; int wid , flg ; {

			char *			tdalig = "right" ;
			int				tmpint ;
/*			double			tmpdbl ;			*/
			long long		tmpbig ;
	static	char			tmptxt [32] ;
			char			fmt [16] ;
			int *			atsol ;
			int				gigaflag = sno_gigaflag ;
			int				bigwid = sno_bigwid ;

	atsol = thisol (ofp, showsol, &showsok) ;

	if ( atsol == NULL ) {
		fprintf (stderr, "%s: internal error (show NULL)\n", "snout") ;
	}

	if ( csvflag ) {
		wid = 0 ;
	}

	if ( wid ) {
		if ( flg & SNO_STR ) {
			sprintf (fmt, "%%%d.%d", wid, wid < 0 ? -wid : wid) ;
		} else {
			sprintf (fmt, "%%%d", wid) ;
		}
	} else {
		sprintf (fmt, "%c", '%') ;
	}

	if ( wid < 0 ) {
		tdalig = "left" ;
	}

	if ( flg & SNO_SOL ) {
		*atsol = 1 ;
		if ( htmlflag ) {
			if ( flg & SNO_HEAD ) {
				fprintf (ofp, "    <thead>\n") ;
				fprintf (ofp, "     <tr align=center>\n") ;
			}
			if ( flg & SNO_BODY ) {
				fprintf (ofp, "    <tbody>\n") ;
				fprintf (ofp, "     <tr align=left>\n") ;
			}
			if ( flg & SNO_FOOT ) {
				fprintf (ofp, "    <tfoot>\n") ;
				fprintf (ofp, "     <tr align=center>\n") ;
			}
		}
		if ( frameflag ) {
			dodraw (ofp, sno_vertbar) ;
			fprintf (ofp, "%c", ' ') ;
		}
		return ;
	}

	if ( flg & SNO_EOL ) {
		if ( htmlflag ) {
			if ( flg & SNO_HEAD ) {
				fprintf (ofp, "     </tr>\n") ;
				fprintf (ofp, "    </thead>\n") ;
			}
			if ( flg & SNO_BODY ) {
				fprintf (ofp, "     </tr>\n") ;
				fprintf (ofp, "    </tbody>\n") ;
			}
			if ( flg & SNO_FOOT ) {
				fprintf (ofp, "     </tr>\n") ;
				fprintf (ofp, "    </tfoot>\n") ;
			}
		}
		if ( frameflag ) {
			fprintf (ofp, "%c", ' ') ;
			dodraw (ofp, sno_vertbar) ;
		}
		if ( ! htmlflag ) {
			fprintf (ofp, "\n") ;
		}
		return ;
	}

	if ( ! *atsol ) {
		if ( csvflag ) {
			fprintf (ofp, "%c", csvsep) ;
		} else {
			if ( frameflag ) {
				fprintf (ofp, "%c", ' ') ;
				dodraw (ofp, sno_vertbar) ;
				fprintf (ofp, "%c", ' ') ;
			} else {
				if ( ! htmlflag ) {
					fprintf (ofp, "%c", ' ') ;
				}
			}
		}
	}

	if ( flg & SNO_UNT ) {
		if ( gigaflag && bigwid < 9 ) {
			sno_unit = "G" ;
		}
		sprintf (tmptxt, "%s %s", ptr, sno_unit) ;
		ptr = tmptxt ;
	}

	if ( htmlflag ) {
		fprintf (ofp, "      <td align=%s>\t", tdalig) ;
	}

	if ( flg & SNO_STR ) {
		strcat (fmt, "s") ;
		fprintf (ofp, fmt, ptr) ;
	}

	if ( flg & SNO_INT ) {
		tmpint = *(int*)ptr ;
		strcat (fmt, "d") ;
		fprintf (ofp, fmt, tmpint) ;
	}

	if ( flg & SNO_BIG ) {
		tmpbig = *(long long *)ptr ;
		strcat (fmt, "lld") ;
		fprintf (ofp, fmt, tmpbig) ;
	}

	if ( flg & SNO_PCT ) {
		fprintf (ofp, "%c", '%') ;
	}

	if ( htmlflag ) {
		fprintf (ofp, "\t</td>\n") ;
	}

	if ( flushflag ) {
		fflush (ofp) ;
	}

	if ( *atsol ) {
		*atsol = 0 ;
	}
}

/*	__	__	__	__	__	__	__	__	__
*/

char	dashwest, dashplus, dasheast ;

MTSOL			dashsol [ MAXTHR ] ;
int				dashsok = 0 ;

void dodash (ofp, wid, flg) FILE * ofp ; int wid, flg ; {
			int		i ;
			int *	atsol ;

	atsol = thisol (ofp, dashsol, &dashsok) ;

	if ( atsol == NULL ) {
		fprintf (stderr, "%s: internal error (dash NULL)\n", "snout") ;
	}

	if ( flg & SNO_SOL ) {
		*atsol = 1 ;
		return ;
	}
	if ( *atsol ) {
		*atsol = 0 ;
	} else {
		if ( ! ( flg & SNO_EOL ) ) {
			dodraw (ofp, dashplus) ;
		}
	}
	for ( i = 2+wid ; i ; --i )
		dodraw (ofp, sno_horzbar) ;
}

void dashesprep (flg) int flg ; {
	if ( flg & SNO_HEAD ) {
		dashwest = sno_upprleft ;
		dashplus = sno_upprtee ;
		dasheast = sno_uppright ;
	}

	if ( flg & SNO_PLUS ) {
		dashwest = sno_lefttee ;
		dashplus = sno_plusign ;
		dasheast = sno_rightee ;
	}

	if ( flg & SNO_TAIL ) {
		dashwest = sno_lowrleft ;
		dashplus = sno_lowrtee ;
		dasheast = sno_lowright ;
	}
}

void dashestart (ofp, flg) FILE * ofp ; int flg ; {
	if ( ! frameflag )
		return ;

	dashesprep (flg) ;
	dodash (ofp, 0, SNO_SOL) ;
	dodraw (ofp, dashwest) ;
}

void dashesterm (ofp, flg) FILE * ofp ; int flg ; {
	if ( ! frameflag )
		return ;

	dashesprep (flg) ;
	dodraw (ofp, dasheast) ;
	fprintf (ofp, "%c", '\n') ;
	if ( flushflag ) {
		fflush (ofp) ;
	}
}

/*	__	__	__	__	__	__	__	__	__
*/

void htmlhead (ofp, swname, swvers, swtags) FILE * ofp ; char * swname, * swvers, * swtags ; {

	char * monofont ;
	char * flexfont ;

	if ( freeflag ) {
		monofont = "Anonymous Pro" ;
		flexfont = "Ubuntu" ;
	} else {
		monofont = "Courier" ;
		flexfont = "Arial" ;
	}

	fprintf (ofp, "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n") ;
	fprintf (ofp, "<html>\n") ;
	fprintf (ofp, " <head>\n") ;
	fprintf (ofp, "  <meta name=\"author\" content=\"Alexandre Botao, botao.org, alexandre@botao.org, botao@linux.sh, botao@unix.net\">\n") ;
	fprintf (ofp, "  <meta name=\"description\" content=\"%s\">\n", swname) ;
	fprintf (ofp, "  <meta name=\"keywords\" content=\"%s,%s\">\n", swname, swtags) ;
	fprintf (ofp, "  <title> %s %s </title>\n", swname, swvers) ;
	if ( freeflag ) {
		fprintf (ofp, "  <link rel=\"stylesheet\" type=\"text/css\" href=\"http://fonts.googleapis.com/css?family=Ubuntu|Droid+Sans|Anonymous+Pro\">\n") ;
	}
	fprintf (ofp, "  <style type=\"text/css\">\n") ;

	fprintf (ofp, "   body { font-family : '%s' , serif ; }\n", flexfont) ;
	fprintf (ofp, "   H1 { color : \"#0000AB\" }\n") ;
	fprintf (ofp, "   H2 { color : \"#00AB00\" }\n") ;
	fprintf (ofp, "   H3 { color : \"#AB0000\" }\n") ;
	fprintf (ofp, "   IMG { border-style : none ; }\n") ;
	fprintf (ofp, "   A:link , A:hover , A:visited { text-decoration : none }\n") ;
	fprintf (ofp, "   A:link { color : \"#00AB00\" }\n") ;
	fprintf (ofp, "   A:visited { color : \"#0000AB\" }\n") ;
	fprintf (ofp, "   A:hover { color : \"#AB0000\" }\n") ;

	fprintf (ofp, "   p {color:cyan;font-family:%s;}\n", monofont) ;
	fprintf (ofp, "   thead {color:blue;font-family:%s;font-style:normal;font-weight:bold;}\n", monofont) ;
	fprintf (ofp, "   tbody {color:black;font-family:%s;}\n", monofont) ;
	fprintf (ofp, "   tfoot {color:black;font-family:%s;font-weight:bold;}\n", monofont) ;
	fprintf (ofp, "   td {padding:3px 5px;}\n") ;
	fprintf (ofp, "   caption {font-family:%s;color:darkblue}\n", flexfont) ;

	fprintf (ofp, "  </style>\n") ;
}

/*	__	__	__	__	__	__	__	__	__
*/

void htmlbody (ofp, identflag, banner) FILE * ofp ; int identflag ; char * banner ; {
	int bordersiz = 0 ;
	char hident [128] ;

	if ( borderflag )
		bordersiz = 4 ;
	fprintf (ofp, " </head>\n") ;
	fprintf (ofp, " <body>\n") ;
	fprintf (ofp, "   <p> %s </p>\n", banner) ;
	fprintf (ofp, "   <table border=%d>\n", bordersiz) ;
	if ( identflag ) {
		gethostname (hident, 128) ;
		fprintf (ofp, "    <caption> %s </caption>\n", hident) ;
	}
}

/*	__	__	__	__	__	__	__	__	__
*/

void htmltail (ofp, trailine) FILE * ofp ; char * trailine ; {
	fprintf (ofp, "   </table>\n") ;
	if ( trailine != NULL ) {
		fprintf (ofp, "  <hr>\n") ;
		fprintf (ofp, "   <ul>\n") ;
		fprintf (ofp, "    <li> %s\n", trailine) ;
		fprintf (ofp, "   </ul>\n") ;
		fprintf (ofp, "  <hr>\n") ;
	}
	fprintf (ofp, " </body>\n") ;
	fprintf (ofp, "</html>\n") ;
}

/*	__	__	__	__	__	__	__	__	__
*/

# ifdef  SNODEMO

# include <sys/types.h>
# include <sys/stat.h>

char * swname = "sno" ;

int	hdrflag = 0 ;
int	helpflag = 0 ;

int	nameflag = 0 ;
int	sizflag = 0 ;

int	identflag = 0 ;
char * banner = "snout demo" ;
char * versno = "1.0.46" ;

# define MAXARG 1048576
struct stat stabuf ;
char * arglist [MAXARG] ;
int argk = 0 ;
int maxnamlen = 8 ;
size_t totsiz = 0 ;

int bigwid = 15 ;
int gigaflag = 0 ;

int sno_usage (ofp, swname) FILE * ofp ; char * swname ; {
	fprintf (ofp, " use: %s [-options]\n\n", swname) ;
	fprintf (ofp, " -A : frame output in ANSI line chars (*1)\n" ) ;
	fprintf (ofp, " -b : frame output in HTML format (*1)\n" ) ;
	fprintf (ofp, " -F : frame output in ASCII chars (*2)\n" ) ;
	fprintf (ofp, " -B : output informations in HTML format (*2)\n" ) ;
	fprintf (ofp, " -C : output informations in CSV format (*2)\n" ) ;
	fprintf (ofp, " -? : show usage help\n\n" ) ;
	fprintf (ofp, " (*1) '-A' and '-b' are mutually exclusive\n") ;
	fprintf (ofp, " (*2) '-B' , '-F' and '-C' are mutually exclusive\n") ;
	return 3 ;
}

void CUSTOM_dashes (ofp, flg) FILE * ofp ; int flg ; {

	if ( ! sno_qryflag (SNO_FRAME) )
		return ;

	dashestart (ofp, flg) ;

	/* if ( nameflag ) */
		dodash (ofp, 3, 0) ;

	/* if ( sizflag ) */
		dodash (ofp, 9, 0) ;

	dodash (ofp, maxnamlen, 0) ;

	dashesterm (ofp, flg) ;
}

void CUSTOM_detail (ofp) FILE * ofp ; {

	int i ;
	char * tempname ;
	char * temptype ;
	size_t tempsize ;

	for ( i = 0 ; i < argk ; ++i ) {

		tempname = arglist [i] ;

		if ( stat ( tempname , &stabuf ) != 0 ) {
			temptype = "err" ;
		} else {
			temptype = "any" ;
			if ( S_ISDIR (stabuf.st_mode) )
				temptype = "dir" ;
			if ( S_ISREG (stabuf.st_mode) )
				temptype = "reg" ;
			tempsize = stabuf.st_size ;
		}

		showinfo (ofp, NULL, 0, SNO_SOL | SNO_ITEM) ;

		/* if ( typeflag ) */
			showinfo (ofp, temptype, 3, SNO_STR) ;

		/* if ( sizflag ) */
			showinfo (ofp, (char *) &tempsize, 9, SNO_BIG) ;

		showinfo (ofp, tempname, -maxnamlen, SNO_STR) ;

		showinfo (ofp, NULL, 0, SNO_EOL | SNO_ITEM) ;
	}
}

void CUSTOM_showhdr (ofp) FILE * ofp ; {

	showinfo (ofp, NULL, 0, SNO_SOL | SNO_HEAD) ;
	/* if ( nameflag ) */
		showinfo (ofp, "typ", 3, SNO_STR /* | SNO_HEAD */) ;
	/* if ( sizflag ) */
		showinfo (ofp, "size", 9, SNO_STR | SNO_UNT /* | SNO_HEAD */) ;
	showinfo (ofp, "name", -maxnamlen, SNO_STR) ;
	showinfo (ofp, NULL, 0, SNO_EOL | SNO_HEAD) ;
	CUSTOM_dashes (ofp, SNO_PLUS) ;
}

int snoutdemo (ofp) FILE * ofp ; {

	/****************************************************
	 *	init ...										*
	 ****************************************************/

	ofp = sno_init (ofp) ;

	/****************************************************
	 *	head ...										*
	 ****************************************************/

	if ( sno_qryflag (SNO_HTML) )
		htmlhead (ofp, swname, versno, "snout,csv,html,frame,output") ;

	/****************************************************
	 *	help ? ...										*
	 ****************************************************/

	if ( helpflag )
		return sno_usage (ofp, swname) ;

	/****************************************************
	 *	body ...										*
	 ****************************************************/

	if ( sno_qryflag (SNO_HTML) )
		htmlbody (ofp, identflag, banner) ;

	/****************************************************
	 *	headers ? ...									*
	 ****************************************************/

	if ( sno_qryflag (SNO_FRAME) )
		CUSTOM_dashes (ofp, SNO_HEAD) ;

	if ( hdrflag )
		CUSTOM_showhdr (ofp) ;

	/****************************************************
	 *	detail line(s) ...								*
	 ****************************************************/

	CUSTOM_detail (ofp) ;

	/****************************************************
	 *	tail ...										*
	 ****************************************************/

	if ( sno_qryflag (SNO_FRAME) )
		CUSTOM_dashes (ofp, SNO_TAIL) ;

	if ( sno_qryflag (SNO_HTML) )
		htmltail (ofp) ;

	/****************************************************
	 *	end ...										*
	 ****************************************************/

	return 0 ;
}

savearg (arg) char * arg ; {
	int len ;
	if (arg != NULL)
		len = strlen (arg) ;
	arglist[argk++] = arg ;
	if ( len > maxnamlen )
		maxnamlen = len ;
}

int main (argc, argv) int argc ; char * * argv ; {

	FILE * outfp = stdout ;

	if (--argc)
		while (*++argv)
			if ( strcmp ( *argv , "-?" ) == 0 )
				++helpflag ;
			else if ( strcmp ( *argv , "-A" ) == 0 )
				sno_setflag (SNO_ANSI) ;
			else if ( strcmp ( *argv , "-b" ) == 0 )
				sno_setflag (SNO_BORDER) ;
			else if ( strcmp ( *argv , "-F" ) == 0 )
				sno_setflag (SNO_FRAME) ;
			else if ( strcmp ( *argv , "-f" ) == 0 )
				sno_clrflag (SNO_FREE) ;
			else if ( strcmp ( *argv , "-B" ) == 0 )
				sno_setflag (SNO_HTML) ;
			else if ( strcmp ( *argv , "-C" ) == 0 )
				sno_setflag (SNO_CSV) ;
			else if ( strcmp ( *argv , "-h" ) == 0 )
				++hdrflag ;
			else if ( strcmp ( *argv , "-n" ) == 0 )
				++nameflag ;
			else if ( strcmp ( *argv , "-z" ) == 0 )
				++sizflag ;
			else
# ifdef ORIG
				fprintf (stderr, "%s: bad arg (%s)\n", swname, *argv) ;
# else
				savearg (*argv) ;
# endif

	/* do the twist */

	return snoutdemo (outfp) ;
}

# endif /* SNODEMO */

/*
 * vi:nu ts=4
 */

