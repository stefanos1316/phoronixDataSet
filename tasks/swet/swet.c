
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

/*                    __________________________________________________
 *                   |                                                  |
 *                   |   swet    sustained workload & efficiency test   |
 *                   |__________________________________________________|
 */

/*______________________________________________________________________
 |                                                                      |
 |  This file is part of 'SWET' (sustained workload & efficiency test)  |
 |  as released by Alexandre Botao <botao.org> ;                        |
 |                                                                      |
 |  'SWET' is Free and Open Source software (FOSS). This means you can  |
 |  redistribute it and/or modify it under the terms of the GNU General |
 |  Public License as published by the Free Software Foundation, either |
 |  version 3 of the License, or (at your option) any later version.    |
 |                                                                      |
 |  'SWET' is distributed in the hope that it will be useful,           |
 |  but WITHOUT ANY WARRANTY; without even the implied warranty of      |
 |  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.                |
 |  See the GNU General Public License for more details.                |
 |                                                                      |
 |  You should have received a copy of the GNU General Public License	|
 |  along with 'SWET'.  If not, see <http://www.gnu.org/licenses/>, or  |
 |  write to the Free Software Foundation, Inc.,                        |
 |  59 Temple Place, Suite 330, Boston, MA  02111-1307  USA.            |
 |______________________________________________________________________|
 */

# define	SWNAME			"swet"
# define	SWVERS			"1.5.16"
# define	SWFORG			"$"						/*	"$" = stable	*/
# define	SWDATE			"2012/04/30"
# define	SWDESC			"sustained workload efficiency test"
# define	SWTAGS			"sustained,workload,efficiency,test,benchmark"
# define	SWCOPY			"GPLv3"
# define	SWAUTH			"alexandre@botao.org"

char	versno [16] ;

char * forgid = SWFORG ;

# include "config.h"
# include "snout.h"
# include "zest.h"

/*________________________________________________________________________
*/
int			sessidflag	= 0 ;
int			procgrpflag	= 0 ;

void		swetwork () ;
/*	__	__	__	__	__	__	__	__	__
*/
/*													 ___________________
 *													|_______daemit______|
 */
# include	<math.h> 
# include	<errno.h>
# include	<stdio.h>
# include	<stdlib.h>
# include	<signal.h>
# include	<string.h>
# include	<unistd.h>

# include	<sys/types.h>
# include	<sys/stat.h>
# include	<sys/resource.h>
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
# define	MAXDAEMON		1024
/* # define	MAXPATHLEN		 512 */

# define	DFLWAITDELAY	   5
# define	DFLMAXTRY		   5

# define	DFLUMASK		( S_IWGRP | S_IWOTH )

# define	DFLWORKDIR		"."
# define	DFLTEMPDIR		"/tmp"
# define	DFLLOGFILE		"/tmp/swet.log"
# define	DFLPIDFILE		"/tmp/swet.pid"
# define	DFLLOKFILE		"/tmp/swet.lock"

# define	DF_EXIT			0x0001
# define	DF_CAFD			0x0002				/* close all fd's		*/
# define	DF_CIOE			0x0004				/* close std(i/o/e)		*/
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
struct daemonctl {
	pid_t		xd_pid		;
	char *		xd_logfile	;
	FILE *		xd_logfp	;
	char *		xd_lockfile	;
	char *		xd_pidfile	;
	char *		xd_workdir	;
	char *		xd_tempdir	;
	long		xd_lres		;
	int			xd_done		;
} ;

typedef		struct daemonctl		DAEMONCTL ;
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
int			waitdelay = DFLWAITDELAY ;
int			maxtry = DFLMAXTRY ;

DAEMONCTL		dmndat [ MAXDAEMON ] ;
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
#ifdef ANSIC
void * dmnfun (void *) ;
#else
void * dmnfun () ;
#endif
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
void * dmnfun (arg) void * arg ; {
	swetwork () ;
	*(long *)arg = 0L ;
	return NULL ;
}
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
int
	daemit ( fun , ctl , flg )
#ifdef ANSIC
		void * (* fun) (void *) ;
#else
		void * (* fun) () ;
#endif
		DAEMONCTL * ctl ;
		int flg ;
{
	pid_t	pid ;
	int i ;

	struct rlimit rlim ;

	if( signal( SIGINT,  SIG_IGN ) != SIG_IGN )
		signal( SIGINT,  SIG_IGN ) ;

	if( signal( SIGKILL, SIG_IGN ) != SIG_IGN )
		signal( SIGKILL, SIG_IGN ) ;

	pid = fork () ;

	if ( pid == (pid_t) -1 )		/* error	*/
		return errno ;

	if ( pid != (pid_t) 0 ) {		/* parent	*/
		ctl->xd_pid = pid ;
		if ( flg & DF_EXIT ) {
			if( signal( SIGINT,  SIG_DFL ) != SIG_DFL )
				signal( SIGINT,  SIG_DFL ) ;
			if( signal( SIGKILL, SIG_DFL ) != SIG_DFL )
				signal( SIGKILL, SIG_DFL ) ;
			exit (0) ;
		} else {
			return 0 ;
		}
	}

	pid = getpid () ;				/* child	*/
	ctl->xd_pid = pid ;

	/* session id & process group leadership */

	if ( sessidflag )
		setsid () ;

	if ( procgrpflag )
# ifdef BSD
		setpgrp (0, 0) ;
# else
		setpgrp () ;
# endif /* BSD */

	/* prepare log file */

	ctl->xd_logfile = malloc ( 128 ) ;
	sprintf ( ctl->xd_logfile, "/tmp/swet%ld.log", (long)pid) ;
	ctl->xd_logfp = fopen (ctl->xd_logfile, "a") ;

	if ( ctl->xd_logfp == NULL ) {
		ctl->xd_logfp = stderr ;
		strcpy ( ctl->xd_logfile, "stderr" ) ;
	}

	/* close file descriptors */

	if ( flg & DF_CAFD ) {
		if ( getrlimit (RLIMIT_NOFILE, &rlim) != 0 )
			return errno ;
		for ( i = 0 ; i < (int)rlim.rlim_cur ; i++ )
			close (i) ;
	} else {
		/* if ( flg & DF_CIOE ) { */
			fclose (stdin) ;
			fclose (stdout) ;
			/* fclose (stderr) ; */
		/* } */
	}

	/* change to root (or "work") directory */

	if ( chdir (DFLWORKDIR) != 0 ) {
		fprintf ( ctl->xd_logfp, "swet(%ld): chdir(%s) error \n", (long)pid, DFLWORKDIR) ;
		/* return errno ; */
	}

#ifdef DAEMASK
	if ( umask (DFLUMASK) != 0 ) { /* protect file access mask */
		fprintf ( ctl->xd_logfp, "swet(%ld): umask(%lo) error \n", (long)pid, (long) DFLUMASK) ;
		/* return errno ; */
	}
#endif

	/* call daemed function */

	(*fun) ( (void *) & (ctl->xd_lres) ) ;

	fprintf ( ctl->xd_logfp, "pid %ld res %ld\n", (long)pid, ctl->xd_lres ) ;

	/* close log file */

	if ( ctl->xd_logfp != stderr )
		fclose ( ctl->xd_logfp ) ;

	/* now what ? */

	exit (0) ; /* reached ? */

	return 0 ;
}
/*	__	__	__	__	__	__	__	__	__
*/
/*													 ___________________
 *													|______s_w_e_t______|
 */
# include <sys/time.h>
# include <sys/wait.h>
# include <string.h>
# include <ctype.h>
# include <time.h>
# include "grand.h"
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
# ifndef	_REENTRANT
# define	_REENTRANT
# endif

#	include	<pthread.h>

pthread_mutex_t		sum_mutex = PTHREAD_MUTEX_INITIALIZER ;
pthread_mutex_t		cnt_mutex = PTHREAD_MUTEX_INITIALIZER ;
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
# define	SWETESET	 "SWETSET"
# define	DEMOTSET	 "121 101 111 232 300 305 315 325 352 452 402 503 702 902 961"

# define	MEGASIZE	 1048576
# define	MIBASIZE	 1000000

# define	LOGNAMSIZ	 4096

# define	FIOBUFSIZ	 MEGASIZE

# define	RANTABSIZ	 MEGASIZE					/*	48576 reserved	*/

# define	MAXROPE			1024
# define	MAXTHREAD		8192
# define	OBSBUFSIZ		8192

# define	DFLPOLLDELAY	   5
# define	DFLCPUHOGPCT	  25
# define	DFLCPUHOGSEC	   5

# define	MINSET	100
# define	MAXSET	999
# define	NUMWID	  3
# define	SETWID	(1+(MAXSET-MINSET))

# define	SWET(X) X,swet##X

# ifdef CLOCK_MONOTONIC
#	define	SYSCLOCK	CLOCK_MONOTONIC
# else
#	ifdef CLOCK_REALTIME
#		define	SYSCLOCK	CLOCK_REALTIME
#	else
#		define	SYSCLOCK	CLOCK_REALTIME
#	endif
# endif

/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/

# define	NEXTBACKADDR(X,T)	( (T-1) - X )
# define	NEXTCONVADDR(X,T)	( (X&1) ? (X/2) : (T-1)-(X/2) )
# define	NEXTGOLDADDR(X,T)	( ( X < T/2 ) ? ( ( T & 1 ) ? ( (X&1) ? (T/2)+X+1 : (T/2)-X ) : ( (X&1) ? (T/2)+X : (T/2)-X-1 ) ) : ( (X&1) ? (T/2)+(T-X)-1 : X-(T/2)-(T&1) ) )
# define	NEXTRANDADDR(X,T)	( /* srand (X) , */ ( rand () % T ) )
# define	NEXTSCATADDR(X,T)	( (T&1) ? ( (X&1) ? (T/2)+(X/2)+1 : (T/2)-(X/2) ) : ( (X&1) ? (T/2)+(X/2) : (T/2)-(X/2)-1 ) )
# define	NEXTSPOTADDR(X,T)	( (X&1) ? ( T&1 ? X : X-1 ) : (T-1)-X )

# define	ISODD(X)	( (X) & 0x1 )

# define	XOR(A,B)	( ( (! (A)) && (B) ) || ( (! (B)) && (A) ) )

/*________________________________________________________________________
*/

# define	MAXRESBYTES			16		/* 64 */
union	swetresult {					/* per test result				*/
	short		sr_short ;
	int			sr_int ;
	long		sr_long ;
	float		sr_float ;
	double		sr_double ;
	long long	sr_longlong ;
# ifdef _HAS_LONGDOUBLE_
	long double	sr_longdouble ;
# endif /* _HAS_LONGDOUBLE_ */
	char		sr_charray [MAXRESBYTES] ;
} ;
typedef		union	swetresult		ETR ;
/*________________________________________________________________________
*/
struct	swetsetinfo {					/* per test set info			*/
	int			rno			;
	int			testcount	;
	long long	sumcount	;
	long long	sumelap		;
	long long	sumfreq		;
	double		sumbigscore	;
	double		sumcomscore	;
	double		sumrelscore	;
	long long	avgcount	;
	long long	avgelap		;
	long long	avgfreq		;
	double		avgbigscore	;			/* raw/big/absolute  efficiency	*/
	double		avgcomscore	;			/* combined / gross  efficiency	*/
	double		avgrelscore	;			/* relative/specific efficiency	*/
} ;

typedef		struct	swetsetinfo		TSI ;
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
struct	swetestinfo {					/* per test/thread info			*/
	int				et_rep ;			/* repeat counter				*/
	int				et_ind ;			/* index id						*/
	int				et_flg ;			/* control flags				*/
	int				et_err ;			/* errno						*/
	int				et_tno ;			/* test/thread #				*/
	int				et_dno ;			/* daemon #						*/
	int				et_nut ;			/* random # seed				*/
	int				et_tou ;			/* timed out ?					*/
	pid_t			et_pid ;			/* process id					*/
	pthread_t		et_tid ;			/* thread id					*/
	long long		et_cnt ;			/* test counter					*/
	FILE *			et_lfp ;			/* log file						*/
	TSI *			et_tsi ;			/* test set info				*/
	ETR				et_res ;			/* test result(s)				*/
	struct timespec	et_tsa ;			/* start ns timer				*/
	struct timespec	et_tsb ;			/* stop  ns timer				*/
	struct timeval	et_tva ;			/* start us timer				*/
	struct timeval	et_tvb ;			/* stop  us timer				*/
	struct timezone	et_tzc ;			/* gtod() tz					*/
	char			et_buf [256] ;		/* log line						*/
} ;

typedef		struct	swetestinfo		ETI ;

# define	ETISIZ		(sizeof(ETI))

# define	XF_DONE		0x00000001
# define	XF_LIVE		0x00000002
# define	XF_FAIL		0x00001000
/*________________________________________________________________________
*/
int			idflag		= 0 ;	/* show test id							*/
int			descflag	= 0 ;	/* show test description				*/
int			elapsedflag	= 0 ;	/* show elapsed time					*/
int			freqflag	= 0 ;	/* show operations/second				*/
int			numberflag	= 0 ;	/* show test/thread number				*/
int			rawflag		= 0 ;	/* absolute(raw) efficiency				*/
int			relflag		= 0 ;	/* specific(relative) efficiency		*/
int			comflag		= 0 ;	/* gross(combined) efficiency			*/

int			alarmflag	= 0 ;	/* timeout alarm						*/
int			averageflag	= 0 ;	/* report averages						*/
int			basicflag	= 0 ;	/* basic fast comprehensive test		*/
int			betaflag	= 0 ;	/* experimental stuff					*/
int			daemonflag	= 0 ;	/* spawn N test sets as daemons			*/
int			dashflag	= 0 ;	/* good'ol'dashes						*/
int			defaultflag	= 0 ;	/* show short detail					*/
int			demoflag	= 0 ;	/* quick check							*/
int			fastflag	= 0 ;	/* faster array initialization			*/
int			flushflag	= 0 ;	/* flushable stream						*/
int			fullflag	= 0 ;	/* show full detail						*/
int			headerflag	= 0 ;
int			helpflag	= 0 ;
int			inspectflag	= 0 ;	/* inspect/discover host info			*/
int			joinflag	= 0 ;	/* join threads for completion			*/
int			logflag		= 0 ;
int			masterflag	= 0 ;	/* father to all daemons				*/
int			minutflag	= 0 ;	/* description minutiae					*/
int			nanoflag	= 0 ;
int			obsflag		= 0 ;	/* one-liner obs. comment				*/
int			percentflag	= 0 ;
int			pollflag	= 0 ;	/* wait/poll threads for completion		*/
int			quickflag	= 0 ;	/* just the faster tests				*/
int			repeatflag	= 0 ;	/* repeat each test N times				*/
int			reportflag	= 0 ;
int			ropeflag	= 0 ;	/* thread each test set					*/
int			secondflag	= 0 ;
int			setflag		= 0 ;
int			slowflag	= 0 ;	/* just the slower tests				*/
int			threadflag	= 0 ;
int			totalflag	= 0 ;	/* report totals						*/
int			verboseflag	= 0 ;
int			versionflag	= 0 ;
int			waitflag	= 0 ;
int			wholeflag	= 0 ;	/* the whole burrito !					*/
int			yarnflag	= 0 ;	/* thread each test						*/

/* snout ... */
int			snoutflag	= 0 ;	/* csv|html|framed output				*/
int			gigaflag	= 0 ;
int			bigwid		= 15 ;
/* snout ... */

int			argpercent	= 0 ;
int			argseconds	= 0 ;
int			alarmsecs	= 0 ;
int			timedout	= 0 ;
int			cpuhogpct		= DFLCPUHOGPCT ;
int			maxcpuhogsec	= DFLCPUHOGSEC ;
int			maxdaemon	= 0 ;	/* number of daemons to spawn			*/
int			maxrepeat	= 1 ;	/* repeat each test N times				*/
int			maxthread	= 0 ;	/* number of threads to spawn			*/
int			polldelay	= DFLPOLLDELAY ;
int			setlength	= 0 ;

int			swetset	[MAXSET] ;

long		testmask	= 0x00 ;

long long	sysclock	= 0 ;
long long	bigclock	= 100000000000LL ;	/*	100 GHz		*/

char		bigbuf   [8192] ;

char		obsbuf   [OBSBUFSIZ] ;

char		logfilnambuf   [LOGNAMSIZ] ;

char		filenamebuff [128] ;

char *		progname    = SWNAME ;
char *		tempset     = NULL ;
char *		demoset     = NULL ;

TSI			swepitom ;

TSI			tsitab [MAXROPE] ;

ETI *		etitab [MAXTHREAD] ;

FILE *		logfp ;

float		frandtab [RANTABSIZ] ;		/*	random (0..1)	*/
float		frangtab [RANTABSIZ] ;		/*	random angles	*/
float		franbtab [RANTABSIZ] ;		/*	random Xe+-Y	*/

double		drandtab [RANTABSIZ] ;		/*	random (0..1)	*/
double		drangtab [RANTABSIZ] ;		/*	random angles	*/
double		dranbtab [RANTABSIZ] ;		/*	random Xe+-Y	*/

# ifdef _HAS_LONGDOUBLE_
long double	ldrandtab [RANTABSIZ] ;		/*	random (0..1)	*/
long double	ldrangtab [RANTABSIZ] ;		/*	random angles	*/
long double	ldranbtab [RANTABSIZ] ;		/*	random Xe+-Y	*/
# endif /* _HAS_LONGDOUBLE_ */
/*________________________________________________________________________
*/
long long difelaps (etip) ETI * etip ; {
	struct timeval * tvp1, * tvp2 ;
    struct timeval tv3 ;
	struct timespec * tsp1, * tsp2 ;
    struct timespec ts3 ;

	if ( nanoflag ) {
		tsp1 = &etip->et_tsa ;
		tsp2 = &etip->et_tsb ;
    	ts3.tv_sec = tsp2->tv_sec - tsp1->tv_sec ;
    	ts3.tv_nsec = tsp2->tv_nsec - tsp1->tv_nsec ;
    	if (ts3.tv_nsec < 0) {
        	--ts3.tv_sec ;
        	ts3.tv_nsec += 1000000000LL ;
    	}   
    	return (long long) ( ( 1000000000LL * ts3.tv_sec ) + ts3.tv_nsec ) ;
	} else {
		tvp1 = &etip->et_tva ;
		tvp2 = &etip->et_tvb ;
    	tv3.tv_sec = tvp2->tv_sec - tvp1->tv_sec ;
    	tv3.tv_usec = tvp2->tv_usec - tvp1->tv_usec ;
    	if (tv3.tv_usec < 0) {
        	--tv3.tv_sec ;
        	tv3.tv_usec += 1000000 ;
    	}   
    	return (long long) ( ( 1000000 * tv3.tv_sec ) + tv3.tv_usec ) ;
	}
}

