
# ifndef _GRAND_H_

# define _GRAND_H_

# include "config.h"

# define	GRPI	3.14159265358979323846264338327950288

# define	RANONE		0x01
# define	RANBIG		0x02
# define	RANGLE		0x04

int grand () ;

float frand () ;

double drand () ;

# ifdef _HAS_LONGDOUBLE_
long double ldrand () ;
# endif /* _HAS_LONGDOUBLE_ */

# ifndef _HAS_POWF_
# define powf(a,b) ((float)pow(a,b))
# endif

# endif  /* _GRAND_H_ */
