CC=cc

#
#           |          _                     _______________________
#           |\       _/ \_                  |                       |
#           | \_    /_    \_                |    Alexandre Botao    |
#           \   \__/  \__   \               |     www.botao.org     |
#            \_    \__/  \_  \              |    55-11-8244-UNIX    |
#              \_   _/     \ |              |  alexandre@botao.org  |
#                \_/        \|              |_______________________|
#                            |
#

#   ______________________________________________________________________
#  |                                                                      |
#  |  This (Makefile) code is part of 'SWET' by <botao.org> ;             |
#  |                                                                      |
#  |  This code is free software: you can redistribute it and/or modify   |
#  |  it under the terms of the GNU General Public License as published   |
#  |  by the Free Software Foundation, either version 3 of the License,   |
#  |  or (at your option) any later version.                              |
#  |                                                                      |
#  |  This code is distributed in the hope that it will be useful,        |
#  |  but WITHOUT ANY WARRANTY; without even the implied warranty of      |
#  |  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.                |
#  |  See the GNU General Public License for more details.                |
#  |                                                                      |
#  |  You should have received a copy of the GNU General Public License   |
#  |  along with this code.  If not, see <http://www.gnu.org/licenses/>,  |
#  |  or write to the Free Software Foundation, Inc.,                     |
#  |  59 Temple Place, Suite 330, Boston, MA  02111-1307  USA.            |
#  |______________________________________________________________________|
#

BAC	=	swet
INC	=	abcs.h bud.h grand.h snout.h swet.h zest.h
SUP	=	grand.c snout.c zest.c
SRC	=	$(BAC).c $(SUP)

EXTFLG	=	-DSTRIVE
MINFLG	=	$(EXTFLG) $(XCFLAG)
GNUFLG	=	-Wall -Wextra -D_GNU_SOURCE
CURSES	=	`cat curses.ld`
LIBRT	=	`cat rt.ld`
SUPLIB	=	$(CURSES) $(LIBRT)
LIBFLG	=	-lm -lpthread $(SUPLIB)

LNXFLG	=	$(GNUFLG)
AIXFLG	=	-lodm -lcfg -Wl,-bmaxdata:0x80000000 -Wl,-blibpath:/opt/freeware/lib:/usr/lib:/lib

BACLOG	=	make_$(BAC).log
TSTLOG	=	make_test.log

$(BAC):	$(BAC).c $(SUP) $(INC)
	@make compile_`uname` 2>&1 | tee $(BACLOG)

bare:	$(BAC).c $(SUP)
	@make EXTFLG=

compile_AIX:
	$(CC) $(MINFLG) -o $(BAC) $(SRC) $(LIBFLG) $(AIXFLG)

compile_AIX_alt:
	$(CC) $(MINFLG) -o $(BAC) $(SRC) $(LIBFLG) -Wl,-bmaxdata:0x80000000

compile_CYGWIN_NT-5.1:
	$(CC) $(MINFLG) $(GNUFLG) -o $(BAC) $(SRC) $(LIBFLG)

compile_CYGWIN_NT-6.1:
	$(CC) $(MINFLG) $(GNUFLG) -o $(BAC) $(SRC) $(LIBFLG)

compile_FreeBSD:
	$(CC) $(MINFLG) $(GNUFLG) -o $(BAC) $(SRC) $(LIBFLG)

compile_NetBSD:
	$(CC) -D_GNU_SOURCE $(MINFLG) -o $(BAC) $(SRC) $(LIBFLG)

compile_OpenBSD:
	$(CC) -D_GNU_SOURCE $(MINFLG) -o $(BAC) $(SRC) $(LIBFLG)

compile_HP-UX:
	$(CC) -D_REENTRANT -I/usr/local/include $(MINFLG) -o $(BAC) $(SRC) -L/usr/local/lib -L/usr/local/lib/hpux32 $(LIBFLG)

compile_HP-UX_gnu:
	$(CC) -I/usr/local/include $(MINFLG) -o $(BAC) $(SRC) -L/usr/local/lib -L/usr/local/lib/hpux32 $(LIBFLG)

compile_HP-UX_alt:
	$(CC) $(MINFLG) -o $(BAC) $(SRC) $(LIBFLG)

compile_Linux:
	$(CC) $(LNXFLG) $(MINFLG) -o $(BAC) $(SRC) $(LIBFLG)

compile_SunOS:
	$(CC) $(MINFLG) -o $(BAC) $(SRC) $(LIBFLG)

test check demo:$(BAC)
#	@./$(BAC) -v -s mini.set -A -T -H -n --frame --fast 2>&1 | tee $(TSTLOG)
	@./$(BAC) --demo 2>&1 | tee $(TSTLOG)

basictest basiccheck:$(BAC)
	@./$(BAC) -v -B -T

bigtest bigcheck: $(BAC)
	./$(BAC) -v -Z

minitest minicheck: $(BAC)
	./$(BAC) -v -s mini.set
	./$(BAC) -v -s mini.set -A --csv
	./$(BAC) -v -s mini.set -T -H --frame
	./$(BAC) -v -s mini.set -L -A -T -H -n --ansi

fulltest fullcheck: $(BAC)
	./$(BAC) -v -Z -d 2
	./$(BAC) -v -Z -t 2

install: $(BAC)
	chmod 755 $(BAC)
	chmod 644 $(BAC).1
	[ -d /usr/local/bin ] || mkdir -p /usr/local/bin
	[ -d /usr/share/man/man1 ] || mkdir -p /usr/share/man/man1
	make install_`uname`

install_AIX:
	cp $(BAC) /usr/local/bin
	ls -l /usr/local/bin/$(BAC)
	cp $(BAC).1 /usr/share/man/man1
	ls -l /usr/share/man/man1/$(BAC).1

install_HP-UX:
	cp $(BAC) /usr/local/bin
	strip /usr/local/bin/$(BAC)
	ls -l /usr/local/bin/$(BAC)
	cp $(BAC).1 /usr/share/man/man1
	chmod a+r /usr/share/man/man1/$(BAC).1
	ls -l /usr/share/man/man1/$(BAC).1

install_Linux:
	cp $(BAC) /usr/local/bin
	ls -l /usr/local/bin/$(BAC)
	cp $(BAC).1 /usr/share/man/man1
	ls -l /usr/share/man/man1/$(BAC).1

install_SunOS:
	cp $(BAC) /usr/local/bin
	ls -l /usr/local/bin/$(BAC)
	cp $(BAC).1 /usr/local/share/man/man1
	ls -l /usr/local/share/man/man1/$(BAC).1

clean:
	rm -f *.o *.exe *.stackdump swet swet*.log /tmp/swet*.log make_*.log

unconf:
	@make clean
	rm -f Makefile config.h

# vi:nu ts=8