char * fmtelaps (t) long long t ; { 
    long long n, u, s, m, h ; 
    static char b [32] ;

    if ( nanoflag ) {
		n = t % 1000000000LL ;
    	s = t / 1000000000LL ;
	} else {
		u = t % 1000000LL ;
    	s = t / 1000000LL ;
	}
    m = s / 60LL ;
    h = m / 60LL ;
    s %= 60LL ;
    m %= 60LL ;
    if ( nanoflag ) {
    	sprintf (b, "%02lld:%02lld:%02lld.%09lld", h, m, s, n) ;
	} else {
    	sprintf (b, "%02lld:%02lld:%02lld.%06lld", h, m, s, u) ;
	}
    return b ;
}
/*				 _______________________________________________________
 *				|_______mark_gauge_rate_spec_efficiency_perf_notch______|
 */
double swetscore (count, clock) long long count , clock ; {
    return clock == 0 ? 0.0 : ( 100.0 * (double)count ) / (double)clock ;
}

long long swetfreq (delay, count) long long delay , count ; {
    if ( nanoflag ) {
    	return delay == 0 ? 0 : ( 1000000000LL * count ) / delay ;
	} else {
    	return delay == 0 ? 0 : ( 1000000 * count ) / delay ;
	}
}
/*	__	__	__	__	__	__	__	__	__
*/
void flushthis (fp) FILE * fp ; {
	if ( flushflag ) {
		fflush (fp) ;
	}
}
/*	__	__	__	__	__	__	__	__	__
*/
void acctthis (buf, tmp, sep, lfp) char * buf , * tmp ; int sep ; FILE * lfp ; {
	if ( snoutflag ) {
		if ( buf == NULL ) {
			buf = bigbuf ;
		}
		if ( sep == ' ' ) {
			if ( 0 == strcmp ( tmp , "\n" ) ) {
				return ;
			}
			showinfo (lfp, tmp, strlen(tmp)-1, SNO_STR) ;
		}
		if ( sep == '\n' ) {
			showinfo (lfp, NULL, 0, SNO_EOL | SNO_ITEM) ;
		}
	} else {
		if ( sep == ' ' ) {
			strcat (buf, tmp) ;
		}
		if ( sep == '\n' ) {
			fprintf (lfp, "%s", buf) ; flushthis (lfp) ;
		}
	}
}
/*	__	__	__	__	__	__	__	__	__
*/
void * swetacct (etip, count) ETI * etip ; long long count ; {
	long long thisfreq = 0 ;
	long long thiselap = 0 ;
	double bigscore = 0.0 ;
	double comscore = 0.0 ;
	double hogscore = 0.0 ;
	double relscore = 0.0 ;
	char tmpbuf [64] ;
	int bufi = 0 ;

	etip->et_cnt = count ;
	if ( ! threadflag ) {
		bufi = strlen (etip->et_buf) ;
	}
	thiselap = difelaps (etip) ;
	if ( elapsedflag ) {
		sprintf (tmpbuf, "%s ", fmtelaps (thiselap)) ;
		acctthis (etip->et_buf, tmpbuf, ' ', etip->et_lfp) ;
	}
	thisfreq = swetfreq ( thiselap , count ) ;
	if ( freqflag ) {
		sprintf (tmpbuf, "%12lld ", thisfreq) ;
		acctthis (etip->et_buf, tmpbuf, ' ', etip->et_lfp) ;
	}
	bigscore = swetscore (thisfreq, bigclock) ;
	if ( rawflag ) {
		sprintf (tmpbuf, "%7.3f ", bigscore) ;
		acctthis (etip->et_buf, tmpbuf, ' ', etip->et_lfp) ;
	}
	if ( sysclock > 0 ) {
		relscore = swetscore (thisfreq, sysclock) ;
		if ( relflag ) {
			sprintf (tmpbuf, "%7.3f ", relscore) ;
			acctthis (etip->et_buf, tmpbuf, ' ', etip->et_lfp) ;
		}
		comscore = relscore * bigscore ;
		if ( comflag ) {
			sprintf (tmpbuf, "%7.3f ", comscore) ;
			acctthis (etip->et_buf, tmpbuf, ' ', etip->et_lfp) ;
		}
	}
	if ( verboseflag > 2 ) { /* experimental stuff */
		if ( sysclock > 0 ) {
			hogscore = thisfreq ? (double)sysclock / (double)thisfreq : 0.0 ;			/* hog = cycles/op */
			sprintf ( tmpbuf, "%5.1f ", hogscore ) ;
			acctthis (etip->et_buf, tmpbuf, ' ', etip->et_lfp) ;
		}
		if ( nanoflag ) {
			sprintf ( tmpbuf, "%5.1f ", (double)thiselap / (double)count ) ;			/* ??? = ns/op	*/
		} else {
			sprintf ( tmpbuf, "%5.1f ", (1000.0 * (double)thiselap) / (double)count ) ;	/* ditto		*/
		}
		acctthis (etip->et_buf, tmpbuf, ' ', etip->et_lfp) ;
	}
	acctthis (etip->et_buf, "\n", ' ', etip->et_lfp) ;
	if ( threadflag ) {
		pthread_mutex_lock(&sum_mutex);
	}	/*	BEGIN critical section	*/
		acctthis (&etip->et_buf[bufi], NULL/*tmpbuf*/, '\n', etip->et_lfp) ;
		if ( averageflag || totalflag ) {
			etip->et_tsi->sumcount += count ;
			if ( elapsedflag )
				etip->et_tsi->sumelap += thiselap ;
			if ( freqflag )
				etip->et_tsi->sumfreq += thisfreq ;
			if ( rawflag )
				etip->et_tsi->sumbigscore += bigscore ;
			if ( sysclock > 0 ) {
				if ( relflag )
					etip->et_tsi->sumrelscore += relscore ;
				if ( comflag )
					etip->et_tsi->sumcomscore += comscore ;
			}
		}
	if ( threadflag ) {
		pthread_mutex_unlock(&sum_mutex);
	}	/*	E_N_D critical section	*/
	etip->et_flg |= XF_DONE ;
	return (void *) NULL /* etip */ ;
}
/*______________________________________________________________________*/

void swetwake (sig) int sig ; {
	if ( sig != SIGALRM ) {
		fprintf (stderr, "* swet caught signal (%d)\n", sig) ;
		exit (1) ;
	}
	signal (SIGALRM, swetwake) ;
	timedout = 1 ;
}

/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/

void startimer (etip) ETI * etip ; {
	if ( alarmflag ) {
		etip->et_tou = timedout = 0 ;
		if ( threadflag ) {
/*
			void (*_signal_r(void *REENT, int SIG, void(*FUNC)(int))) (int);
*/
			/* timer_create etc ... */
		} else {
			signal (SIGALRM, swetwake) ;
			alarm (alarmsecs) ;
		}
	}
	if ( nanoflag ) {
		clock_gettime (SYSCLOCK, &etip->et_tsa) ;
	} else {
		gettimeofday (&etip->et_tva, &etip->et_tzc) ;
	}
}

void stoptimer (etip) ETI * etip ; {
	if ( nanoflag ) {
		clock_gettime (SYSCLOCK, &etip->et_tsb) ;
	} else {
		gettimeofday (&etip->et_tvb, &etip->et_tzc) ;
	}
	if ( alarmflag ) {
		etip->et_tou = timedout = 0 ;
		if ( threadflag ) {
			/* timer_destroy etc ... */
/*
			void (*_signal_r(void *REENT, int SIG, void(*FUNC)(int))) (int);
*/
		} else {
			alarm (0) ;
			signal (SIGALRM, SIG_DFL) ;
		}
	}
}

/*________________________________________________________________________
*/

# define ROP10(X) X;X;X;X;X;X;X;X;X;X
# define ROP100(X) ROP10(X);ROP10(X);ROP10(X);ROP10(X);ROP10(X);ROP10(X);ROP10(X);ROP10(X);ROP10(X);ROP10(X)
# define ROP1000(X) ROP100(X);ROP100(X);ROP100(X);ROP100(X);ROP100(X);ROP100(X);ROP100(X);ROP100(X);ROP100(X);ROP100(X)

# define	PILD	3.1415926535897932384626433832795029/*L*/
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
									/* "sco_type____siz_test____nops" */

void * swet101 (arg) void * arg ; {	/* "reg int      32 ++loop    1M" */
	ETI * etip = (ETI *) arg ;
	register int ri ;
	startimer (etip) ;
		for ( ri = 0 ; ri < 1000000 ; ++ri ) ;
	stoptimer (etip) ;
	return swetacct (etip, (long long)ri) ;
}

void * swet102 (arg) void * arg ; {	/* "loc  int    32 ++loop     1M" */
	ETI * etip = (ETI *) arg ;
	int li ;
	startimer (etip) ;
		for ( li = 0 ; li < 1000000 ; ++li ) ;
	stoptimer (etip) ;
	return swetacct (etip, (long long)li) ;
}

int	gi ;

void * swet103 (arg) void * arg ; {	/* "ext int    32 ++loop     1M" */
	ETI * etip = (ETI *) arg ;
	startimer (etip) ;
		for ( gi = 0 ; gi < 1000000 ; ++gi ) ;
	stoptimer (etip) ;
	return swetacct (etip, (long long)gi) ;
}

void * swet104 (arg) void * arg ; {	/* "reg  int    32 ++seq    1000" */
	ETI * etip = (ETI *) arg ;
	register int ri = 0 ;
	startimer (etip) ;
		ROP1000(++ri) ;
	stoptimer (etip) ;
	return swetacct (etip, (long long)ri) ;
}

void * swet105 (arg) void * arg ; {	/* "loc  int    32 ++seq    1000" */
	ETI * etip = (ETI *) arg ;
	int li = 0 ;
	startimer (etip) ;
		ROP1000(++li) ;
	stoptimer (etip) ;
	return swetacct (etip, (long long)li) ;
}

void * swet106 (arg) void * arg ; { /* "ext int    32 ++seq    1000" */
	ETI * etip = (ETI *) arg ;
	gi = 0 ;
	startimer (etip) ;
		ROP1000(++gi) ;
	stoptimer (etip) ;
	return swetacct (etip, (long long)gi) ;
}
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
void * swet107 (arg) void * arg ; { /* "reg  int    32 ++loop     1B" */
	ETI * etip = (ETI *) arg ;
	register int ri ;
	startimer (etip) ;
		for ( ri = 0 ; ri < 1000000000 ; ++ri ) ;
	stoptimer (etip) ;
	return swetacct (etip, (long long)ri) ;
}

void * swet108 (arg) void * arg ; { /* "loc  int    32 ++loop     1B" */
	ETI * etip = (ETI *) arg ;
	int li ;
	startimer (etip) ;
		for ( li = 0 ; li < 1000000000 ; ++li ) ;
	stoptimer (etip) ;
	return swetacct (etip, (long long)li) ;
}

void * swet109 (arg) void * arg ; { /* "ext int    32 ++loop     1B" */
	ETI * etip = (ETI *) arg ;
	startimer (etip) ;
		for ( gi = 0 ; gi < 1000000000 ; ++gi ) ;
	stoptimer (etip) ;
	return swetacct (etip, (long long)gi) ;
}

void * swet111 (arg) void * arg ; { /* "reg  int    64 ++loop     1M" */
	ETI * etip = (ETI *) arg ;
	register long long rll ;
	startimer (etip) ;
		for ( rll = 100000000000LL ; rll < 100001000000LL ; ++rll ) ;
	stoptimer (etip) ;
	return swetacct (etip, 1000000LL) ;
}

void * swet112 (arg) void * arg ; { /* "loc  int    64 ++loop     1M" */
	ETI * etip = (ETI *) arg ;
	long long lll ;
	startimer (etip) ;
		for ( lll = 100000000000LL ; lll < 100001000000LL ; ++lll ) ;
	stoptimer (etip) ;
	return swetacct (etip, 1000000LL) ;
}

long long gll ;

void * swet113 (arg) void * arg ; { /* "ext  int    64 ++loop     1M" */
	ETI * etip = (ETI *) arg ;
	startimer (etip) ;
		for ( gll = 100000000000LL ; gll < 100001000000LL ; ++gll ) ;
	stoptimer (etip) ;
	return swetacct (etip, 1000000LL) ;
}

void * swet117 (arg) void * arg ; { /* "reg  int    64 ++loop     1B" */
	ETI * etip = (ETI *) arg ;
	register long long rll ;
	startimer (etip) ;
		for ( rll = 100000000000LL ; rll < 101000000000LL ; ++rll ) ;
	stoptimer (etip) ;
	return swetacct (etip, 1000000000LL) ;
}

void * swet121 (arg) void * arg ; { /* "reg  int    16 ++loop     1M" */
	ETI * etip = (ETI *) arg ;
	register short rsa = 0 , rsb = 0 ;
	startimer (etip) ;
		for ( rsa = 0 ; rsa < 1000 ; ++rsa )
			for ( rsb = 0 ; rsb < 1000 ; ++rsb ) ;
	stoptimer (etip) ;
	return swetacct (etip, (long long)rsa * (long long)rsb) ;
}

void * swet127 (arg) void * arg ; { /* "reg  int    16 ++loop     1B" */
	ETI * etip = (ETI *) arg ;
	register short rsa = 0 , rsb = 0 , rsc = 0 ;
	startimer (etip) ;
		for ( rsa = 0 ; rsa < 1000 ; ++rsa )
			for ( rsb = 0 ; rsb < 1000 ; ++rsb )
				for ( rsc = 0 ; rsc < 1000 ; ++rsc ) ;
	stoptimer (etip) ;
	return swetacct (etip, (long long)rsa * (long long)rsb * (long long)rsc) ;
}

void * swet131 (arg) void * arg ; { /* "reg  int    16 ++loop   100M" */
	ETI * etip = (ETI *) arg ;
	register short rsa = 0 , rsb = 0 ;
	startimer (etip) ;
		for ( rsa = 0 ; rsa < 10000 ; ++rsa )
			for ( rsb = 0 ; rsb < 10000 ; ++rsb ) ;
	stoptimer (etip) ;
	return swetacct (etip, (long long)rsa * (long long)rsb) ;
}
/*	__	__	__	__	__	__	__	__	__
*/
void * swet144 (arg) void * arg ; {	/* "reg  int    64 ++seq    1000" */
	ETI * etip = (ETI *) arg ;
	register long long ri = 0 ;
	startimer (etip) ;
		ROP1000(++ri) ;
	stoptimer (etip) ;
	return swetacct (etip, /*(long long)*/ri) ;
}

void * swet145 (arg) void * arg ; {	/* "loc  int    64 ++seq    1000" */
	ETI * etip = (ETI *) arg ;
	long long ri = 0 ;
	startimer (etip) ;
		ROP1000(++ri) ;
	stoptimer (etip) ;
	return swetacct (etip, /*(long long)*/ri) ;
}

void * swet146 (arg) void * arg ; {	/* "ext  int    64 ++seq    1000" */
	ETI * etip = (ETI *) arg ;
	gll = 0 ;
	startimer (etip) ;
		ROP1000(++gll) ;
	stoptimer (etip) ;
	return swetacct (etip, 1000LL) ;
}
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
void * swet202 (arg) void * arg ; {	/* "loc  float   32 ++loop     1M" */
	ETI * etip = (ETI *) arg ;
	float fi ;
	startimer (etip) ;
		for ( fi = (float)0.0 ; fi < (float)1000000.0 ; fi += (float)1.0 ) ;
	stoptimer (etip) ;
	return swetacct (etip, (long long)1000000) ;
}

void * swet204 (arg) void * arg ; {	/* "loc  float   32 ++loop     10M" */
	ETI * etip = (ETI *) arg ;
	float fi ;
	startimer (etip) ;
		for ( fi = (float)0.0 ; fi < (float)10000000.0 ; fi += (float)1.0 ) ;
	stoptimer (etip) ;
	return swetacct (etip, (long long)10000000) ;
}

void * swet206 (arg) void * arg ; {	/* "loc  float   32 ++loop     100M" */
	ETI * etip = (ETI *) arg ;
	float fi , fj ;
	startimer (etip) ;
		for ( fi = (float)0.0 ; fi < (float)10000.0 ; fi += (float)1.0 )
			for ( fj = (float)0.0 ; fj < (float)10000.0 ; fj += (float)1.0 ) ;
	stoptimer (etip) ;
	return swetacct (etip, (long long)100000000) ;
}

void * swet208 (arg) void * arg ; {	/* "loc  float   32 ++loop     1B" */
	ETI * etip = (ETI *) arg ;
	float fi , fj ;
	startimer (etip) ;
		for ( fi = (float)0.0 ; fi < (float)1000.0 ; fi += (float)1.0 )
			for ( fj = (float)0.0 ; fj < (float)1000000.0 ; fj += (float)1.0 ) ;
	stoptimer (etip) ;
	return swetacct (etip, (long long)1000000000) ;
}
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
void * swet212 (arg) void * arg ; {	/* "loc  double   64 ++loop     1M" */
	ETI * etip = (ETI *) arg ;
	double fi ;
	startimer (etip) ;
		for ( fi = (double)0.0 ; fi < (double)1000000.0 ; fi += (double)1.0 ) ;
	stoptimer (etip) ;
	return swetacct (etip, (long long)1000000) ;
}

