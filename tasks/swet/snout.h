
# ifndef _SNOUT_H_
# define _SNOUT_H_

/*	__	__	__	__	__	__	__	__	__
*/

# include <stdio.h>
# include <string.h>
# include <unistd.h>

/*	__	__	__	__	__	__	__	__	__
*/

# define	SNO_ANSI		0x00000100
# define	SNO_BORDER		0x00000200
# define	SNO_CSV			0x00000400
# define	SNO_FRAME		0x00000800
# define	SNO_FREE		0x00001000
# define	SNO_HTML		0x00002000
# define	SNO_FLUSH		0x00004000

# define	SNO_STR		0x00010000
# define	SNO_INT		0x00020000
# define	SNO_BIG		0x00040000
# define	SNO_PCT		0x00080000
# define	SNO_UNT		0x00200000
# define	SNO_SOL		0x00400000
# define	SNO_EOL		0x00800000
# define	SNO_HEAD	0x01000000
# define	SNO_PLUS	0x02000000
# define	SNO_TAIL	0x04000000
# define	SNO_FOOT	SNO_TAIL
# define	SNO_ITEM	0x08000000
# define	SNO_BODY	SNO_ITEM

/*	__	__	__	__	__	__	__	__	__
*/

FILE *	sno_init () ;
void	sno_setflag () ;
int		sno_qryflag () ;

void	dodash () ;
void	dashestart () ;
void	dashesterm () ;

void	showinfo () ;

void	htmlhead () ;
void	htmlbody () ;
void	htmltail () ;

/*	__	__	__	__	__	__	__	__	__
*/

# endif /* _SNOUT_H_ */

/*
 * vi:nu ts=4
 */

