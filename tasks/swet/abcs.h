
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

/*		 _______________________________________________________________
 *		|																|
 *		|	abcs.h					C compilation environment sniffer	|
 *		|_______________________________________________________________|
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

# ifndef _ABCS_H

# define _ABCS_H

/*___________________________________________________________________________*/

# if ( defined (__unix) || defined (__unix__) || defined (unix) )
#	define	UNIX
# endif /* __unix */

# if ( defined (__SVR4) || defined (__svr4__) )
#	define	SVR4
# endif /* __SVR4 */

/*___________________________________________________________________________*/

# if ( defined (linux) || defined (__linux) || defined (__linux__) )
#	define	LINUX
# endif /* linux */

/*___________________________________________________________________________*/

# if ( defined (__CYGWIN__) || defined (__CYGWIN32__) )
#	define	CYGWIN
# endif /* CYGWIN */

/*___________________________________________________________________________*/

# if ( defined (__hpux) || defined (__hppa) || defined (_HPUX_SOURCE) )
#	ifndef	HPUX
#		define	HPUX
#	endif
#	if defined (NOCONST)
#		if defined (__HP_cc)
#			if __HP_cc == 111108
#				define	const
#			endif
#		endif
#	endif
# endif /* __hpux */

# if ( defined (__hppa) )
#	define	HPPA
# endif /* __hppa */

# if ( defined (__ia64) )
#	define	IA64
# endif /* __ia64 */

/*___________________________________________________________________________*/

# if ( defined (sun) || defined (sparc) || defined (__sun) || defined (__sparc) || defined (__sun__) || defined (__sparc__) )
#	define	SUNX
# endif /* SUNX */

/*___________________________________________________________________________*/

# if ( defined (__FreeBSD__) )
#	define	FREEBSD
# endif /* __FreeBSD__ */

/*___________________________________________________________________________*/

# if ( defined (__OpenBSD__) )
#	define	OPENBSD
# endif /* __OpenBSD__ */

/*___________________________________________________________________________*/

# if ( defined  (__NetBSD__) )
#	define	NETBSD
# endif /* __NetBSD__ */

/*___________________________________________________________________________*/

# if ( defined (__APPLE__) )
#	define	APPLE
# endif /* __APPLE__ */

/*___________________________________________________________________________*/

# if ( defined (_aix) )
#	define	AIX
# endif /* _aix */

#ifdef USE_AIX_DIR_SIZ
# include <sys/dir.h>
# if ( defined (AIX_DIRSIZ) )
#  define	AIX
# endif /* _aix */
#endif /* USE_AIX_DIR_SIZ */

# include <unistd.h>
# if ( defined (_CS_AIX_ARCHITECTURE) )
#	define	AIX
# endif /* _aix */

/*___________________________________________________________________________*/

# endif /* _ABCS_H */

/*
 * vi:nu ts=4
 */