void * swet214 (arg) void * arg ; {	/* "loc  double   64 ++loop    10M" */
	ETI * etip = (ETI *) arg ;
	double fi ;
	startimer (etip) ;
		for ( fi = (double)0.0 ; fi < (double)10000000.0 ; fi += (double)1.0 ) ;
	stoptimer (etip) ;
	return swetacct (etip, (long long)10000000) ;
}

void * swet216 (arg) void * arg ; {	/* "loc  double   64 ++loop   100M" */
	ETI * etip = (ETI *) arg ;
	double fi ;
	startimer (etip) ;
		for ( fi = (double)0.0 ; fi < (double)100000000.0 ; fi += (double)1.0 ) ;
	stoptimer (etip) ;
	return swetacct (etip, (long long)100000000) ;
}

void * swet218 (arg) void * arg ; {	/* "loc  double   64 ++loop     1B" */
	ETI * etip = (ETI *) arg ;
	double fi ;
	startimer (etip) ;
		for ( fi = (double)0.0 ; fi < (double)1000000000.0 ; fi += (double)1.0 ) ;
	stoptimer (etip) ;
	return swetacct (etip, (long long)1000000000) ;
}
/*	__	__	__	__	__	__	__	__	__
*/
# ifdef _HAS_LONGDOUBLE_
void * swet232 (arg) void * arg ; {	/* "loc  double   128 ++loop     1M" */
	ETI * etip = (ETI *) arg ;
	long double fi ;
	startimer (etip) ;
		for ( fi = (long double)0.0 ; fi < (long double)1000000.0 ; fi += (long double)1.0 ) ;
	stoptimer (etip) ;
	return swetacct (etip, (long long)1000000) ;
}

void * swet234 (arg) void * arg ; {	/* "loc  double   128 ++loop    10M" */
	ETI * etip = (ETI *) arg ;
	long double fi ;
	startimer (etip) ;
		for ( fi = (long double)0.0 ; fi < (long double)10000000.0 ; fi += (long double)1.0 ) ;
	stoptimer (etip) ;
	return swetacct (etip, (long long)10000000) ;
}

void * swet236 (arg) void * arg ; {	/* "loc  double   128 ++loop   100M" */
	ETI * etip = (ETI *) arg ;
	long double fi ;
	startimer (etip) ;
		for ( fi = (long double)0.0 ; fi < (long double)100000000.0 ; fi += (long double)1.0 ) ;
	stoptimer (etip) ;
	return swetacct (etip, (long long)100000000) ;
}

void * swet238 (arg) void * arg ; {	/* "loc  double   128 ++loop     1B" */
	ETI * etip = (ETI *) arg ;
	long double fi ;
	startimer (etip) ;
		for ( fi = (long double)0.0 ; fi < (long double)1000000000.0 ; fi += (long double)1.0 ) ;
	stoptimer (etip) ;
	return swetacct (etip, (long long)1000000000) ;
}
# endif /* _HAS_LONGDOUBLE_ */

/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/

unsigned char gbam [MEGASIZE] ;

void * swet300 (arg) void * arg ; {	/* "ext byte    8 fill[]   1M" */
	ETI * etip = (ETI *) arg ;
	register int ri ;
	startimer (etip) ;
		for ( ri = 0 ; ri < 1000000 ; ++ri ) {
			gbam [ri] = 0xff ;
		}
	stoptimer (etip) ;
	return swetacct (etip, (long long)ri) ;
}

/*	__	__	__	__	__	__	__	__	__
*/

short gsam [MEGASIZE] ;

void * swet301 (arg) void * arg ; {	/* "ext word   16 fill[]   1M" */
	ETI * etip = (ETI *) arg ;
	register int ri ;
	startimer (etip) ;
		for ( ri = 0 ; ri < 1000000 ; ++ri ) {
			gsam [ri] = 0x7fff ;
		}
	stoptimer (etip) ;
	return swetacct (etip, (long long)ri) ;
}

/*	__	__	__	__	__	__	__	__	__
*/

int giam [MEGASIZE] ;

void * swet302 (arg) void * arg ; {	/* "ext int      32 fill[]   1M" */
	ETI * etip = (ETI *) arg ;
	register int ri ;
	startimer (etip) ;
		for ( ri = 0 ; ri < 1000000 ; ++ri ) {
			giam [ri] = ri ;
		}
	stoptimer (etip) ;
	return swetacct (etip, (long long)ri) ;
}

/*	__	__	__	__	__	__	__	__	__
*/

long long gllam [MEGASIZE] ;

void * swet303 (arg) void * arg ; {	/* "ext int      64 fill[]   1M" */
	ETI * etip = (ETI *) arg ;
	register long long ri ;
	startimer (etip) ;
		for ( ri = 0 ; ri < 1000000LL ; ++ri ) {
			gllam [ri] = ri ;
		}
	stoptimer (etip) ;
	return swetacct (etip, /*(long long)*/ri) ;
}

/*	__	__	__	__	__	__	__	__	__
*/

double gdam [MEGASIZE] ;

void * swet304 (arg) void * arg ; {	/* "ext double   64 fill[]   1M" */
	ETI * etip = (ETI *) arg ;
	register int ri ;
	startimer (etip) ;
		for ( ri = 0 ; ri < 1000000 ; ++ri ) {
			gdam [ri] = (double) ri ;
		}
	stoptimer (etip) ;
	return swetacct (etip, (long long)ri) ;
}

/*	__	__	__	__	__	__	__	__	__
*/

# ifdef _HAS_LONGDOUBLE_

long double gldam [MEGASIZE] ;

void * swet305 (arg) void * arg ; {	/* "ext double  128 fill[]   1M" */
	ETI * etip = (ETI *) arg ;
	register int ri ;
	startimer (etip) ;
		for ( ri = 0 ; ri < 1000000 ; ++ri ) {
			gldam [ri] = (long double) ri ;
		}
	stoptimer (etip) ;
	return swetacct (etip, (long long)ri) ;
}

# endif /* _HAS_LONGDOUBLE_ */

/*	__	__	__	__	__	__	__	__	__
*/

unsigned char gban [MEGASIZE] ;

void * swet310 (arg) void * arg ; {	/* "ext byte    8 copy[]   1M" */
	ETI * etip = (ETI *) arg ;
	register int ri ;
	startimer (etip) ;
		for ( ri = 0 ; ri < 1000000 ; ++ri ) {
			gban [ri] = gbam [ri] ;
		}
	stoptimer (etip) ;
	return swetacct (etip, (long long)ri) ;
}

/*	__	__	__	__	__	__	__	__	__
*/

long long gllan [MEGASIZE] ;

void * swet313 (arg) void * arg ; {	/* "ext Long   64 copy[]   1M" */
	ETI * etip = (ETI *) arg ;
	register int ri ;
	startimer (etip) ;
		for ( ri = 0 ; ri < 1000000 ; ++ri ) {
			gllan [ri] = gllam [ri] ;
		}
	stoptimer (etip) ;
	return swetacct (etip, (long long)ri) ;
}

/*	__	__	__	__	__	__	__	__	__
*/

# ifdef _HAS_LONGDOUBLE_

long double gldan [MEGASIZE] ;

void * swet315 (arg) void * arg ; {	/* "ext Double 128 copy[]   1M" */
	ETI * etip = (ETI *) arg ;
	register int ri ;
	startimer (etip) ;
		for ( ri = 0 ; ri < 1000000 ; ++ri ) {
			gldan [ri] = gldam [ri] ;
		}
	stoptimer (etip) ;
	return swetacct (etip, (long long)ri) ;
}

# endif /* _HAS_LONGDOUBLE_ */

/*	__	__	__	__	__	__	__	__	__
*/

void * swet320 (arg) void * arg ; {	/* "ext byte    8 comp[]   1M" */
	ETI * etip = (ETI *) arg ;
	register int ri ;
	register int rd ;
	startimer (etip) ;
		for ( ri = 0 ; ri < 1000000 ; ++ri ) {
			rd = ( gban [ri] == gbam [ri] ) ;
		}
	stoptimer (etip) ;
	return swetacct (etip, (long long)ri) ;
}

/*	__	__	__	__	__	__	__	__	__
*/

void * swet323 (arg) void * arg ; {	/* "ext Long   64 comp[]   1M" */
	ETI * etip = (ETI *) arg ;
	register int ri ;
	register int rd ;
	startimer (etip) ;
		for ( ri = 0 ; ri < 1000000 ; ++ri ) {
			rd = ( gllan [ri] == gllam [ri] ) ;
		}
	stoptimer (etip) ;
	return swetacct (etip, (long long)ri) ;
}

/*	__	__	__	__	__	__	__	__	__
*/

# ifdef _HAS_LONGDOUBLE_

void * swet325 (arg) void * arg ; {	/* "ext Double 128 comp[]   1M" */
	ETI * etip = (ETI *) arg ;
	register int ri ;
	register int rd ;
	startimer (etip) ;
		for ( ri = 0 ; ri < 1000000 ; ++ri ) {
			rd = ( gldan [ri] == gldam [ri] ) ;
		}
	stoptimer (etip) ;
	return swetacct (etip, (long long)ri) ;
}

# endif /* _HAS_LONGDOUBLE_ */

/*	__	__	__	__	__	__	__	__	__
*/

void * swet351 (arg) void * arg ; {	/* "loc  int    32 roastbit   1M" */
	ETI * etip = (ETI *) arg ;
	unsigned int i, x = 0x78654321 ;
	startimer (etip) ;
		for ( i = 0 ; i < 1000000 ; ++i ) {
			x = ( ( x >> 13 ) ^ ( x & 0x00007fff ) ) | ( (~x) << 15 ) ;
		}
	stoptimer (etip) ;
	return swetacct (etip, 1000000LL) ;
}

/*	__	__	__	__	__	__	__	__	__
*/

void * swet352 (arg) void * arg ; {	/* "loc  int    64 roastbit   1M" */
	ETI * etip = (ETI *) arg ;
	unsigned long long i, x = 0x7865432198765431LL ;
	startimer (etip) ;
		for ( i = 0 ; i < 1000000LL ; ++i ) {
			x = ( ( x >> 29 ) ^ ( x & 0x000000007fffffffLL ) ) | ( (~x) << 31 ) ;
		}
	stoptimer (etip) ;
	return swetacct (etip, 1000000LL) ;
}

/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/

int firi (i) int i ; {
	int j = i ;
	return j ;
}

void * swet401 (arg) void * arg ; {	/* "reg int      32 f(i)   1M" */
	ETI * etip = (ETI *) arg ;
	register int ri ;
	register int rd ;
	startimer (etip) ;
		for ( ri = 0 ; ri < 1000000 ; ++ri ) {
			rd = firi ( ri ) ;
		}
	stoptimer (etip) ;
	return swetacct (etip, (long long)ri) ;
}

/*	__	__	__	__	__	__	__	__	__
*/

long long fllrll (i) long long i ; {
	long long j = i ;
	return j ;
}

void * swet402 (arg) void * arg ; {	/* "reg int      64 f(i)   1M" */
	ETI * etip = (ETI *) arg ;
	register long long ri ;
	register long long rd ;
	startimer (etip) ;
		for ( ri = 0 ; ri < 1000000LL ; ++ri ) {
			rd = fllrll ( ri ) ;
		}
	stoptimer (etip) ;
	return swetacct (etip, /*(long long)*/ri) ;
}

/*	__	__	__	__	__	__	__	__	__
*/

double fdrd (d) double d ; {
	double j = d ;
	return j ;
}

void * swet403 (arg) void * arg ; {	/* "reg double      64 f(i)   1M" */
	ETI * etip = (ETI *) arg ;
	register double ri ;
	register double rd ;
	startimer (etip) ;
		for ( ri = 0.0 ; ri < 1000000.0 ; ri += 1.0 ) {
			rd = fdrd ( ri ) ;
		}
	stoptimer (etip) ;
	return swetacct (etip, 1000000LL) ;
}

/*	__	__	__	__	__	__	__	__	__
*/

# ifdef _HAS_LONGDOUBLE_

long double fldrld (d) long double d ; {
	long double j = d ;
	return j ;
}

void * swet404 (arg) void * arg ; {	/* "reg double      64 f(i)   1M" */
	ETI * etip = (ETI *) arg ;
	register long double ri ;
	register long double rd ;
	startimer (etip) ;
		for ( ri = 0.0 ; ri < 1000000.0 ; ri += 1.0 ) {
			rd = fldrld ( ri ) ;
		}
	stoptimer (etip) ;
	return swetacct (etip, 1000000LL) ;
}

# endif /* _HAS_LONGDOUBLE_ */

/*	__	__	__	__	__	__	__	__	__
*/

void * swet412 (arg) void * arg ; {	/* "loc  int    32 barith     1M" */
	ETI * etip = (ETI *) arg ;
	int li ;
	int rd = 401 ;
	startimer (etip) ;
		for ( li = 0 ; li < 1000000 ; ++li ) {
			rd = ( ( rd * 373 ) / ( 7 + ( li % 19 ) ) ) - 313 ;
		}
	stoptimer (etip) ;
	return swetacct (etip, (long long)li) ;
}

/*	__	__	__	__	__	__	__	__	__
*/

void * swet413 (arg) void * arg ; {	/* "loc  Long   64 barith     1M" */
	ETI * etip = (ETI *) arg ;
	long long li ;
	long long rd = 401401LL ;
	startimer (etip) ;
		for ( li = 100000000000LL ; li < 100001000000LL ; ++li ) {
			rd = ( ( rd * 373373LL ) / ( 7LL + ( li % 1919LL ) ) ) - 313313LL ;
		}
	stoptimer (etip) ;
	return swetacct (etip, (long long)1000000) ;
}

/*	__	__	__	__	__	__	__	__	__
*/

void * swet414 (arg) void * arg ; {	/* "loc  double  64 barith     1M" */
	ETI * etip = (ETI *) arg ;
	double li ;
	double rd = 3.141592653589793238462 ;
	startimer (etip) ;
		for ( li = 0.0 ; li < 1000000.0 ; li += 1.0 ) {
			rd += ( ( li * 3141592653589793238462.0 ) - 2.71828182845904523 ) / ( 2.3141592653589793238462 ) ;
		}
	stoptimer (etip) ;
	return swetacct (etip, (long long)1000000) ;
}

/*	__	__	__	__	__	__	__	__	__
*/

# ifdef _HAS_LONGDOUBLE_

void * swet415 (arg) void * arg ; {	/* "loc  Double 128 barith     1M" */
	ETI * etip = (ETI *) arg ;
	long double li ;
	long double rd = 3.141592653589793238462 ;
	startimer (etip) ;
		for ( li = 0.0 ; li < 1000000.0 ; li += 1.0 ) {
			rd += ( ( li * 3141592653589793238462.0 ) - 2.71828182845904523 ) / ( 2.3141592653589793238462 ) ;
		}
	stoptimer (etip) ;
	return swetacct (etip, (long long)1000000) ;
}

# endif /* _HAS_LONGDOUBLE_ */

/*	__	__	__	__	__	__	__	__	__
*/

void * swet451 (arg) void * arg ; {	/* "loc int      32 switch()   1M" */
	ETI * etip = (ETI *) arg ;
	int li ;
	int lx = 300000 ;
	startimer (etip) ;
		for ( li = 0 ; li < 1000000 ; ++li ) {
			switch ( li % 10 ) {
				case 1 : lx +=  1000 ; break ;
				case 2 : lx -=  2000 ; break ;
				case 3 : lx +=  3000 ; break ;
				case 4 : lx -=  4000 ; break ;
				case 5 : lx +=  5000 ; break ;
				case 6 : lx -=  6000 ; break ;
				case 7 : lx +=  7000 ; break ;
				case 8 : lx -=  8000 ; break ;
				case 9 : lx +=  9000 ; break ;
				case 0 : lx -= 10000 ; break ;
			}
		}
	stoptimer (etip) ;
	return swetacct (etip, (long long)li) ;
}

/*	__	__	__	__	__	__	__	__	__
*/

void * swet452 (arg) void * arg ; {	/* "loc int      64 switch()   1M" */
	ETI * etip = (ETI *) arg ;
	long long li ;
	long long lx = 300000000000LL ;
	startimer (etip) ;
		for ( li = 0 ; li < 1000000LL ; ++li ) {
			switch ( li % 10LL ) {
				case 1 : lx +=  1000000000LL ; break ;
				case 2 : lx -=  2000000000LL ; break ;
				case 3 : lx +=  3000000000LL ; break ;
				case 4 : lx -=  4000000000LL ; break ;
				case 5 : lx +=  5000000000LL ; break ;
				case 6 : lx -=  6000000000LL ; break ;
				case 7 : lx +=  7000000000LL ; break ;
				case 8 : lx -=  8000000000LL ; break ;
				case 9 : lx +=  9000000000LL ; break ;
				case 0 : lx -= 10000000000LL ; break ;
			}
		}
	stoptimer (etip) ;
	return swetacct (etip, /*(long long)*/li) ;
}

/*	__	__	__	__	__	__	__	__	__
*/

void * swet463 (arg) void * arg ; {	/* "loc  Long   64 xor(L)     1M" */
	ETI * etip = (ETI *) arg ;
	long long lli ;
	long long lla = 0 , llb = 0 , llx = 1LL ;
	startimer (etip) ;
		for ( lli = 0LL ; lli < 1000000LL ; ++lli ) {
			lla = ISODD (lli) ;
			llb = ISODD (llx) ;
			llx = XOR ( (lla) , (llb) ) ? lla : llb ;
		}
	stoptimer (etip) ;
	return swetacct (etip, (long long)1000000) ;
}


/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/

void * swet501 (arg) void * arg ; {	/* "reg double      64 sin()   1M" */
	ETI * etip = (ETI *) arg ;
	register int ri ;
	double rd ;
	startimer (etip) ;
		for ( ri = 0 ; ri < 1000000 ; ++ri ) {
			rd = sin ( drangtab [ri] ) ;
		}
	stoptimer (etip) ;
	return swetacct (etip, (long long)ri) ;
}

