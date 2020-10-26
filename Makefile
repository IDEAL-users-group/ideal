# Makefile for ideal, 1.3 (UKC) 13/2/89

YACC	= bison -y

BASEDIR = $(PWD)/dirs

# Where the executable lives that the users call "ideal"
BINDIR = $(BASEDIR)/bin

# Where ideal's chattels live (usually /usr/lib/ideal)
LIBDIR = $(BASEDIR)/lib

MANDIR = $(BASEDIR)/man

CFLAGS = -O -DLIBDIR=\"$(LIBDIR)/\"

SOURCES =\
	action.c\
	bldds.c\
	exprn.c\
	ideal.c\
	ideal.h\
	idlex.l\
	idyac.y\
	inter.c\
	memut.c\
	opaque.c\
	opqpoly.c\
	piece.c\
	simul.c\
	util.c
OBJECTS =\
	action.o\
	bldds.o\
	exprn.o\
	ideal.o\
	inter.o\
	lex.yy.o\
	memut.o\
	opaque.o\
	opqpoly.o\
	piece.o\
	simul.o\
	util.o\
	y.tab.o
ADMIXTURE =\
	$(SOURCES)\
	lex.yy.c\
	y.tab.c

a.out:	$(OBJECTS)
	cc $(OBJECTS) -ll -lm

install: 
	./install-file $(BINDIR)/ideal-a.out a+rx,a-w a.out 
	sed < ideal.cmd -e 's|<BINDIR>|$(BINDIR)|' | \
	  ./install-file $(BINDIR)/ideal a+rx,a-w -
	./install-file $(MANDIR)/man1/ideal.1 a+r,a-wx ideal.1 
	./install-file $(LIBDIR)/@ a+r,a-wx lib/*
	cd idfilt ; $(MAKE) BINDIR=$(BINDIR) install

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
