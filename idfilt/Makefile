# Makefile for ideal/idfilt 1.3 (UKC) 13/2/89

# LIBDIR is innherited from parent makefile, usually /usr/lib/ideal

ALL = 4filt pfilt tfilt

all: $(ALL)

install: all
	-mkdir $(LIBDIR)/idfilt
	install -s 4filt $(LIBDIR)/idfilt/4filt
	install -s pfilt $(LIBDIR)/idfilt/pfilt
	install -s tfilt $(LIBDIR)/idfilt/tfilt

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