/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/

void * swet502 (arg) void * arg ; {	/* "reg double      64 sqrt()   1M" */
	ETI * etip = (ETI *) arg ;
	register int ri ;
	double rd ;
	startimer (etip) ;
		for ( ri = 0 ; ri < 1000000 ; ++ri ) {
			rd = sqrt ( dranbtab [ri] ) ;
		}
	stoptimer (etip) ;
	return swetacct (etip, (long long)ri) ;
}

/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/

void * swet503 (arg) void * arg ; {	/* "reg double      64 log()   1M" */
	ETI * etip = (ETI *) arg ;
	register int ri ;
	double rd ;
	startimer (etip) ;
		for ( ri = 0 ; ri < 1000000 ; ++ri ) {
			rd = log ( dranbtab [ri] ) ;
		}
	stoptimer (etip) ;
	return swetacct (etip, (long long)ri) ;
}

# ifdef _HAS_LONGDOUBLE_

/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/

# ifdef _HAS_SINL_

void * swet521 (arg) void * arg ; {	/* "reg double      128 sinl()   1M" */
	ETI * etip = (ETI *) arg ;
	register int ri ;
	long double rd ;
	startimer (etip) ;
		for ( ri = 0 ; ri < 1000000 ; ++ri ) {
			rd = sinl ( ldrangtab [ri] ) ;
		}
	stoptimer (etip) ;
	return swetacct (etip, (long long)ri) ;
}

# endif

/*	__	__	__	__	__	__	__	__	__
*/

# ifdef _HAS_SQRTL_

void * swet522 (arg) void * arg ; {	/* "reg double      128 sqrtl()   1M" */
	ETI * etip = (ETI *) arg ;
	register int ri ;
	long double rd ;
	startimer (etip) ;
		for ( ri = 0 ; ri < 1000000 ; ++ri ) {
			rd = sqrtl ( ldranbtab [ri] ) ;
		}
	stoptimer (etip) ;
	return swetacct (etip, (long long)ri) ;
}

# endif

/*	__	__	__	__	__	__	__	__	__
*/

# ifdef _HAS_LOGL_

void * swet523 (arg) void * arg ; {	/* "reg double      128 logl()   1M" */
	ETI * etip = (ETI *) arg ;
	register int ri ;
	long double rd ;
	startimer (etip) ;
		for ( ri = 0 ; ri < 1000000 ; ++ri ) {
			rd = logl ( ldranbtab [ri] ) ;
		}
	stoptimer (etip) ;
	return swetacct (etip, (long long)ri) ;
}

# endif

# endif /* _HAS_LONGDOUBLE_ */

/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/

pthread_mutex_t		i32_mutex = PTHREAD_MUTEX_INITIALIZER ;

int	i32 = 0 ;

void * swet601 (arg) void * arg ; {	/* "reg int      32 ++mutex   1M" */
	ETI * etip = (ETI *) arg ;
	register int ri ;
	startimer (etip) ;
		for ( ri = 0 ; ri < 1000000 ; ++ri ) {
			pthread_mutex_lock(&i32_mutex) ;
			i32++ ;
			pthread_mutex_unlock(&i32_mutex) ;
		}
	stoptimer (etip) ;
	return swetacct (etip, (long long)ri) ;
}

/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/

void * swet701 (arg) void * arg ; {	/* "reg int      32 getpid()   1M" */
	ETI * etip = (ETI *) arg ;
	register int ri ;
	register int rd ;
	startimer (etip) ;
		for ( ri = 0 ; ri < 1000000 ; ++ri ) {
			rd = getpid () ;
		}
	stoptimer (etip) ;
	return swetacct (etip, (long long)ri) ;
}

void * swet702 (arg) void * arg ; {	/* "reg int      32 time()   1M" */
	ETI * etip = (ETI *) arg ;
	register int ri ;
	register int rd ;
	startimer (etip) ;
		for ( ri = 0 ; ri < 1000000 ; ++ri ) {
			rd = time (NULL) ;
		}
	stoptimer (etip) ;
	return swetacct (etip, (long long)ri) ;
}

void * swet703 (arg) void * arg ; {	/* "reg int      32 time()   1M" */
	ETI * etip = (ETI *) arg ;
	register int ri ;
	register int rd ;
	struct timespec	tsx ;
	startimer (etip) ;
		for ( ri = 0 ; ri < 1000000 ; ++ri ) {
			rd = clock_gettime (SYSCLOCK, &tsx) ;
		}
	stoptimer (etip) ;
	return swetacct (etip, (long long)ri) ;
}
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
void * swet801 (arg) void * arg ; {	/* "dsk  out   512 create     2K" */
	ETI * etip = (ETI *) arg ;
	sprintf ( filenamebuff , "swef%dd%dt%dr" , etip->et_dno , etip->et_tno , etip->et_rep ) ;
	startimer (etip) ;
	usleep ( 250000 ) ;
	stoptimer (etip) ;
	return swetacct (etip, (long long)250000) ;
}
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
void * swet902 (arg) void * arg ; {	/* "loc   float 32 leibniz    1M" */
	ETI * etip = (ETI *) arg ;
	float i , m = (float) 1000000L ;
	float p = 0 ;
	float d1 = (float) 1.0 ;
	float d2 = (float) 2.0 ;
	float d4 = (float) 4.0 ;
	startimer (etip) ;
	for ( i = 0.0 ; i < m ; i += d1 ) {
		p += ((int)i & 1 ? (i+i)-(d2*i+d1) : (d2*i+d1)-(i+i)) * ( d4 / (d2*i+d1) ) ;
	}
	stoptimer (etip) ;
	return swetacct (etip, (long long)m) ;
}
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
void * swet905 (arg) void * arg ; {	/* "loc   float 32 leibniz   10M" */
	ETI * etip = (ETI *) arg ;
	float i , m = (float) 10000000L ;
	float p = 0 ;
	float d1 = (float) 1.0 ;
	float d2 = (float) 2.0 ;
	float d4 = (float) 4.0 ;
	startimer (etip) ;
	for ( i = 0.0 ; i < m ; i += d1 ) {
		p += ((int)i & 1 ? (i+i)-(d2*i+d1) : (d2*i+d1)-(i+i)) * ( d4 / (d2*i+d1) ) ;
	}
	stoptimer (etip) ;
	return swetacct (etip, (long long)m) ;
}
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
void * swet912 (arg) void * arg ; {	/* "loc  double 64 leibniz    1M" */
	ETI * etip = (ETI *) arg ;
	double i , m = (double) 1000000L ;
	double p = 0 ;
	double d1 = (double) 1.0 ;
	double d2 = (double) 2.0 ;
	double d4 = (double) 4.0 ;
	startimer (etip) ;
	for ( i = 0.0 ; i < m ; i += d1 ) {
		p += ((int)i & 1 ? (i+i)-(d2*i+d1) : (d2*i+d1)-(i+i)) * ( d4 / (d2*i+d1) ) ;
	}
	stoptimer (etip) ;
	return swetacct (etip, (long long)m) ;
}
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
void * swet915 (arg) void * arg ; {	/* "loc  double 64 leibniz   10M" */
	ETI * etip = (ETI *) arg ;
	double i , m = (double) 10000000L ;
	double p = 0 ;
	double d1 = (double) 1.0 ;
	double d2 = (double) 2.0 ;
	double d4 = (double) 4.0 ;
	startimer (etip) ;
	for ( i = 0.0 ; i < m ; i += d1 ) {
		p += ((int)i & 1 ? (i+i)-(d2*i+d1) : (d2*i+d1)-(i+i)) * ( d4 / (d2*i+d1) ) ;
	}
	stoptimer (etip) ;
	return swetacct (etip, (long long)m) ;
}
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
void * swet918 (arg) void * arg ; {	/* "loc  double 64 leibniz  100M" */
	ETI * etip = (ETI *) arg ;
	double i , m = (double) 100000000L ;
	double p = 0 ;
	double d1 = (double) 1.0 ;
	double d2 = (double) 2.0 ;
	double d4 = (double) 4.0 ;
	startimer (etip) ;
	for ( i = 0.0 ; i < m ; i += d1 ) {
		p += ((int)i & 1 ? (i+i)-(d2*i+d1) : (d2*i+d1)-(i+i)) * ( d4 / (d2*i+d1) ) ;
	}
	stoptimer (etip) ;
	return swetacct (etip, (long long)m) ;
}
# ifdef _HAS_LONGDOUBLE_
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
void * swet922 (arg) void * arg ; {	/* "loc bigdbl 128 leibniz    1M" */
	ETI * etip = (ETI *) arg ;
	long double i , m = (long double) 1000000L ;
	long double p = 0 ;
	long double d1 = (long double) 1.0 ;
	long double d2 = (long double) 2.0 ;
	long double d4 = (long double) 4.0 ;
	startimer (etip) ;
	for ( i = 0.0 ; i < m ; i += d1 ) {
		p += ((int)i & 1 ? (i+i)-(d2*i+d1) : (d2*i+d1)-(i+i)) * ( d4 / (d2*i+d1) ) ;
	}
	stoptimer (etip) ;
	return swetacct (etip, (long long)m) ;
}
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
void * swet925 (arg) void * arg ; {	/* "loc bigdbl 128 leibniz   10M" */
	ETI * etip = (ETI *) arg ;
	long double i , m = (long double) 10000000L ;
	long double p = 0 ;
	long double d1 = (long double) 1.0 ;
	long double d2 = (long double) 2.0 ;
	long double d4 = (long double) 4.0 ;
	startimer (etip) ;
	for ( i = 0.0 ; i < m ; i += d1 ) {
		p += ((int)i & 1 ? (i+i)-(d2*i+d1) : (d2*i+d1)-(i+i)) * ( d4 / (d2*i+d1) ) ;
	}
	stoptimer (etip) ;
	return swetacct (etip, (long long)m) ;
}
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
void * swet928 (arg) void * arg ; {	/* "loc bigdbl 128 leibniz  100M" */
	ETI * etip = (ETI *) arg ;
	long double i , m = (long double) 100000000L ;
	long double p = 0 ;
	long double d1 = (long double) 1.0 ;
	long double d2 = (long double) 2.0 ;
	long double d4 = (long double) 4.0 ;
	startimer (etip) ;
	for ( i = 0.0 ; i < m ; i += d1 ) {
		p += ((int)i & 1 ? (i+i)-(d2*i+d1) : (d2*i+d1)-(i+i)) * ( d4 / (d2*i+d1) ) ;
	}
	stoptimer (etip) ;
	return swetacct (etip, (long long)m) ;
}
# endif /* _HAS_LONGDOUBLE_ */
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
void * swet932 (arg) void * arg ; {	/* "loc  double 64 1/+ln(2)    1M" */
	ETI * etip = (ETI *) arg ;
	double i , m = (double) 1000000.0 ;
	double p = 0.0 ;
	double d1 = (double) 1.0 ;
	startimer (etip) ;
	for ( i = 0 ; i < m ; i += d1 ) {
		if ( (int) i & 0x01 ) {
			p += ( d1 / i ) ;
		} else {
			p -= ( d1 / i ) ;
		}
	}
	stoptimer (etip) ;
	return swetacct (etip, (long long)m) ;
}
# ifdef _HAS_LONGDOUBLE_
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
void * swet933 (arg) void * arg ; {	/* "loc  bigdbl 128 1/+ln(2)    1M" */
	ETI * etip = (ETI *) arg ;
	long double i , m = (long double) 1000000.0 ;
	long double p = 0.0 ;
	long double d1 = (long double) 1.0 ;
	startimer (etip) ;
	for ( i = 0.0 ; i < m ; i += d1 ) {
		if ( (int)i & 0x01 ) {
			p += ( d1 / i ) ;
		} else {
			p -= ( d1 / i ) ;
		}
	}
	stoptimer (etip) ;
	return swetacct (etip, (long long)m) ;
}
# endif /* _HAS_LONGDOUBLE_ */
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
# ifdef NOTSOGOOD
void * swet950 (arg) void * arg ; {	/* "loc  int    32 primes   1000" */
	ETI * etip = (ETI *) arg ;
	int li ;
	int primes = 0 , j , e ;
	startimer (etip) ;
		for ( li = 1 ; li <= 1000 ; ++li ) {
				e = li>>1 ;
				for (j = 2; j < e; j++) {
					if (li % j == 0) {
						break ;
					}
				}
				if (li % j != 0) {
					primes++ ;
				}
		}
	stoptimer (etip) ;
	return swetacct (etip, 1000LL) ;
}
/*	__	__	__	__	__	__	__	__	__
*/
void * swet951 (arg) void * arg ; {	/* "loc  int    32 primes   10K" */
	ETI * etip = (ETI *) arg ;
	int li ;
	int primes = 0 , j , e ;
	startimer (etip) ;
		for ( li = 1 ; li <= 10000 ; ++li ) {
				e = li>>1 ;
				for (j = 2; j < e; j++) {
					if (li % j == 0) {
						break ;
					}
				}
				if (li % j != 0) {
					primes++ ;
				}
		}
	stoptimer (etip) ;
	return swetacct (etip, 10000LL) ;
}
/*	__	__	__	__	__	__	__	__	__
*/
void * swet952 (arg) void * arg ; {	/* "loc  int    32 primes   1M" */
	ETI * etip = (ETI *) arg ;
	int li ;
	int primes = 0 , j , e ;
	startimer (etip) ;
		for ( li = 1 ; li <= 1000000 ; ++li ) {
				e = li>>1 ;
				for (j = 2; j < e; j++) {
					if (li % j == 0) {
						break ;
					}
				}
				if (li % j != 0) {
					primes++ ;
				}
		}
	stoptimer (etip) ;
	return swetacct (etip, 1000000LL) ;
}
# endif /* NOTSOGOOD */
/*	__	__	__	__	__	__	__	__	__
*/

# define SIEVSIZE 1000000

int sieve [SIEVSIZE] ;

void * swet960 (arg) void * arg ; {	/* "ext  int    32 sieve   1M" */
	ETI * etip = (ETI *) arg ;

	int mult, prim, maxi = 1000000 ;

		for ( prim = 2 ; prim < maxi ; ++prim )
			sieve [prim] = 0x7fffffff ;

	startimer (etip) ;

		for ( prim = 2 ; prim < maxi ; ++prim )
			if ( sieve [prim] )
				for ( mult = 2 * prim ; mult < maxi ; mult += prim )
					if ( sieve [mult] )
						sieve [mult] = 0x00000000 ;

	stoptimer (etip) ;
	return swetacct (etip, 1000000LL) ;
}

/*	__	__	__	__	__	__	__	__	__
*/

long long lsieve [SIEVSIZE] ;

void * swet961 (arg) void * arg ; {	/* "ext  int    64 sieve   1M" */
	ETI * etip = (ETI *) arg ;

	long long mult, prim, maxi = 1000000LL ;

		for ( prim = 2 ; prim < maxi ; ++prim )
			lsieve [prim] = 0x7fffffffffffffffLL ;

	startimer (etip) ;

		for ( prim = 2 ; prim < maxi ; ++prim )
			if ( lsieve [prim] )
				for ( mult = 2 * prim ; mult < maxi ; mult += prim )
					if ( lsieve [mult] )
						lsieve [mult] = 0x0000000000000000LL ;

	stoptimer (etip) ;
	return swetacct (etip, 1000000LL) ;
}

/*	__	__	__	__	__	__	__	__	__
*/
# ifdef _HAS_LONGDOUBLE_

long double ldsieve [SIEVSIZE] ;

void * swet962 (arg) void * arg ; {	/* "ext  int    64 sieve   1M" */
	ETI * etip = (ETI *) arg ;

	long double mult, prim, maxi = 1000000.0 ;

		for ( prim = 2 ; prim < maxi ; ++prim )
			ldsieve [(int)prim] = PILD ;

	startimer (etip) ;

		for ( prim = 2 ; prim < maxi ; ++prim )
			if ( ldsieve [(int)prim] > 0.0 )
				for ( mult = 2 * prim ; mult < maxi ; mult += prim )
					if ( ldsieve [(int)mult] > 0.0 )
						ldsieve [(int)mult] = (long double) 0.0 ;

	stoptimer (etip) ;
	return swetacct (etip, 1000000LL) ;
}

# endif /* _HAS_LONGDOUBLE_ */
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
void subsleep (nus) int nus ; {
	struct timespec req , rem ;
	if ( nanoflag ) {
		req.tv_sec = 0 ;
		req.tv_nsec = nus ;
		nanosleep ( &req , &rem ) ;
	} else {
		usleep ( nus ) ;
	}
}
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
void * swet991 (arg) void * arg ; {	/* "loc  int    32 cpu%hog    1M" */
	ETI * etip = (ETI *) arg ;

	int nusperpct = 10 , cpuidlpct ;
	struct timeval tv3 , tv0 , tv1 , tv2 ;
	struct timezone tzx ;
	long long tps , maxtps = 0 ;

	cpuidlpct = 100 - cpuhogpct ;

	startimer (etip) ;

		gettimeofday ( &tv0 , &tzx ) ;
		do
		{
			subsleep ( cpuidlpct * nusperpct ) ;
			tps = 0 ;
			gettimeofday ( &tv1 , &tzx ) ;
			do
			{
				gettimeofday ( &tv2 , &tzx ) ;
				++tps ;
				if ( tv1.tv_usec > tv2.tv_usec )
				{
					tv2.tv_usec += 1000000 ;
					tv2.tv_sec-- ;
				}
				tv3.tv_usec = tv2.tv_usec - tv1.tv_usec ;
				tv3.tv_sec  = tv2.tv_sec  - tv1.tv_sec ;
			} while ( tv3.tv_usec < ( cpuhogpct * nusperpct ) ) ;
			if ( tps > maxtps )
			{
				maxtps = tps ;
			}
		} while ( ( tv2.tv_sec - tv0.tv_sec ) < maxcpuhogsec ) ;

	stoptimer (etip) ;

	return swetacct (etip, maxtps * 1000000LL * maxcpuhogsec ) ;
}
/*______________________________________________________________________*/

