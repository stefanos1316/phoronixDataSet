
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
 *                   |   grand            generic random number stuff   |
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

# include "grand.h"

# ifdef CMWC

#include <stdint.h>
 
#define PHI 0x9e3779b9
 
static uint32_t Q[4096], c = 362436;
 
void init_rand(uint32_t x) {
        int i;
 
        Q[0] = x;
        Q[1] = x + PHI;
        Q[2] = x + PHI + PHI;
 
        for (i = 3; i < 4096; i++)
                Q[i] = Q[i - 3] ^ Q[i - 2] ^ PHI ^ i;
}
 
uint32_t rand_cmwc(void) {
        uint64_t t, a = 18782LL;
        static uint32_t i = 4095;
        uint32_t x, r = 0xfffffffe;
        i = (i + 1) & 4095;
        t = a * Q[i] + c;
        c = (t >> 32);
        x = t + c;
        if (x < c) {
                x++;
                c++;
        }
        return (Q[i] = r - x);
}

# endif /* CMWC */

/*	__	__	__	__	__	__	__	__	*/

# include <math.h>
# include <time.h>
# include <stdlib.h>

static int firmflag = 1 ;
static int fastflag = 1 ;

# define	B32RNDMAX		0x7fffffff

static int ovum = 0x5f3759df ;

int mlcrng (seedp) int * seedp ; {	/* Multiplicative Linear Congruential Random Number Generator */
	register int hi, lo ;

	hi = (*seedp) / 127773 ; lo = (*seedp) % 127773 ;
	*seedp = 16807 * lo - 2836 * hi ;
	if ((*seedp) <= 0)
		*seedp += B32RNDMAX ;
	return (*seedp) ;
}

int bsdrng (seedp) int * seedp ; {	/* BSD randz... */
	*seedp = (*seedp) * 1103515245 + 12345 ;
	return (*seedp) % ((unsigned int)B32RNDMAX + 1) ;
}

int grand (seedp) int * seedp ; {
	if ( firmflag )
		if ( fastflag )
			return bsdrng (seedp) ;
		else
			return mlcrng (seedp) ;
	else
		return rand_r ( (unsigned int *) seedp ) ;
}

void flingsow (germ) int germ ; {
	if ( firmflag )
		ovum = germ ;
	else
		srand (germ) ;
}

int rolldice () {

	return (int) time (0L) ;
}

float frand (flag) int flag ; {
	int r ;
	float f ;

	r = grand (&ovum) ;
	f = (float) ( r % 1000000 ) / (float) 1000000.0 ;
	if ( flag & RANONE ) {
		return f ;
	}
	if ( flag & RANGLE ) {
		return f * (float) ( 2.0 * GRPI ) ;
	}
	if ( flag & RANBIG ) {
		return f * powf ( (float) 10.0 , (float) ( (r & 0x01) ? -1.0 : 1.0 ) * ( (float) ( r % 37 ) ) ) ;
	}
	return f ;
}

double drand (flag) int flag ; {
	int r ;
	double d ;

	r = grand (&ovum) ;
	d = (double) ( r % 1000000000L ) / (double) 1000000000.0 ;
	if ( flag & RANONE ) {
		return d ;
	}
	if ( flag & RANGLE ) {
		return d * (double) ( 2.0 * GRPI ) ;
	}
	if ( flag & RANBIG ) {
		return d * pow ( (double) 10.0 , (double) ( (r & 0x01) ? 1.0 : -1.0 ) * ( (double) ( r % 307 ) ) ) ;
	}
	return d ;
}

# ifdef _HAS_LONGDOUBLE_

# ifndef _HAS_POWL_

long double powl ( b , e ) long double b , e ; {

	long long exp = (long long) e ;
	long double res = 1.0 ;

	if ( exp == 0LL ) {
		return res ;
	}
	if ( exp == 1LL ) {
		return b ;
	}
	if ( exp < 0LL ) {
		b = 1.0 / b ;
		exp = -exp ;
	}
	while (exp) {
		if (exp & 1) {
			res *= b ;
		}
		exp >>= 1 ;
		b *= b ;
	}
	return res ;
}

# endif /* ! _HAS_POWL_ */

