
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

# ifndef _BUD_H_

# define _BUD_H_

# include	"abcs.h"

/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	*/

# if defined (LINUX)
#	define	ANYX
#	define	LINUX
#	define	USE_LINUX_FS
/*
#	define	USE_ASM_TIOS
*/
#	define	VPTRVOID
#	define	PROTOIOCTL
# endif

# if defined (CYGWIN)
#	define	ANYX
#	define	USE_CYGWIN_FS
/*
#	define	USE_SYS_TIOS
*/
#	define	PROTOIOCTL
# endif

# if defined (HPUX)
#	include <unistd.h>
#	include <stropts.h>
#	include <sys/scsi.h>
#	include <sys/diskio.h>
#	define	ANYX
#	include <sys/param.h>
#	include <sys/pstat.h>
/*
#	define	USE_TIOS
*/
#	define	USE_FCNTL
#	define	DEFMAXMIN
#	define	NO_STRSIGNAL
# endif

# if defined (SUNX)
#	define	SOLARIS
#	include <sys/ioctl.h>
#	include <sys/dkio.h>
#	include <sys/vtoc.h>
#	include <sys/systeminfo.h>
#	define	ANYX
#	include <sys/unistd.h>
/*
#	include <sys/types.h>
*/
#	include <sys/processor.h>
#	define	USE_FCNTL
#	define	NOLOG2
#	define	USE_DSKGEO	/* preferably */
#	if ( ( ! defined (USE_DSKGEO) ) && ( ! defined (USE_MEDINF) ) )
#		error "must define USE_{DSKGEO|MEDINF}"
#	endif /* ! def DKIODGMI */
# endif

# if defined (AIX)
#	include <sys/ioctl.h>
#	include <sys/devinfo.h>
#	include <sys/lvdd.h>
#	include <sys/systemcfg.h>
#	include <unistd.h>
#	define	ANYX
#	include <cf.h>
#	include <odmi.h>
#	include <sys/cfgodm.h>
#	include <sys/cfgdb.h>
#	define	USE_FCNTL
#	ifndef POWER_6
#		define POWER_6         0x4000          /* 6 class CPU */
#	endif
#	ifndef POWER_7
#		define POWER_7         0x8000          /* 7 class CPU */
#	endif
# endif

# if defined (FREEBSD)
#	include <sys/ioctl.h>
#	include <sys/disk.h>
#	define	ANYX
#	define	BSD
#	define	NOLOG2
# endif

# if defined (NETBSD)
#	include <sys/ioctl.h>
#	include <sys/disklabel.h>
#	include <sys/dkio.h>
#	define	ANYX
#	define	BSD
#	define	NOLOG2
# endif

# if defined (OPENBSD)
#	include <sys/ioctl.h>
#	include <sys/disklabel.h>
#	include <sys/dkio.h>
#	define	ANYX
#	define	BSD
#	define	NOLOG2
# endif

# if defined (APPLE)
#	include <stdint.h>
#	include <sys/ioctl.h>
#	include <sys/disk.h>
#	define	ANYX
# endif

/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	*/

# ifdef USE_FCNTL
#	include <fcntl.h>
# endif

# ifdef USE_TIOS
#	include <termios.h>
# endif

# ifdef USE_ASM_TIOS
#	include <asm/termios.h>
# endif

# ifdef USE_SYS_TIOS
#	include <sys/termios.h>
# endif

# ifdef USE_CYGWIN_FS
# include	<cygwin/fs.h>
# endif

# ifdef USE_LINUX_FS
# include	<linux/fs.h>
# endif

/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	*/

# ifdef		ANSI
#	define				ARGLST(X)	(X)
#	define				OF(X)	X
# else		/* OLD */
#	define				ARGLST(X)	()
#	define				OF(X)	()
# endif		/* ANSI */

/*
# ifndef ULONG
# define ULONG	unsigned long
# endif
*/

long long	bunitz	ARGLST ( char * ) ;

/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	*/

# ifdef		NEEDLESS
# include "logdmp.h"
# include "simio.h"
# include "xalloc.h"
/*
# include "objlst.h"
 */
# include "stdtyp.h"
# include "stdasc.h"
# include "stdmisc.h"
# include "stdtime.h"
# include "stdstr.h"
# include "stddir.h"
# endif

/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	*/

# ifdef		DEFMAXMIN
# ifndef	LLONG_MAX
# define	LLONG_MAX	9223372036854775807LL
# endif
# ifndef	LLONG_MIN
# define	LLONG_MIN	(-LLONG_MAX - 1LL)
# endif

# define	FLOAT_MAX	((float)3.40282346638528860e+38)
# define	FLOAT_MIN	((float)1.40129846432481707e-45)
# endif

# ifndef	DOUBLE_MAX
#	ifdef	DBL_MAX
#		define	DOUBLE_MAX	DBL_MAX
#	else
#		define	DOUBLE_MAX	1.79769313486231570e+308
#	endif
# endif

# ifndef	DOUBLE_MIN
#	ifdef	DBL_MIN
#		define	DOUBLE_MIN	DBL_MIN
#	else
#		define	DOUBLE_MIN	4.94065645841246544e-324
#	endif
# endif

#ifdef NOLOG2
# define log2(N) (log(N)/log(2)) /* log2(n) = ln(n)/ln(2) = log(n)/log(2) */
#endif

/*	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	__	*/

# endif /* ! _BUD_H_ */

/*
 *	vi:nu ts=4
 */