# define	X_FAST		0x00000001	/* k quick/faster tests				*/
# define	X_SLOW		0x00000002	/* s slower/longer tests			*/
# define	X_SIGN		0x00000004	/* n signed tests					*/
# define	X_UNSI		0x00000008	/* u unsigned tests					*/

# define	X_BYTE		0x00000010	/* b   8bit (byte) tests			*/
# define	X_WORD		0x00000020	/* w  16bit (word) tests			*/
# define	X_DBLW		0x00000040	/* d  32bit (double word) tests		*/
# define	X_QUAD		0x00000080	/* q  64bit (quad word) tests		*/

# define	X_OCTA		0x00000100	/* o 128bit (octa word) tests		*/
# define	X_INTG		0x00000200	/* i integer tests					*/
# define	X_FLOT		0x00000400	/* f floating point tests			*/
# define	X_STRN		0x00000800	/* a string tests					*/

# define	X_GLOB		0x00001000	/* g global tests					*/
# define	X_REGS		0x00002000	/* r register tests					*/
# define	X_LOCL		0x00004000	/* l local tests					*/

# define	X_VECT		0x00010000	/* v vector/array tests				*/
# define	X_PNTR		0x00020000	/* p pointer tests					*/
# define	X_BITF		0x00040000	/* h bit field tests				*/

# define	X_SYSC		0x00100000	/* y system call tests				*/
# define	X_MATH		0x00200000	/* m math tests						*/

# define	X_THRD		0x01000000	/* t parallell/concurrent threads	*/
# define	X_MUTX		0x02000000	/* x mutex/synchronized threads		*/

# define	X_FILE		0x04000000	/* e file i/o threads				*/

# define	X_BETA		0x08000000	/* experimental stuff				*/

# define	X_CODE		"ksnubwdqoifagrl?vph?ym??tx??????"
					/*	"ksnu bwdq oifa grl? vph? ym?? tx?? ????"		*/
/*
 *	._________________________________________________________________k quicker
 *	|  _______________________________________________________________s slower
 *	| |  _____________________________________________________________n signed
 *	| | |  ___________________________________________________________u unsigned
 *	| | | |  _________________________________________________________b   8bit
 *	| | | | |  _______________________________________________________w  16bit
 *	| | | | | |  _____________________________________________________d  32bit
 *	| | | | | | |  ___________________________________________________q  64bit
 *	| | | | | | | |  _________________________________________________o 128bit
 *	| | | | | | | | |  _______________________________________________i integer
 *	| | | | | | | | | |  _____________________________________________f floating
 *	| | | | | | | | | | |  ___________________________________________a string
 *	| | | | | | | | | | | |  _________________________________________g global
 *	| | | | | | | | | | | | |  _______________________________________r register
 *	| | | | | | | | | | | | | |  _____________________________________l local
 *	| | | | | | | | | | | | | | |  ___________________________________? reserved
 *	| | | | | | | | | | | | | | | |  _________________________________v vector
 *	| | | | | | | | | | | | | | | | |  _______________________________p pointer
 *	| | | | | | | | | | | | | | | | | |  _____________________________h bit
 *	| | | | | | | | | | | | | | | | | | |  ___________________________? reserved
 *	| | | | | | | | | | | | | | | | | | | |  _________________________y syscall
 *	| | | | | | | | | | | | | | | | | | | | |  _______________________m math
 *	| | | | | | | | | | | | | | | | | | | | | |  _____________________? reserved
 *	| | | | | | | | | | | | | | | | | | | | | | |  ___________________? reserved
 *	| | | | | | | | | | | | | | | | | | | | | | | |  _________________t threads
 *	| | | | | | | | | | | | | | | | | | | | | | | | |  _______________x mutex
 *	| | | | | | | | | | | | | | | | | | | | | | | | | |  _____________? reserved
 *	| | | | | | | | | | | | | | | | | | | | | | | | | | |  ___________? reserved
 *	| | | | | | | | | | | | | | | | | | | | | | | | | | | |  _________? reserved
 *	| | | | | | | | | | | | | | | | | | | | | | | | | | | | |  _______? reserved
 *	| | | | | | | | | | | | | | | | | | | | | | | | | | | | | |  _____? reserved
 *	| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |  ___? reserved
 *  | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
 *  | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
 *	k s n u b w d q o i f a g r l ? v p h ? y m ? ? t x ? ? ? ? ? ?
 */

struct swetctl {
	int		sc_name     ;
	void * (*sc_func) () ;
/*	char *	sc_scope	;	*/
/*	char *	sc_type		;	*/
/*	long	sc_size		;	*/
	char *	sc_what		;
	char *	sc_count	;
	char *	sc_dna		;	/*	flag codes			*/
	int    sc_flag		;	/*	flag bits			*/
} ;

typedef		struct swetctl		SWETCTL ;

# define	SOUC	((long)(sizeof(unsigned char)))
# define	SOIN	((long)(sizeof(int)))
# define	SOLL	((long)(sizeof(long long)))
# define	SOSH	((long)(sizeof(short)))
# define	SOFL	((long)(sizeof(float)))
# define	SODB	((long)(sizeof(double)))
# ifdef _HAS_LONGDOUBLE_
# define	SOLD	((long)(sizeof(long double)))
# endif /* _HAS_LONGDOUBLE_ */

