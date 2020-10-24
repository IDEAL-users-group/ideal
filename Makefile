# Makefile for ideal, 1.3 (UKC) 13/2/89

YACC	= bison -y

# Where the executable lives that the users call "ideal"
BINDIR = /usr/lib/ditroff

# Where ideal's chattels live (usually /usr/lib/ideal)
LIBDIR = /usr/lib/ideal

CFLAGS = -O -DLIBDIR=\"$(LIBDIR)/lib/\"

SOURCES =\
	ideal.h\
	ideal.c\
	util.c\
	memut.c\
	bldds.c\
	simul.c\
	exprn.c\
	action.c\
	piece.c\
	opaque.c\
	inter.c\
	opqpoly.c\
	idlex.l\
	idyac.y
OBJECTS =\
	y.tab.o\
	lex.yy.o\
	ideal.o\
	util.o\
	memut.o\
	bldds.o\
	simul.o\
	exprn.o\
	action.o\
	piece.o\
	opaque.o\
	opqpoly.o\
	inter.o
ADMIXTURE =\
	y.tab.c\
	lex.yy.c\
	ideal.c\
	util.c\
	memut.c\
	bldds.c\
	simul.c\
	exprn.c\
	action.c\
	piece.c\
	opaque.c\
	opqpoly.c\
	inter.c

a.out:	$(OBJECTS)
	cc $(OBJECTS) -ll -lm

install: a.out
	-mkdir $(LIBDIR)
	install -s a.out $(LIBDIR)/ideal
	-mkdir $(LIBDIR)/lib
	cp lib/* $(LIBDIR)/lib
	(cd idfilt; make install LIBDIR=$(LIBDIR) )
	install -c -m 755 ideal.cmd $(BINDIR)/ideal
	install -c -m 644 ideal.1 /usr/man/man1/ideal.1
	install -c -m 644 ideal.1,h /usr/how/how1/ideal.1

$(OBJECTS):	ideal.h

ideal.h:	stdas.h

lex.yy.c:	idlex.l
	lex idlex.l
lex.yy.o:	lex.yy.c
	cc -c -DYY_NO_INPUT lex.yy.c

y.tab.c:	idyac.y
	$(YACC) -d idyac.y

list:
	pr $(SOURCES)

lint:
	lint $(ADMIXTURE) -lm

backup:
	cp a.out makefile $(SOURCES) precious

working:
	cp a.out makefile $(SOURCES) semiprec

longlist:
	ls -l $(SOURCES)

wc:
	wc $(SOURCES)

diff:
	for i in $(SOURCES);\
	do\
			cmp $$i precious/$$i || diff $$i precious/$$i;\
	done

clean:
	rm -f a.out *.o y.tab.* lex.yy.*
	(cd idfilt; make clean)

fgrep:
	fgrep $(WORD) $(SOURCES)

cpio:
	cpio -o <subdirectories >subdirs.cpio

export:	cpio
	uucp README makefile\
	$(SOURCES) stdas.h\
	RAW_FORMAT ideal.cmd\
	manpage\
	subdirectories\
	subdirs.cpio\
	$(WHO)
