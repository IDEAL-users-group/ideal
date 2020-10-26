# Makefile for ideal/idfilt 1.3 (UKC) 13/2/89

# BINDIR is innherited from the parent makefile.

ALL = pfilt tfilt

all: $(ALL)

install: all
	../install-file $(BINDIR)/pfilt a+rx,a-w pfilt 
	../install-file $(BINDIR)/tfilt a+rx,a-w tfilt 

clean:
	rm -f $(ALL) *.o

idfilt.o	:idfilt.c idfilt.h

4014.o	:4014.c idfilt.h

4filt	:idfilt.o 4014.o
	cc -o 4filt 4014.o idfilt.o -l4014 -lm

pout.o	:pout.c

pfilt	:idfilt.o pout.o
	cc -o pfilt pout.o idfilt.o -lplot -lm

202.o	:202.c idfilt.h

canon.o	:canon.c idfilt.h

tfilt	:idfilt.o canon.o
	cc -o tfilt canon.o idfilt.o

aps.o	:aps.c

apsfilt	:aps.o idfilt.o
	cc -o apsfilt aps.o idfilt.o

idsort	:idsort.c
	cc -o idsort idsort.c