SWETCTL swetsuite [] = {

	{ SWET(101), "loop++",     "1M", "ir.", X_FAST | X_DBLW | X_THRD				} ,
	{ SWET(102), "loop++",     "1M", "il.", X_FAST | X_DBLW | X_THRD				} ,
	{ SWET(103), "loop++",     "1M", "ig.", X_FAST | X_DBLW							} ,

	{ SWET(104), "seq++",    "1000", "ir.", X_FAST | X_DBLW | X_THRD				} ,
	{ SWET(105), "seq++",    "1000", "il.", X_FAST | X_DBLW | X_THRD				} ,
	{ SWET(106), "seq++",    "1000", "ig.", X_FAST | X_DBLW							} ,

	{ SWET(107), "loop++",     "1B", "ir.", X_SLOW | X_DBLW | X_THRD				} ,
	{ SWET(108), "loop++",     "1B", "il.", X_SLOW | X_DBLW | X_THRD				} ,
	{ SWET(109), "loop++",     "1B", "ig.", X_SLOW | X_DBLW							} ,

	{ SWET(111), "loop++",     "1M", "Lr.", X_FAST | X_QUAD | X_THRD				} ,
	{ SWET(112), "loop++",     "1M", "Ll.", X_FAST | X_QUAD | X_THRD				} ,
	{ SWET(113), "loop++",     "1M", "Lg.", X_FAST | X_QUAD						} ,
	{ SWET(117), "loop++",     "1B", "Lr.", X_SLOW | X_QUAD | X_THRD				} ,

	{ SWET(121), "loop++",     "1M", "sr.", X_FAST | X_WORD | X_THRD				} ,
	{ SWET(127), "loop++",     "1B", "sr.", X_SLOW | X_WORD | X_THRD				} ,
	{ SWET(131), "loop++",   "100M", "sr.", X_FAST | X_WORD | X_THRD				} ,

	{ SWET(144), "seq++",    "1000", "Lr.", X_FAST | X_QUAD | X_THRD					} ,
	{ SWET(145), "seq++",    "1000", "Ll.", X_FAST | X_QUAD | X_THRD					} ,
	{ SWET(146), "seq++",    "1000", "Lg.", X_FAST | X_QUAD					} ,

	{ SWET(202), "loop++",     "1M", "fl.", X_FAST | X_DBLW | X_THRD				} ,
	{ SWET(204), "loop++",    "10M", "fl.", X_FAST | X_DBLW | X_THRD				} ,
	{ SWET(206), "loop++",   "100M", "fl.", X_SLOW | X_DBLW | X_THRD				} ,
	{ SWET(208), "loop++",     "1B", "fl.", X_SLOW | X_DBLW | X_THRD				} ,

	{ SWET(212), "loop++",     "1M", "dl.", X_FAST | X_DBLW | X_THRD				} ,
	{ SWET(214), "loop++",    "10M", "dl.", X_FAST | X_DBLW | X_THRD				} ,
	{ SWET(216), "loop++",   "100M", "dl.", X_SLOW | X_DBLW | X_THRD				} ,
	{ SWET(218), "loop++",     "1B", "dl.", X_SLOW | X_DBLW | X_THRD				} ,

# ifdef _HAS_LONGDOUBLE_
	{ SWET(232), "loop++",     "1M", "Dl.", X_FAST | X_OCTA | X_THRD				} ,
	{ SWET(234), "loop++",    "10M", "Dl.", X_SLOW | X_OCTA | X_THRD				} ,
	{ SWET(236), "loop++",   "100M", "Dl.", X_SLOW | X_OCTA | X_THRD				} ,
	{ SWET(238), "loop++",     "1B", "Dl.", X_SLOW | X_QUAD | X_THRD				} ,
# endif /* _HAS_LONGDOUBLE_ */

	{ SWET(300), "fill[]",     "1M", "bg.", X_FAST | X_BYTE							} ,
	{ SWET(301), "fill[]",     "1M", "sg.", X_FAST | X_WORD				} ,
	{ SWET(302), "fill[]",     "1M", "ig.", X_FAST | X_DBLW							} ,
	{ SWET(303), "fill[]",     "1M", "Lg.", X_FAST | X_QUAD							} ,
	{ SWET(304), "fill[]",     "1M", "dg.", X_FAST | X_QUAD							} ,
# ifdef _HAS_LONGDOUBLE_
	{ SWET(305), "fill[]",     "1M", "Dg.", X_FAST | X_OCTA							} ,
# endif /* _HAS_LONGDOUBLE_ */

	{ SWET(310), "copy[]",     "1M", "bg.", X_FAST | X_BYTE							} ,
	{ SWET(313), "copy[]",     "1M", "Lg.", X_FAST | X_QUAD							} ,
# ifdef _HAS_LONGDOUBLE_
	{ SWET(315), "copy[]",     "1M", "Dg.", X_FAST | X_OCTA							} ,
# endif /* _HAS_LONGDOUBLE_ */

	{ SWET(320), "comp[]",     "1M", "bg.", X_FAST | X_BYTE							} ,
	{ SWET(323), "comp[]",     "1M", "Lg.", X_FAST | X_QUAD							} ,
# ifdef _HAS_LONGDOUBLE_
	{ SWET(325), "comp[]",     "1M", "Dg.", X_FAST | X_OCTA							} ,
# endif /* _HAS_LONGDOUBLE_ */

	{ SWET(351), "roastbit",   "1M", "il.", X_FAST | X_DBLW | X_THRD				} ,
	{ SWET(352), "roastbit",   "1M", "Ll.", X_FAST | X_QUAD | X_THRD				} ,

	{ SWET(401), "f(i)",       "1M", "ig.", X_FAST | X_DBLW | X_THRD					} ,
	{ SWET(402), "f(L)",       "1M", "Lg.", X_FAST | X_QUAD | X_THRD					} ,
	{ SWET(403), "f(d)",       "1M", "dg.", X_FAST | X_QUAD | X_THRD					} ,
# ifdef _HAS_LONGDOUBLE_
	{ SWET(404), "f(D)",       "1M", "Dg.", X_FAST | X_OCTA | X_THRD					} ,
# endif /* _HAS_LONGDOUBLE_ */
	{ SWET(412), "barith",     "1M", "il.", X_FAST | X_DBLW | X_THRD					} ,
	{ SWET(413), "barith",     "1M", "Ll.", X_FAST | X_QUAD | X_THRD					} ,
	{ SWET(414), "barith",     "1M", "dl.", X_FAST | X_QUAD | X_THRD					} ,
# ifdef _HAS_LONGDOUBLE_
	{ SWET(415), "barith",     "1M", "Dl.", X_FAST | X_OCTA | X_THRD					} ,
# endif /* _HAS_LONGDOUBLE_ */
	{ SWET(451), "switch()",   "1M", "il.", X_FAST | X_DBLW | X_THRD					} ,
	{ SWET(452), "switch()",   "1M", "Ll.", X_FAST | X_QUAD | X_THRD					} ,
	{ SWET(463), "xor(L)",     "1M", "Ll.", X_FAST | X_QUAD | X_THRD					} ,

	{ SWET(501), "sin()",      "1M", "dl.", X_FAST | X_WORD | X_THRD | X_MATH		} ,
	{ SWET(502), "sqrt()",     "1M", "dl.", X_FAST | X_WORD | X_THRD | X_MATH		} ,
	{ SWET(503), "log()",      "1M", "dl.", X_FAST | X_WORD | X_THRD | X_MATH		} ,
# ifdef _HAS_LONGDOUBLE_
# ifdef _HAS_SINL_
	{ SWET(521), "sinl()",     "1M", "Dl.", X_FAST | X_OCTA | X_THRD | X_MATH		} ,
# endif
# ifdef _HAS_SQRTL_
	{ SWET(522), "sqrtl()",    "1M", "Dl.", X_FAST | X_OCTA | X_THRD | X_MATH		} ,
# endif
# ifdef _HAS_LOGL_
	{ SWET(523), "logl()",     "1M", "Dl.", X_FAST | X_OCTA | X_THRD | X_MATH		} ,
# endif
# endif /* _HAS_LONGDOUBLE_ */

	{ SWET(601), "mutex++",    "1M", "ig.", X_FAST | X_DBLW | X_THRD | X_MUTX	} ,

	{ SWET(701), "getpid()",   "1M", "is.", X_FAST | X_DBLW | X_THRD				} ,
	{ SWET(702), "time()",     "1M", "is.", X_FAST | X_DBLW | X_THRD				} ,
	{ SWET(703), "clockg()",   "1M", "Ls.", X_FAST | X_QUAD | X_THRD				} ,

	{ SWET(801), "create",     "2K", "5d.", X_SLOW | X_FILE | X_THRD | X_BETA		} ,

	{ SWET(902), "leibniz",    "1M", "fl.", X_FAST | X_WORD | X_THRD | X_MATH		} ,
	{ SWET(905), "leibniz",   "10M", "fl.", X_FAST | X_WORD | X_THRD | X_MATH		} ,

	{ SWET(912), "leibniz",    "1M", "dl.", X_FAST | X_WORD | X_THRD | X_MATH		} ,
	{ SWET(915), "leibniz",   "10M", "dl.", X_FAST | X_WORD | X_THRD | X_MATH		} ,
	{ SWET(918), "leibniz",  "100M", "dl.", X_SLOW | X_WORD | X_THRD | X_MATH		} ,

# ifdef _HAS_LONGDOUBLE_
	{ SWET(922), "leibniz",    "1M", "Dl.", X_FAST | X_OCTA | X_THRD | X_MATH		} ,
	{ SWET(925), "leibniz",   "10M", "Dl.", X_SLOW | X_OCTA | X_THRD | X_MATH		} ,
	{ SWET(928), "leibniz",  "100M", "Dl.", X_SLOW | X_OCTA | X_THRD | X_MATH		} ,
# endif /* _HAS_LONGDOUBLE_ */

	{ SWET(932), "1/+ln(2)",   "1M", "dl.", X_FAST | X_WORD | X_THRD | X_MATH		} ,
# ifdef _HAS_LONGDOUBLE_
	{ SWET(933), "1/+ln(2)",   "1M", "Dl.", X_FAST | X_WORD | X_THRD | X_MATH		} ,
# endif /* _HAS_LONGDOUBLE_ */

# ifdef NOTSOGOOD
	{ SWET(950), "primes",     "1K", "il.", X_FAST | X_DBLW | X_THRD				} ,
	{ SWET(951), "primes",    "10K", "il.", X_FAST | X_DBLW | X_THRD				} ,
	{ SWET(952), "primes",     "1M", "il.", X_SLOW | X_DBLW | X_THRD				} ,
# endif /* NOTSOGOOD */

	{ SWET(960), "sieve",      "1M", "ig.", X_FAST | X_DBLW				} ,
	{ SWET(961), "sieve",      "1M", "Lg.", X_FAST | X_QUAD				} ,
# ifdef _HAS_LONGDOUBLE_
	{ SWET(962), "sieve",      "1M", "Dg.", X_FAST | X_OCTA				} ,
# endif /* _HAS_LONGDOUBLE_ */

	{ SWET(991), "cpu%hog",    "1M", "il.", X_SLOW | X_DBLW | X_THRD | X_BETA		} ,

	{ -1, NULL , NULL,         NULL,  NULL, 0x00000000	}
/*
		141	reg  int         32 --loop    1M
		201	reg  float       32 ++loop    1M (,10M)
		211	reg  doubl       64 ++loop    1M (,1B)
		221	reg  long doubl 128 ++loop    1M (,1B)
		241	reg  float       32 --loop    1M
		3xx                     array[]
		4xx                     f(double)
								+/-*	(real)
								%	(real)
								*fill,copy,comp
								xor (discrete)
		5xx      mathz
								trig: cos,tan,hypot
								trig mix
								hypot 1000 x 1000 (1M)
								hypot 10000 x 10000 (100M)
								pow
								log10
								math mix
								random number generator(s)
		901 reg  float       32 leibniz   1M
ok		902 loc  float       32 leibniz   1M
		903 glob float       32 leibniz   1M
		904 reg  float       32 leibniz  10M
ok		905 loc  float       32 leibniz  10M
		906 glob float       32 leibniz  10M
		911 reg  double      64 leibniz   1M
ok		912 loc  double      64 leibniz   1M
		913 glob double      64 leibniz   1M
		914 reg  double      64 leibniz  10M
ok		915 loc  double      64 leibniz  10M
		916 glob double      64 leibniz  10M
		917 reg  double      64 leibniz 100M
ok		918 loc  double      64 leibniz 100M
		919 glob double      64 leibniz 100M
		921 reg  bigdouble  128 leibniz   1M
ok		922 loc  bigdouble  128 leibniz   1M
		923 glob bigdouble  128 leibniz   1M
		924 reg  bigdouble  128 leibniz  10M
ok		925 loc  bigdouble  128 leibniz  10M
		926 glob bigdouble  128 leibniz  10M
		927 reg  bigdouble  128 leibniz 100M
ok		928 loc  bigdouble  128 leibniz 100M
		929 glob bigdouble  128 leibniz 100M
*/
} ;
/*________________________________________________________________________
*/
long testbitz (scp) SWETCTL * scp ; {
	long bitz = 0 ;
	switch ( scp->sc_dna[0] ) {
		case '5' : bitz = 512L ; break ;
		case 'b' : bitz = SOUC ; break ;
		case 's' : bitz = SOSH ; break ;
		case 'i' : bitz = SOIN ; break ;
		case 'L' : bitz = SOLL ; break ;
		case 'f' : bitz = SOFL ; break ;
		case 'd' : bitz = SODB ; break ;
# ifdef _HAS_LONGDOUBLE_
		case 'D' : bitz = SOLD ; break ;
# endif /* _HAS_LONGDOUBLE_ */
	}
	return bitz ;
}
/*	__	__	__	__	__	__	__	__	__
*/
char * testtype (scp) SWETCTL * scp ; {
	char * typz = "u/k" ;
	switch ( scp->sc_dna[0] ) {
		case '5' : typz = "sector" ;	break ;
		case 'b' : typz = "byte" ;		break ;
		case 's' : typz = "short" ;		break ;
		case 'i' : typz = "int" ;		break ;
		case 'L' : typz = "Long" ;		break ;
		case 'f' : typz = "float" ;		break ;
		case 'd' : typz = "double" ;	break ;
# ifdef _HAS_LONGDOUBLE_
		case 'D' : typz = "Double" ;	break ;
# endif /* _HAS_LONGDOUBLE_ */
	}
	return typz ;
}
/*	__	__	__	__	__	__	__	__	__
*/
char * testscope (scp) SWETCTL * scp ; {
	char * scop = "u/k" ;
	switch ( scp->sc_dna[1] ) {
		case 'd' : scop = "disk" ;		break ;
		case 'l' : scop = "local" ;		break ;
		case 'g' : scop = "global" ;	break ;
		case 'r' : scop = "cpureg" ;	break ;
		case 's' : scop = "system" ;	break ;
	}
	return scop ;
}
/*	__	__	__	__	__	__	__	__	__
*/
char * fmtdesc (scp) SWETCTL * scp ; {
	static char tmpbuf [128] ;
	long sc_size ;
	char * sc_type ;
	char * sc_scope ;
	sc_size = testbitz (scp) ;
	sc_type = testtype (scp) ;
	sc_scope = testscope (scp) ;
	sprintf (tmpbuf, "%-6s %8s %4ld %-8s %4s",
		sc_scope	,
		sc_type	,
		sc_size < 128 ? 8 * sc_size : sc_size	,
		scp->sc_what	,
		scp->sc_count
	) ;
	return tmpbuf ;
}
/*________________________________________________________________________
*/
void dashthis (fp, dp, flg) FILE * fp ; char * dp ; int flg ; {
	if ( snoutflag ) {
		if ( flg != '\n' ) {
			dodash (fp, strlen(dp)-1, flg) ;
		}
	} else {
		if ( flg == -1 ) {
			return ;
		}
		fprintf (fp, "%s", dp) ;
	}
}
/*	__	__	__	__	__	__	__	__	__
*/
void swetdashes (lfp, flg) FILE * lfp ; int flg ; {
	if ( snoutflag ) {
		if ( ! sno_qryflag (SNO_FRAME) ) {
			return ;
		}
		dashestart (lfp, flg) ;
	}
	if ( ropeflag )
		dashthis (lfp, "___ ", flg) ;
	if ( numberflag )
		dashthis (lfp, "___ ", flg) ;
	if ( repeatflag )
		dashthis (lfp, "___ ", flg) ;
	if ( idflag )
		dashthis (lfp, "___ ", flg) ;
	if ( descflag ) {
		if ( minutflag ) {
			dashthis (lfp, "______ ", flg) ;
			dashthis (lfp, "______ ", flg) ;
			dashthis (lfp, "____ ", flg) ;
			dashthis (lfp, "________ ", flg) ;
			dashthis (lfp, "____ ", flg) ;
		} else {
			dashthis (lfp, "__________________________________ ", flg) ;
		}
	}
	if ( elapsedflag ) {
		if ( nanoflag ) {
			dashthis (lfp, "__________________ ", flg) ;
		} else {
			dashthis (lfp, "_______________ ", flg) ;
		}
	}
	if ( freqflag )
		dashthis (lfp, "____________ ", flg) ;
	if ( rawflag )
		dashthis (lfp, "_______ ", flg) ;
	if ( sysclock > 0 ) {
		if ( relflag )
			dashthis (lfp, "_______ ", flg) ;
		if ( comflag )
			dashthis (lfp, "_______ ", flg) ;
	}
	dashthis (lfp, "\n\n", '\n') ;
	if ( snoutflag ) {
		dashesterm (lfp, flg) ;
	}
}
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
void showthis (fp, dp) FILE * fp ; char * dp ; {
	if ( snoutflag ) {
		showinfo (fp, dp, strlen (dp) - 1, SNO_STR /* | SNO_HEAD */) ;
	} else {
		fprintf (fp, "%s", dp) ;
	}
}
/*	__	__	__	__	__	__	__	__	__
*/
void swetheader (lfp) FILE * lfp ; {
	if ( snoutflag ) {
# ifdef BUGUNTU
		if ( threadflag ) {
			puts ("") ;
		}
# endif
		showinfo (lfp, NULL, 0, SNO_SOL | SNO_HEAD) ;
	} else {
		if ( dashflag ) {
			swetdashes (lfp, 0x00) ;
		}
	}
	if ( ropeflag ) {
		showthis (lfp, "thr ") ;
	}
	if ( numberflag ) {
		showthis (lfp, "num ") ;
	}
	if ( repeatflag ) {
		showthis (lfp, "rep ") ;
	}
	if ( idflag ) {
		showthis (lfp, "_id ") ;
	}
	if ( descflag ) {
		if ( minutflag ) {
			showthis (lfp, "scope_ ") ;
			showthis (lfp, "_type_ ") ;
			showthis (lfp, "bits ") ;
			showthis (lfp, "exertion ") ;
			showthis (lfp, "toll ") ;
		} else {
			showthis (lfp, "scope      type bits test    count ") ;
		}
	}
	if ( elapsedflag ) {
		if ( nanoflag ) {
			showthis (lfp, "hh:mm:ss.mmmuuunnn ") ;
		} else {
			showthis (lfp, "hh:mm:ss.mmmuuu ") ;
		}
	}
	if ( freqflag ) {
		showthis (lfp, "opers/second ") ;
	}
	if ( rawflag ) {
		showthis (lfp, "abs.eff ") ;
	}
	if ( sysclock > 0 ) {
		if ( relflag ) {
			showthis (lfp, "rel.eff ") ;
		}
		if ( comflag ) {
			showthis (lfp, "com.eff ") ;
		}
	}
	if ( verboseflag > 2 ) { /* experimental stuff */
		if ( sysclock > 0 ) {
			showthis ( lfp, "cy/op " ) ; /* hog = cycles/op */
		}
		showthis ( lfp, "ns/op " ) ; /* nop = ns/op */
	}
	if ( snoutflag ) {
		showinfo (lfp, NULL, 0, SNO_EOL | SNO_HEAD) ;
		swetdashes (lfp, SNO_PLUS) ;
	} else {
		fprintf (lfp, "%s", "\n") ; flushthis (lfp) ;
		if ( dashflag ) {
			swetdashes (lfp, 0x00) ;
		}
	}
}
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
void itemthis (buf, tmp, sep, lfp) char * buf , * tmp ; int sep ; FILE * lfp ; {
	if ( snoutflag ) {
		if ( buf == NULL ) {
			buf = bigbuf ;
		}
		if ( sep == ' ' ) {
			showinfo (lfp, tmp, strlen(tmp)-1, SNO_STR) ;
		}
	} else {
		if ( sep == ' ' ) {
			strcat (buf, tmp) ;
		}
		if ( sep == '\n' ) {
			fprintf (lfp, "%s", buf) ; flushthis (lfp) ;
		}
	}
}
/*	__	__	__	__	__	__	__	__	__
*/
void swethis (i, j, lfp, tsip) int i, j ; FILE * lfp ; TSI * tsip ; {
	char tmpbuf [256] ;
	ETI * etip /* = NULL */ ;
	/* minutiae ... */
	long sc_size ;
	char * sc_type ;
	char * sc_scope ;
	/* minutiae ... */
	etip = (ETI *) malloc (ETISIZ) ;
	if ( etip == NULL ) {
		fprintf (stderr, "** no memory on rep#%d of test#%d\n", 1+i, 1+j) ;
		fflush (stderr) ;
		return ;
	}
	tmpbuf[0] = '\0' ;
	if ( snoutflag ) {
		showinfo (lfp, NULL, 0, SNO_SOL | SNO_ITEM ) ;
	} else {
		flushthis (lfp) ;
	}
	if ( ropeflag ) {
		pthread_mutex_lock(&cnt_mutex);
		etitab[tsip->testcount++] = etip ;
		etip->et_tno = tsip->testcount ;
		pthread_mutex_unlock(&cnt_mutex);
		sprintf (tmpbuf, "%3d ", 1+tsip->rno) ;
		itemthis (etip->et_buf, tmpbuf, ' ', lfp) ;
	} else {
		etitab[tsip->testcount++] = etip ;
		etip->et_tno = tsip->testcount ;
	}
	if ( numberflag ) {
		sprintf (tmpbuf, "%3d ", etip->et_tno) ;
		itemthis (etip->et_buf, tmpbuf, ' ', lfp) ;
	}
	if ( repeatflag ) {
		sprintf (tmpbuf, "%3d ", 1+i) ;
		itemthis (etip->et_buf, tmpbuf, ' ', lfp) ;
	}
	if ( idflag ) {
		sprintf (tmpbuf, "%d ", swetsuite[j].sc_name) ;
		itemthis (etip->et_buf, tmpbuf, ' ', lfp) ;
	}
	if ( descflag ) {
		if ( minutflag ) {
			sc_scope = testscope (&swetsuite[j]) ;
			sprintf (tmpbuf, "%-6s ", sc_scope) ;
			itemthis (etip->et_buf, tmpbuf, ' ', lfp) ;

			sc_type = testtype (&swetsuite[j]) ;
			sprintf (tmpbuf, "%6s ", sc_type) ;
			itemthis (etip->et_buf, tmpbuf, ' ', lfp) ;

			sc_size = testbitz (&swetsuite[j]) ;
			sprintf (tmpbuf, "%4ld ", sc_size < 128 ? 8 * sc_size : sc_size) ;
			itemthis (etip->et_buf, tmpbuf, ' ', lfp) ;

			sprintf (tmpbuf, "%-8s ", swetsuite[j].sc_what) ;
			itemthis (etip->et_buf, tmpbuf, ' ', lfp) ;

			sprintf (tmpbuf, "%4s ", swetsuite[j].sc_count) ;
			itemthis (etip->et_buf, tmpbuf, ' ', lfp) ;
		} else {
			sprintf (tmpbuf, "%s ", fmtdesc (&swetsuite[j])) ;
			itemthis (etip->et_buf, tmpbuf, ' ', lfp) ;
		}
	}
	if ( ! threadflag ) {
		itemthis (etip->et_buf, NULL, '\n', lfp) ;
	}
	etip->et_pid = getpid () ;
	etip->et_tsi = tsip ;
	etip->et_lfp = lfp ;
	etip->et_flg = 0 ;
	etip->et_ind = j ;
	etip->et_rep = 1 + i ;
	if ( yarnflag ) {
		if ( pthread_create ( &etip->et_tid, NULL, swetsuite[j].sc_func, (void *) etip ) != 0 ) {
			etip->et_err = errno ;
			etip->et_flg |= XF_FAIL ;
			fprintf (stderr, "** thread create failed on rep#%d of test#%d\n", 1+i, 1+j) ;
			fflush (stderr) ;
		} else {
			etip->et_flg |= XF_LIVE ;
		}
	} else {
		etip->et_flg |= XF_LIVE ;
		(void) (*swetsuite[j].sc_func) ( (void *) etip ) ;
	}
}
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
FILE * swetlog (rno) int rno ; {
	char		tempbuff [128] ;
	char		tempname [512] ;
	char *		fiobuf ;
	int			rd ;
	FILE *	lfp = NULL ;
	pid_t	swetpid = (pid_t) 0 ;

	strcpy (tempname, progname) ;

	if ( daemonflag ) {
		swetpid = getpid () ;
		sprintf (tempbuff, "_%ld", (long)swetpid) ;
		strcat (tempname, tempbuff) ;
	}

	if ( ropeflag ) {
		sprintf (tempbuff, "_%d", 1+rno) ;
		strcat (tempname, tempbuff) ;
	}

	strcat (tempname, ".log") ;

	lfp = fopen ( tempname , "w" ) ;

	if ( lfp == NULL ) {
		fprintf (stderr, "** error creating log file '%s'\n", tempname) ;
		fflush (stderr) ;
	} else {
		fiobuf = calloc (FIOBUFSIZ, sizeof (char)) ;
		if ( fiobuf == NULL ) {
			fprintf (stderr, "** no memory for log file i/o buffer '%s'\n", tempname) ;
			fflush (stderr) ;
		} else {
# ifdef THRNBF
			if ( threadflag ) {
				rd = setvbuf (lfp, fiobuf, _IONBF, FIOBUFSIZ) ;
			} else {
				rd = setvbuf (lfp, fiobuf, _IOFBF, FIOBUFSIZ) ;
			}
# else
			rd = setvbuf (lfp, fiobuf, _IOFBF, FIOBUFSIZ) ;
# endif
			if ( rd != 0 ) {
				fprintf (stderr, "** setvbuf('%s',%d) failed\n", tempname, FIOBUFSIZ) ;
				fflush (stderr) ;
			}
		}
/*
		ropetab[rno].rc_log = strdup ( tempname ) ;
*/
	}

	return lfp ;
}
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
void resetsi (tsip, rno) TSI * tsip ; int rno ; {
	tsip->rno			= rno ;
	tsip->testcount		= 0 ;
	tsip->sumcount		= 0 ;
	tsip->sumelap		= 0 ;
	tsip->sumfreq		= 0 ;
	tsip->sumbigscore	= 0.0 ;
	tsip->sumcomscore	= 0.0 ;
	tsip->sumrelscore	= 0.0 ;
	tsip->avgcount		= 0 ;
	tsip->avgelap		= 0 ;
	tsip->avgfreq		= 0 ;
	tsip->avgbigscore	= 0.0 ;
	tsip->avgcomscore	= 0.0 ;
	tsip->avgrelscore	= 0.0 ;
}
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
int swetfind (id) int id ; {
	int i ;
	for ( i = 0 ; i < setlength ; ++i )
		if ( swetset[i] == id )
			return 1 ;
	return 0 ;
}
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
void gizethis (lfp, buf) FILE * lfp ; char * buf ; {
	if ( snoutflag ) {
		if ( *buf != '\n' ) {
			showinfo (lfp, buf, strlen(buf)-1, SNO_STR) ;
		}
	} else {
		fprintf (lfp, "%s", buf) ;
		if ( *buf == '\n' ) {
			flushthis (lfp) ;
		}
	}
}
/*	__	__	__	__	__	__	__	__	__
*/
void avergize (lfp, tsip, what) FILE * lfp ; TSI * tsip ; char * what ; {
	char tmpbuf [256] ;
	if ( snoutflag ) {
		swetdashes (lfp, SNO_PLUS) ;
		showinfo (lfp, NULL, 0, SNO_SOL | SNO_FOOT) ;
	} else {
		if ( dashflag ) {
			swetdashes (lfp, 0x00) ;
		}
	}
	if ( ropeflag ) {
		if ( tsip->rno < 0 ) {
			sprintf (tmpbuf, "%3d ", tsip->testcount) ;
			gizethis (lfp, tmpbuf) ;
		} else {
			sprintf (tmpbuf, "%3d ", tsip->rno) ;
			gizethis (lfp, tmpbuf) ;
		}
	}
	if ( numberflag ) {
		sprintf (tmpbuf, "%3d ", tsip->testcount) ;
		gizethis (lfp, tmpbuf) ;
	}
	if ( repeatflag ) {
		sprintf (tmpbuf, "%s ", "n/a") ;
		gizethis (lfp, tmpbuf) ;
	}
	if ( idflag ) {
		sprintf (tmpbuf, "%3d ", tsip->testcount) ;
		gizethis (lfp, tmpbuf) ;
	}
	tsip->avgcount = tsip->sumcount / tsip->testcount ;
	if ( descflag ) {
		if ( minutflag ) {
			sprintf (tmpbuf, "...%3s ", what) ;
			gizethis (lfp, tmpbuf) ;
			showthis (lfp, "...... ") ;
			showthis (lfp, ".... ") ;
			showthis (lfp, "averages ") ;
			showthis (lfp, ".... ") ;
		} else {
			sprintf (tmpbuf, "%3s averages       %15lld ", what, tsip->avgcount) ;
			gizethis (lfp, tmpbuf) ;
		}
	}
	tsip->avgelap = tsip->sumelap / tsip->testcount ;
	if ( elapsedflag ) {
		sprintf (tmpbuf, "%s ", fmtelaps (tsip->avgelap)) ;
		gizethis (lfp, tmpbuf) ;
	}
	tsip->avgfreq = tsip->sumfreq / tsip->testcount ;
	if ( freqflag ) {
		sprintf (tmpbuf, "%12lld ", tsip->avgfreq) ;
		gizethis (lfp, tmpbuf) ;
	}
	tsip->avgbigscore = tsip->sumbigscore / tsip->testcount ;
	if ( rawflag ) {
		sprintf (tmpbuf, "%7.3f ", tsip->avgbigscore) ;
		gizethis (lfp, tmpbuf) ;
	}
	if ( sysclock > 0 ) {
		tsip->avgrelscore = tsip->sumrelscore / tsip->testcount ;
		if ( relflag ) {
			sprintf (tmpbuf, "%7.3f ", tsip->avgrelscore) ;
			gizethis (lfp, tmpbuf) ;
		}
		tsip->avgcomscore = tsip->sumcomscore / tsip->testcount ;
		if ( comflag ) {
			sprintf (tmpbuf, "%7.3f ", tsip->avgcomscore) ;
			gizethis (lfp, tmpbuf) ;
		}
	}
	if ( snoutflag ) {
		showinfo (lfp, NULL, 0, SNO_EOL | SNO_FOOT) ;
	} else {
		gizethis (lfp, "\n") ;
	}
}
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
void totalize (lfp, tsip, what) FILE * lfp ; TSI * tsip ; char * what ; {
	char tmpbuf [256] ;
	if ( snoutflag ) {
		swetdashes (lfp, SNO_PLUS) ;
		showinfo (lfp, NULL, 0, SNO_SOL | SNO_FOOT) ;
	} else {
		if ( dashflag ) {
			swetdashes (lfp, 0x00) ;
		}
	}
	if ( ropeflag ) {
		if ( tsip->rno < 0 ) {
			sprintf (tmpbuf, "%3d ", tsip->testcount) ;
			gizethis (lfp, tmpbuf) ;
		} else {
			sprintf (tmpbuf, "%3d ", tsip->rno) ;
			gizethis (lfp, tmpbuf) ;
		}
	}
	if ( numberflag ) {
		sprintf (tmpbuf, "%3d ", tsip->testcount) ;
		gizethis (lfp, tmpbuf) ;
	}
	if ( repeatflag ) {
		sprintf (tmpbuf, "%s ", "n/a") ;
		gizethis (lfp, tmpbuf) ;
	}
	if ( idflag ) {
		sprintf (tmpbuf, "%3d ", tsip->testcount) ;
		gizethis (lfp, tmpbuf) ;
	}
	if ( descflag ) {
		if ( minutflag ) {
			sprintf (tmpbuf, "...%3s ", what) ;
			gizethis (lfp, tmpbuf) ;
			showthis (lfp, "...... ") ;
			showthis (lfp, ".... ") ;
			showthis (lfp, ".totals. ") ;
			showthis (lfp, ".... ") ;
		} else {
			sprintf (tmpbuf, "%3s totals      %18lld ", what, tsip->sumcount) ;
			gizethis (lfp, tmpbuf) ;
		}
	}
	if ( elapsedflag ) {
		sprintf (tmpbuf, "%s ", fmtelaps (tsip->sumelap)) ;
		gizethis (lfp, tmpbuf) ;
	}
	if ( freqflag ) {
		sprintf (tmpbuf, "%12lld ", tsip->sumfreq) ;
		gizethis (lfp, tmpbuf) ;
	}
	if ( rawflag ) {
		sprintf (tmpbuf, "%7.3f ", tsip->sumbigscore) ;
		gizethis (lfp, tmpbuf) ;
	}
	if ( sysclock > 0 ) {
		if ( relflag ) {
			sprintf (tmpbuf, "%7.3f ", tsip->sumrelscore) ;
			gizethis (lfp, tmpbuf) ;
		}
		if ( comflag ) {
			sprintf (tmpbuf, "%7.3f ", tsip->sumcomscore) ;
			gizethis (lfp, tmpbuf) ;
		}
	}
	if ( snoutflag ) {
		showinfo (lfp, NULL, 0, SNO_EOL | SNO_FOOT) ;
	} else {
		gizethis (lfp, "\n") ;
	}
}
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
void swetest (rno) int rno ; {				/*	the whole burrito !		*/
	int i = 0 , j = 0 , alldone = 0 ;
	time_t tloc = 0 ;
	FILE * lfp = stdout ;
	TSI * tsip = &swepitom ;

	if ( rno >= 0 || daemonflag ) {
		lfp = swetlog (rno) ;
		if ( lfp == NULL ) {
			lfp = stderr ;
		}
		tsip = &tsitab[rno] ;
	}
	if ( lfp == stdout || lfp == stderr ) {
		sno_setflag (SNO_FLUSH) ;
		++flushflag ;
	}
	resetsi (tsip, rno) ;
	if ( snoutflag ) {
		if ( sno_qryflag (SNO_HTML) ) {
			htmlhead (lfp, SWNAME, SWVERS, SWTAGS) ;
			htmlbody (lfp, inspectflag, SWDESC) ;
		}
		if ( sno_qryflag (SNO_FRAME) ) {
			swetdashes (lfp, SNO_HEAD) ;
		}
	}
	if ( headerflag ) {
		swetheader (lfp) ;
	}
	for ( j = 0 ; swetsuite[j].sc_func != NULL ; ++j ) {
		if ( setflag ) {
			if ( ! swetfind ( swetsuite[j].sc_name ) ) {
				continue ;
			}
		}
		if ( swetsuite[j].sc_flag & X_BETA ) {
			if ( ! betaflag ) {
				continue ;
			}
		}
		if ( testmask != 0x00 ) {
			if ( ( swetsuite[j].sc_flag & testmask ) != testmask ) {
				continue ;
			}
		}
		for ( i = 0 ; i < maxrepeat ; ++i ) {
			swethis ( i , j , lfp , tsip ) ;
		}
	}
	if ( yarnflag ) { /* wait for all threads to complete */
#ifdef JOINEM /* join */
		if ( joinflag ) {
			for ( tc = 0 ; tc < nthr ; ++tc ) {
				if ( thrdat[tc].tc_flag & TCF_CREATED ) {
					if ( ( rd = pthread_join ( thrdat[tc].tc_id, NULL ) ) != 0 )
						perror (progname) ;
					else
						thrdat[tc].tc_flag |= TCF_JOINED ;
				}
			}
		}
#endif
		if ( pollflag ) {
			for ( ; ; ) {
				time (&tloc) ;
				if ( verboseflag > 1 ) {
					fprintf (stderr, "waiting %d seconds %s", polldelay, ctime (&tloc)) ;
					fflush (stderr) ;
				} else if ( verboseflag == 1 ) {
					fputc ( '.' , stderr ) ;
					fflush (stderr) ;
				}
				sleep (polldelay) ;
				alldone = 1 ;
				for ( j = 0 ; j < tsip->testcount ; ++j ) {
					if ( etitab[j]->et_flg & XF_LIVE ) {
						if ( ! ( etitab[j]->et_flg & XF_DONE ) ) {
							alldone = 0 ;
						}
					}
				}
				if ( alldone ) {
					if ( verboseflag == 1 ) {
						fputc ( '\n' , stderr ) ;
						fflush (stderr) ;
					}
					break ;
				}
			}
		}
	}
	if ( averageflag ) {
		avergize ( lfp , tsip , "set" ) ;
	}
	if ( totalflag ) {
		totalize ( lfp , tsip , "set" ) ;
	}
	if ( snoutflag ) {
		if ( sno_qryflag (SNO_FRAME) ) {
			swetdashes (lfp, SNO_TAIL) ;
		}
		if ( sno_qryflag (SNO_HTML) ) {
			if ( obsflag ) {
				if ( inspectflag ) {
					strcat (obsbuf, "(@) ") ;
					strcat (obsbuf, zest()) ;
				}
				htmltail (lfp, obsbuf) ;
			} else {
				if ( inspectflag ) {
					htmltail (lfp, zest()) ;
				} else {
					htmltail (lfp, NULL) ;
				}
			}
		} else {
			if ( inspectflag ) {
				fprintf (lfp, "(@) %s\n", zest()) ;
			}
			if ( obsflag ) {
				fprintf (lfp, "(*) %s\n", obsbuf) ;
			}
		}
	} else {
		if ( dashflag ) {
			swetdashes (lfp, 0x00) ;
		}
		if ( inspectflag ) {
			fprintf (lfp, "(@) %s\n", zest()) ;
		}
		if ( obsflag ) {
			fprintf (lfp, "(*) %s\n", obsbuf) ;
		}
	}
	if ( lfp != stdout ) {
		fclose (lfp) ;
	}
}
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
struct ropectrl {
	pthread_t	rc_tid ;
	int			rc_rno ;
	int			rc_flg ;
	int			rc_err ;
	time_t		rc_sot ;
	time_t		rc_eot ;
	char * 		rc_res ;
	char *		rc_log ;
	FILE *		rc_lfp ;
} ;