long double ldrand (flag) int flag ; {
	long long r , s ;
	long double d ;

	r = (long long) grand (&ovum) ;
	s = (r & 0x01) ;
	r *= (long long) grand (&ovum) ;
	d = (long double) ( r % 1000000000000000000LL ) / (long double) 1000000000000000000.0 ;
	if ( flag & RANONE ) {
		return d ;
	}
	if ( flag & RANGLE ) {
		return d * (long double) ( 2.0 * GRPI ) ;
	}
	if ( flag & RANBIG ) {
		return d * powl ( (long double) 10.0 , (long double) ( s ? 1.0 : -1.0 ) * ( (long double) ( r % 3007 ) ) ) ;
	}
	return d ;
}
# endif /* _HAS_LONGDOUBLE_ */

/*	__	__	__	__	__	__	__	__	*/

# ifdef GRANDEMO

# include <stdio.h>

main (argc, argv) char * * argv ; {
	int i ;
	int m ;
	int r ;
	float fz ;
	float fb ;
	float fa ;
	double dz ;
	double db ;
	double da ;
# ifdef _HAS_LONGDOUBLE_
	long double ldz ;
	long double ldb ;
	long double lda ;
# endif /* _HAS_LONGDOUBLE_ */
	double dr48 ;
	srand48 ( (long int) ( GRPI * 1000000000.0 ) ) ;
	if ( argc == 1 )
		m = 10 ;
	else
		m = atoi ( *++argv ) ;
	for ( i = 0 ; i < m ; ++i ) {
		r = grand (&ovum) ;
		fz = frand (RANONE) ;
		fb = frand (RANBIG) ;
		fa = frand (RANGLE) ;
		dz = drand (RANONE) ;
		db = drand (RANBIG) ;
		da = drand (RANGLE) ;
# ifdef _HAS_LONGDOUBLE_
		ldz = ldrand (RANONE) ;
		ldb = ldrand (RANBIG) ;
		lda = ldrand (RANGLE) ;
# endif /* _HAS_LONGDOUBLE_ */
		dr48 = drand48 () ;
		printf ( "%12ld %.6f %.9F %.6f %.9F %.15F %e %E " , (long) r , fz , dz , fa , da , dr48 , fb , db ) ;
		printf ( "\n" ) ;
		printf ( "\n" ) ;
		printf ( "%.9F %.9F %E %E %.9F %E " , sin(da), tan(da), sqrt(db), cbrt(db), log(db), exp(da) ) ;
		printf ( "\n" ) ;
		printf ( "\n" ) ;
# ifdef _HAS_LONGDOUBLE_
		printf ( "%.18LF %.18LF %LE " , ldz , lda , ldb ) ;
		printf ( "\n" ) ;
		printf ( "\n" ) ;
# endif /* _HAS_LONGDOUBLE_ */
	}
}

/*
   158164524 0.164524 0.158164524 1.033735 0.993777013 0 0.290079095707373 1.645240e+31 1.581645E+272
   180230389 0.230389 0.180230389 1.447577 1.132420932 1 0.591660206762270 2.303890e-23 1.802304E-207
    17397386 0.397386 0.017397386 2.496850 0.109311000 0 0.023004086260823 3.973860e+22 1.739739E+01
   199341307 0.341307 0.199341307 2.144495 1.252498371 1 0.765024974799367 3.413070e-34 1.993413E-68
   157333784 0.333784 0.157333784 2.097227 0.988557320 0 0.671383498830512 3.337840e+15 1.573338E+274
   925126513 0.126513 0.925126513 0.794905 5.812741314 1 0.470632540745996 1.265130e-11 9.251265E-127
   756052310 0.052310 0.756052310 0.328673 4.750416766 0 0.123869021559894 5.231000e+06 7.560523E+32
   822912471 0.912471 0.822912471 5.733224 5.170511547 1 0.925536769017604 9.124710e-23 8.229125E-200
   406081220 0.081220 0.406081220 0.510320 2.551483555 0 0.429517410454000 8.122000e+02 4.060812E+39
  1843229101 0.229101 0.843229101 1.439484 5.298164698 1 0.276268161193684 2.291010e-28 8.432291E-181
*/

# endif /* GRANDEMO */

/*	__	__	__	__	__	__	__	__	*/

/*
 * vi:nu
 */
