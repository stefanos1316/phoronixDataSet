CC=gcc
# std to gnu99 to support inline asm
CFLAGS=-O3 -march=native -Wall -Wextra -DSUPERCOP # -DHAVE_XOP # uncomment on XOP-enabled CPUs
FILES=bench.c

all: bench

bench: bench.c
	$(CC) $(FILES) $(CFLAGS) blake2s.c -o blake2

plot: bench
	./blake2s > blake2s.data

clean:
	rm -f blake2b blake2s md5 plotcycles.pdf blake2b.data blake2s.data md5.data