typedef		struct ropectrl		ROPECTRL ;

ROPECTRL	ropetab [MAXROPE] ;
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
void * swetrope (arg) void * arg ; {
	ROPECTRL * rcp = NULL ;
	rcp = (ROPECTRL *) arg ;
	swetest ( rcp->rc_rno ) ;
	rcp->rc_flg |= XF_DONE ;
	return (void *) NULL ;
}
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
void epitomize () {
	int rno = -1 ;
	TSI * tsip = NULL ;

	resetsi ( &swepitom, -2 ) ;
	if ( headerflag ) {
		if ( snoutflag ) {
			swetdashes (logfp, SNO_HEAD) ;
		}
		swetheader (logfp) ;
	}
	for ( rno = 0 ; rno < maxthread ; ++rno ) {
		tsip = &tsitab[rno] ;
		swepitom.testcount		+=	tsip->testcount		;
		swepitom.sumcount		+=	tsip->sumcount		;
		swepitom.sumelap		+=	tsip->sumelap		;
		swepitom.sumfreq		+=	tsip->sumfreq		;
		swepitom.sumbigscore	+=	tsip->sumbigscore	;
		swepitom.sumcomscore	+=	tsip->sumcomscore	;
		swepitom.sumrelscore	+=	tsip->sumrelscore	;
	}
	if ( averageflag ) {
		avergize ( logfp , &swepitom , "big" ) ;
	}
	if ( totalflag ) {
		totalize ( logfp , &swepitom , "big" ) ;
	}
	if ( snoutflag ) {
		if ( averageflag || totalflag ) {
			swetdashes (logfp, SNO_TAIL) ;
		}
	} else {
		if ( dashflag ) {
			swetdashes (logfp, 0x00) ;
		}
	}
}
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
void swetwork () {
	int rno = -1 ;
	ROPECTRL * rcp = NULL ;

	if ( ropeflag ) {
		for ( rno = 0 ; rno < maxthread ; ++rno ) { /* fire N testset threads */
			rcp = &ropetab[rno] ;
			rcp->rc_rno = rno ;
			if ( pthread_create ( &rcp->rc_tid, NULL, swetrope, (void *) rcp ) != 0 ) {
				rcp->rc_err = errno ;
				rcp->rc_flg |= XF_FAIL ;
				fprintf (stderr, "** thread create failed on testset#%d\n", 1+rno) ;
				fflush (stderr) ;
			} else {
				rcp->rc_flg |= XF_LIVE ;
			}
		}
		if ( joinflag ) { /* wait N testset threads */
			for ( rno = 0 ; rno < maxthread ; ++rno ) {
				rcp = &ropetab[rno] ;
				if ( rcp->rc_flg & XF_LIVE ) {
					if ( pthread_join ( rcp->rc_tid, NULL ) != 0 ) {
						rcp->rc_err = errno ;
						rcp->rc_flg |= XF_FAIL ;
						fprintf (stderr, "** thread join failed on testset#%d\n", 1+rno) ;
						fflush (stderr) ;
					}
				}
			}
		}
		if ( pollflag ) {
		}
		if ( maxthread > 1 ) {
			epitomize () ;
		}
	} else {
		swetest (rno) ;
	}
}
/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__
*/
void swetquit () {
	if ( verboseflag > 1 ) {
		printf ("+> terminating.\n") ;
	}
	if ( logfp != stdout ) {
		fclose (logfp) ;
	}
}

/*________________________________________________________________________
*/
void swetdoit () {
	int dmncnt = 0 , rd = 0 ;
	pid_t deadid = (pid_t) 0 ;

	if ( daemonflag ) {
		if ( verboseflag /* > 1 */ ) {
			printf ("|> master=%ld\n", (long)getpid()) ;
		}
		for ( dmncnt = 0 ; dmncnt < maxdaemon ; ++dmncnt ) {			/* fire # daemons */
			if ( verboseflag /* > 1 */ ) {
				printf ("|> instance=%d create=", 1+dmncnt) ; fflush (stdout) ;
			}
			rd = daemit ( dmnfun , &dmndat[dmncnt] , 0 ) ;
			if ( verboseflag /* > 1 */ ) {
				printf ("%s", rd == 0 ? "ok" : "fail") ;
				if ( rd == 0 )
					printf (" pid=%ld", (long)dmndat[dmncnt].xd_pid) ;
				printf ("\n") ;
			}
		}
		if ( waitflag ) {												/* wait # daemons */
			for ( dmncnt = 0 ; dmncnt < maxdaemon ; ) {
				deadid = waitpid ( -1 , NULL , 0 ) ;
				if ( verboseflag /* > 1 */ ) {
					printf ("|> completed=%d waitpid=%ld\n", 1+dmncnt, (long)deadid) ;
				}
				if ( deadid == (pid_t) -1 ) {
					sleep (1) ;
					continue ;
				} else {
					++dmncnt ;
				}
			}
			if ( reportflag && verboseflag ) {							/* show # results */
				for ( dmncnt = 0 ; dmncnt < maxdaemon ; ++dmncnt ) {
					printf ("|> result(%ld) : [%ld] \n", (long)dmndat[dmncnt].xd_pid, dmndat[dmncnt].xd_lres) ;
				}
			}
		}
	} else {
		swetwork () ;
	}
}
/*________________________________________________________________________
*/
void showversion () {
	char * ton , * tov , * tcm ;
	printf ("%s_%s", SWNAME, SWVERS) ;
	if ( 0 != strcmp ( "$" , SWFORG ) ) {
		printf ("%s", SWFORG) ;
	}
	if ( verboseflag ) {
		ton = getosname () ;
		tov = getosvers () ;
		tcm = getcpuinf ("model") ;
		if ( 0 == strcmp ( tcm , "generic" ) ) {
			tcm = CPUMODEL ;
		}
		printf ("_%s_%s_%s", tcm, /* OSBRAND */ ton, /* OSVERS */ tov) ;
#ifdef linux
		if ( verboseflag > 1 ) {
			printf ("_%s", getdistro()) ;
		}
#endif
	}
	printf ("\n") ;
	exit (0) ;
}
/*________________________________________________________________________
*/
void usage () {
	int j ;
	fprintf (stderr, "Usage : %s <options> <parameters>\n", progname) ;
	fprintf (stderr, "Estimate processing efficiency.\n") ;
    fprintf (stderr, "\n") ;
    fprintf (stderr, " basic parameters:\n") ;
    fprintf (stderr, "\n") ;
	fprintf (stderr, " -C Hz     consider given Hz as system clock\n") ;
	fprintf (stderr, " -d N      spawn N test sets as processes\n") ;
	fprintf (stderr, " -R N      repeat each test N times\n") ;
	fprintf (stderr, " -s set    file or string with tests (1) to run\n") ;
	fprintf (stderr, " -t N      spawn N test sets as threads\n") ;
    fprintf (stderr, "\n") ;
    fprintf (stderr, " detail selection:\n") ;
    fprintf (stderr, "\n") ;
    fprintf (stderr, " -D        show test description\n") ;
    fprintf (stderr, " -E        show elapsed time\n") ;
    fprintf (stderr, " -F        show test frequency (ops./sec)\n") ;
    fprintf (stderr, " -I        show test id\n") ;
    fprintf (stderr, " -N        show test/thread number (count)\n") ;
    fprintf (stderr, "\n") ;
    fprintf (stderr, " efficiency selection:\n") ;
    fprintf (stderr, "\n") ;
    fprintf (stderr, " -a        absolute(raw) efficiency\n") ;
    fprintf (stderr, " -c        combined(gross) efficiency\n") ;
    fprintf (stderr, " -r        relative(specific) efficiency\n") ;
    fprintf (stderr, "\n") ;
    fprintf (stderr, " test selection:\n") ;
    fprintf (stderr, "\n") ;
    fprintf (stderr, " -B        basic test\n") ;
    fprintf (stderr, " -Q        quick tests\n") ;
    fprintf (stderr, " -S        slow tests\n") ;
    fprintf (stderr, " -Z        whole test\n") ;
    fprintf (stderr, "\n") ;
    fprintf (stderr, " footer flags:\n") ;
    fprintf (stderr, "\n") ;
    fprintf (stderr, " -A        report averages\n") ;
    fprintf (stderr, " -T        report totals\n") ;
    fprintf (stderr, " -O text   one-liner comment\n") ;
    fprintf (stderr, "\n") ;
    fprintf (stderr, " output flags:\n") ;
    fprintf (stderr, "\n") ;
/* snout ... */
    fprintf (stderr, " --csv     output in CSV format\n") ;
    fprintf (stderr, " --frame   output in ASCII-characters framed boxes\n") ;
    fprintf (stderr, " --ansi    output in ANSI-line-chars. framed boxes\n") ;
    fprintf (stderr, " --html    output in HTML\n") ;
    fprintf (stderr, " --border  visible html table border\n") ;
/* snout ... */
    fprintf (stderr, " --dash    vertical separators\n") ;
    fprintf (stderr, " --minut   description minutiae\n") ;
    fprintf (stderr, "\n") ;
    fprintf (stderr, " operation flags:\n") ;
    fprintf (stderr, "\n") ;
    fprintf (stderr, " -h        show host info\n") ;
    fprintf (stderr, " -H        print headers\n") ;
    fprintf (stderr, " -i        set session id (processes)\n") ;
    fprintf (stderr, " -j        join threads until completion\n") ;
    fprintf (stderr, " -l path   master log file\n") ;
    fprintf (stderr, " -L        full(long) detail report\n") ;
    fprintf (stderr, " -n        use nanosecond precision (if available)\n") ;
    fprintf (stderr, " -o secs   timeout (per test)\n") ;
    fprintf (stderr, " -V        show version info and exit\n") ;
    fprintf (stderr, " -v        verbose output\n") ;
    fprintf (stderr, " -w        wait threads until completion (default)\n") ;
    fprintf (stderr, " -Y        run each test (2) as a thread\n") ;
    fprintf (stderr, " --demo    quick check (3)\n") ;
    fprintf (stderr, "\n") ;
    fprintf (stderr, " notes:\n") ;
    fprintf (stderr, "\n") ;
    fprintf (stderr, " (1) space- , tab- , or comma-separated list of test numbers\n") ;
    fprintf (stderr, "    and/or ranges like first:last\n") ;
    fprintf (stderr, " (2) valid only for 'thread-able/-safe' tests\n") ;
    fprintf (stderr, " (3) '-s' , '--demo' and '$SWETSET' are mutually exclusive\n") ;
#ifdef NOTSURE
    fprintf (stderr, "(*) '-Y' and '-t N' are mutually exclusive\n") ;
#endif
    fprintf (stderr, "\n") ;
	fflush (stderr) ;
	if ( verboseflag ) {
    	fprintf (stderr, " available tests:\n") ;
    	fprintf (stderr, "\n") ;
		for ( j = 0 ; swetsuite[j].sc_func != NULL ; ++j ) {
			if ( testmask != 0x00 ) {
				if ( ( swetsuite[j].sc_flag & testmask ) == 0x00 ) {
					continue ;
				}
			}
			if ( idflag )
				fprintf (stderr, "%d ", swetsuite[j].sc_name) ;
			if ( descflag )
				fprintf (stderr, "%s ", fmtdesc (&swetsuite[j])) ;
			fprintf (stderr, "%s", "\n") ;
		}
    	fprintf (stderr, "\n") ;
		fflush (stderr) ;
	}
	exit (1) ;
}
/*________________________________________________________________________
*/
# define	TRUE 	1
# define	FALSE 	0
# define	NUL 	'\0'
# define	COLON 	':'
# define	COMMA 	','
# define	MINUS 	'-'
int	parselist (txtbuf, numbuf, maxent, maxdig, minval, maxval)
	char *	txtbuf ;
	int *	numbuf ;
	int		maxent ;
	int		maxdig ;
	int		minval ;
	int		maxval ;
{
	register char * txtptr = txtbuf ;
	register int * setptr = numbuf ;
	register int numdig = 0 ;
	register int i ;
	register int inno = FALSE ;
	register int colon = FALSE ;
	register int comma = FALSE ;
	register int negno = FALSE ;
	register int tmpval ;
			char tmpbuf[20] ;

	for ( ; ; txtptr++ ) {
		if (isdigit ((int)(*txtptr))) {
			tmpbuf[numdig++] = *txtptr ;
			if (inno) {
				if (numdig > maxdig) {
					return (-1) ;
				}
			} else {
				inno = TRUE ;
			}
			if (comma) {
				comma = FALSE ;
			}
		} else if ( isspace ((int)(*txtptr)) || *txtptr == NUL || *txtptr == COMMA || *txtptr == COLON ) {
			if (inno) {
				tmpbuf[numdig] = NUL ;
				tmpval = atoi (tmpbuf) ;
				if (negno) {
					tmpval = -tmpval ;
					negno = FALSE ;
				}
				if (colon) {
					for ( i = *(setptr-1) + 1 ; i < tmpval ; i++ ) {
						if (setptr - numbuf == maxent) {
							return (-4) ;
						}
						if (i < minval || i > maxval) {
							return (-8) ;
						}
						*setptr++ = i ;
					}
					colon = FALSE ;
				}
				if (setptr - numbuf == maxent) {
					return (-4) ;
				}
				if (tmpval < minval || tmpval > maxval) {
					return (-8) ;
				}
				*setptr++ = tmpval ;
				numdig = 0 ;
				inno = FALSE ;
			} else {
				if ( isspace ((int)*txtptr) ) {
					continue ;
				}
			}
			if (*txtptr == COMMA) {
				if (comma || colon || negno || setptr == numbuf) {
					return (-2) ;
				}
				comma = TRUE ;
			}
			if (*txtptr == COLON) {
				if (comma || colon || negno || setptr == numbuf) {
					return (-2) ;
				}
				colon = TRUE ;
			}
			if (*txtptr == NUL) {
				if (comma || colon || negno || setptr == numbuf) {
					return (-2) ;
				}
				break ;
			}
		} else if (*txtptr == MINUS) {
			if (inno || negno) {
				return (-2) ;
			}
			if (comma) {
				comma = FALSE ;
			}
			negno = TRUE ;
		} else {
			return (-2) ;
		}
	}
	return (setptr - numbuf) ;
}
/*________________________________________________________________________
*/
int parsefile (name) char * name ; {
	FILE * fp ;
	char tmpbuf [256] ;
	fp = fopen (name, "r") ;
	if ( fp == NULL ) {
		return -1 ;
	}
	bigbuf[0] = '\0' ;
	while ( NULL != fgets ( tmpbuf , 256 , fp ) ) {
		if ( *tmpbuf == '#' ) {
			continue ;
		}
		strcat ( bigbuf , tmpbuf ) ;
	}
	fclose (fp) ;
	return parselist (bigbuf, swetset, SETWID, NUMWID, MINSET, MAXSET) ;
}
/*________________________________________________________________________
*/
void tabinit () {	/* fill rand tables */
	register int ri ;
	for ( ri = 0 ; ri < 1000000 ; ++ri ) {
		drandtab [ri] = drand (RANONE) ;
		drangtab [ri] = ( drandtab [ri] ) * ( 2.0 * PILD ) /* drand (RANGLE) */ ;
		dranbtab [ri] = drand (RANBIG) ;
# ifdef _HAS_LONGDOUBLE_
#	ifdef _HAS_POWL_
		if ( fastflag ) {
			ldrandtab [ri] = drandtab [ri] ;
			ldrangtab [ri] = drangtab [ri] ;
			ldranbtab [ri] = dranbtab [ri] ;
		} else {
			ldrandtab [ri] = ldrand (RANONE) ;
			ldrangtab [ri] = ( ldrandtab [ri] ) * ( 2.0 * PILD ) /* ldrand (RANGLE) */ ;
			ldranbtab [ri] = ldrand (RANBIG) ;
		}
#	else
		ldrandtab [ri] = drandtab [ri] ;
		ldrangtab [ri] = drangtab [ri] ;
		ldranbtab [ri] = dranbtab [ri] ;
#	endif
# endif /* _HAS_LONGDOUBLE_ */
	}
}
/*________________________________________________________________________
*/
void loginit () {
	FILE * lfp ;
	lfp = fopen ( logfilnambuf , "w" ) ;
	if ( lfp == NULL ) {
		fprintf (stderr, "** failed to create log file '%s'\n", logfilnambuf) ;
	} else {
		logfp = lfp ;
	}
}
/*________________________________________________________________________
*/
void versinit () {							/*	compilation environment	*/
	strcpy ( versno , SWVERS ) ;
	if ( *forgid != '$' ) {
		strcat ( versno , SWFORG) ;
	}
	fprintf (logfp, "%s %s ", SWNAME, versno) ;
	fprintf (logfp, "%s %s %s ", CPUMODEL, OSBRAND, OSVERS) ;
	fprintf (logfp, "%s\n", SWDATE) ;
}
/*________________________________________________________________________
*/
void swetinit () {
	int rd = 0 ;
	char * tp ;
	logfp = stdout ;
	if ( sysclock == 0 ) {
		sysclock = getcpufhz () ;
	}
	if ( logflag ) {
		loginit () ;
	}
	if ( demoflag ) {
		if ( setflag || basicflag || wholeflag ) {
			usage () ;
		}
		demoset = strdup (DEMOTSET) ;
		tempset = strdup ( demoset ) ;
		++setflag ;
		++verboseflag ;
		++averageflag ;
		++totalflag ;
		++headerflag ;
		++nanoflag ;
		++inspectflag ;
		sno_setflag (SNO_FRAME) ;
		++fastflag ;
		if ( sysclock > 0 ) {
			++relflag ;
		}
	}
	if ( versionflag ) {
		showversion () ;
	} else {
		if ( verboseflag ) {
			versinit () ;
		}
	}
	if ( basicflag ) {
		++quickflag ;
		++headerflag ;
		++averageflag ;
		++nanoflag ;
		++verboseflag ;
		++fullflag ;
	}
	if ( quickflag ) {
		testmask |= X_FAST ;
	}
	if ( slowflag ) {
		testmask |= X_SLOW ;
	}
	if ( helpflag ) {
		if ( ! ( idflag || descflag ) ) {
			++idflag ;
			++descflag ;
		}
		usage () ;
	}
	if ( repeatflag ) {
		if ( maxrepeat <= 0 ) {
			maxrepeat = 1 ;
			repeatflag = 0 ;
		}
	}
	if ( wholeflag ) {
		++fullflag ;
		++headerflag ;
		++totalflag ;
		++averageflag ;
		++nanoflag ;
		verboseflag = 9 ;
	}
	if ( fullflag ) {
		++idflag ;
		++descflag ;
		++elapsedflag ;
		++freqflag ;
		/* ++numberflag ; */
		++rawflag ;
		++minutflag ;
		if ( sysclock > 0 ) {
			++relflag ;
			++comflag ;
		}
	}
	if ( ! descflag ) {
		++defaultflag ;
	}
	if ( defaultflag ) {
		++descflag ;
		++elapsedflag ;
		++rawflag ;
	}
	if ( sno_qryflag ( SNO_ANSI | SNO_BORDER | SNO_CSV | SNO_FRAME | SNO_HTML ) ) {
		++snoutflag ;
	}
	if ( snoutflag ) {
		dashflag = 0 ;
	}
	if ( daemonflag ) {
		if ( maxdaemon < 0 || maxdaemon > MAXDAEMON ) {
			usage () ;
		}
	}
	if ( ropeflag ) {
		if ( maxthread < 0 || maxthread > MAXROPE ) {
			usage () ;
		}
	}
	if ( percentflag ) {
		if ( argpercent < 1 || argpercent > 100 ) {
			usage () ;
		}
		cpuhogpct = argpercent ;
	}
	if ( secondflag ) {
		if ( argseconds < 1 || argseconds > 3600 ) {
			usage () ;
		}
		maxcpuhogsec = argseconds ;
	}
#ifdef NOTSURE
	if ( yarnflag && ropeflag ) {
		usage () ;
	}
#endif
	if ( yarnflag || ropeflag ) {
		++threadflag ;
	}
	if ( threadflag ) {
		testmask |= X_THRD ;
	}
	if ( yarnflag ) {
		if ( ! ( pollflag || joinflag ) ) {
			++pollflag ;
		}
	}
	if ( ropeflag ) {
		if ( ! ( pollflag || joinflag ) ) {
			++joinflag ;
		}
	}
	tp = getenv (SWETESET) ;
	if ( tp != NULL ) {
		if ( setflag || demoflag ) {
			usage () ;
		}
		tempset = strdup ( tp ) ;
		++setflag ;
	}
	if ( setflag ) {
		if ( isdigit ( (int) (*tempset) ) ) {
			rd = parselist (tempset, swetset, SETWID, NUMWID, MINSET, MAXSET) ;
		} else {
			rd = parsefile (tempset) ;
		}
		if ( rd <= 0 ) {
			usage () ;
		}
		setlength = rd ;
	}
	if ( alarmflag ) {
		if ( alarmsecs < 1 || alarmsecs > 3600 ) {
			usage () ;
		}
	}
	bigbuf[0] = '\0' ;
	tabinit () ;
	if ( snoutflag ) {
		sno_init (logfp) ;
	}
}
/*________________________________________________________________________
*/
void swet () {
	swetinit () ;
	swetdoit () ;
	swetquit () ;
}
/*______________________________________________________________________*/

int main (argc, argv) int argc ; char * *  argv ; {
    if (--argc) {
        while (*++argv) {
            if ( strcmp (*argv, "-?") == 0 ) {
				++helpflag ;
            } else if ( strcmp (*argv, "-A") == 0 ) {
				++averageflag ;
            } else if ( strcmp (*argv, "-a") == 0 ) {
				++rawflag ;
            } else if ( strcmp (*argv, "-B") == 0 ) {
				++basicflag ;
            } else if ( strcmp (*argv, "-C") == 0 ) {
				sscanf ( *++argv , "%lld" , &sysclock ) ;
            } else if ( strcmp (*argv, "-c") == 0 ) {
				++comflag ;
            } else if ( strcmp (*argv, "-D") == 0 ) {
				++descflag ;
            } else if ( strcmp (*argv, "-d") == 0 ) {
				sscanf ( *++argv , "%d" , &maxdaemon ) ;
				++daemonflag ;
            } else if ( strcmp (*argv, "-E") == 0 ) {
				++elapsedflag ;
            } else if ( strcmp (*argv, "-F") == 0 ) {
				++freqflag ;
            } else if ( strcmp (*argv, "-h") == 0 ) {
				++inspectflag ;
            } else if ( strcmp (*argv, "-H") == 0 ) {
				++headerflag ;
            } else if ( strcmp (*argv, "-I") == 0 ) {
				++idflag ;
            } else if ( strcmp (*argv, "-i") == 0 ) {
				++sessidflag ;
            } else if ( strcmp (*argv, "-j") == 0 ) {
				++joinflag ;
            } else if ( strcmp (*argv, "-l") == 0 ) {
				++logflag ;
				strncpy ( logfilnambuf , *++argv , LOGNAMSIZ ) ;
            } else if ( strcmp (*argv, "-L") == 0 ) {
				++fullflag ;
            } else if ( strcmp (*argv, "-m") == 0 ) {
				sscanf ( *++argv , "%d" , &argseconds ) ;
				++secondflag ;
            } else if ( strcmp (*argv, "-N") == 0 ) {
				++numberflag ;
            } else if ( strcmp (*argv, "-n") == 0 ) {
				++nanoflag ;
            } else if ( strcmp (*argv, "-o") == 0 ) {
				++alarmflag ;
				sscanf ( *++argv , "%d" , &alarmsecs ) ;
            } else if ( strcmp (*argv, "-O") == 0 ) {
				++obsflag ;
				strncpy ( obsbuf , *++argv , OBSBUFSIZ ) ;
            } else if ( strcmp (*argv, "-P") == 0 ) {
				++procgrpflag ;
            } else if ( strcmp (*argv, "-p") == 0 ) {
				sscanf ( *++argv , "%d" , &argpercent ) ;
				++percentflag ;
            } else if ( strcmp (*argv, "-Q") == 0 ) {
				++quickflag ;
            } else if ( strcmp (*argv, "-R") == 0 ) {
				sscanf ( *++argv , "%d" , &maxrepeat ) ;
				++repeatflag ;
            } else if ( strcmp (*argv, "-r") == 0 ) {
				++relflag ;
            } else if ( strcmp (*argv, "-S") == 0 ) {
				++slowflag ;
            } else if ( strcmp (*argv, "-s") == 0 ) {
				++setflag ;
				tempset = strdup ( *++argv ) ;
            } else if ( strcmp (*argv, "-T") == 0 ) {
				++totalflag ;
            } else if ( strcmp (*argv, "-t") == 0 ) {
				sscanf ( *++argv , "%d" , &maxthread ) ;
				++ropeflag ;
            } else if ( strcmp (*argv, "-V") == 0 ) {
				++versionflag ;
            } else if ( strcmp (*argv, "-v") == 0 ) {
				++verboseflag ;
            } else if ( strcmp (*argv, "-W") == 0 ) {
				++waitflag ;
            } else if ( strcmp (*argv, "-w") == 0 ) {
				++pollflag ;
            } else if ( strcmp (*argv, "-X") == 0 ) {
				++betaflag ;
            } else if ( strcmp (*argv, "-Y") == 0 ) {
				++yarnflag ;
            } else if ( strcmp (*argv, "-Z") == 0 ) {
				++wholeflag ;
            } else if ( strcmp (*argv, "--dash") == 0 ) {
				++dashflag ;
            } else if ( strcmp (*argv, "--demo") == 0 ) {
				++demoflag ;
            } else if ( strcmp (*argv, "--fast") == 0 ) {
				++fastflag ;
            } else if ( strcmp (*argv, "--minut") == 0 ) {
				++minutflag ;
/* snout ... */
            } else if ( strcmp (*argv, "--ansi") == 0 ) {
				sno_setflag (SNO_ANSI) ;
            } else if ( strcmp (*argv, "--border") == 0 ) {
				sno_setflag (SNO_BORDER) ;
            } else if ( strcmp (*argv, "--csv") == 0 ) {
				sno_setflag (SNO_CSV) ;
            } else if ( strcmp (*argv, "--frame") == 0 ) {
				sno_setflag (SNO_FRAME) ;
            } else if ( strcmp (*argv, "--html") == 0 ) {
				sno_setflag (SNO_HTML) ;
/* snout ... */
			} else {
				++helpflag ;
            }
		} /* eow(argv) */
	} else {
		++defaultflag ;
	}
	swet () ;
	return 0 ;
}
/*________________________________________________________________________
*/

#ifdef TRIG

#include <math.h>
#include <stdio.h>
main () {
	float arc = 0.0 ;
	float num = 0.0 ;
	float tot = 0.0 ;
	float fpi = 3.14159265358979323846264338327950288 ;
	float dpi = 0.0 ;
	float inc = 0.0 ;

	printf ("t?") ;
	scanf ("%lf", &tot) ;
	for	(
			num = 0.0 , dpi = 2.0 * fpi , inc = dpi / tot ;
			num < tot ;
			num += 1.0
		)
	{
		arc = num * inc ;
		printf ("%f %f %f\n", num, arc, (float)sin(arc)) ;
	}
}

#endif

/*________________________________________________________________________
*/

/*
 * vi:nu ts=4
 */
