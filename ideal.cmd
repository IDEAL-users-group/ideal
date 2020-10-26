#! /bin/sh

IDDIR=<BINDIR>
ideal="$IDDIR/ideal-a.out"
filter=t
iflags=
for i
do
	case $i in
	-p*)	filter=p
		shift ;;
	-4*)	filter=4
		shift ;;
	-n*)	filter=n
		shift ;;
	-a*)	filter=a
		shift ;;
	-t*)	filter=t
		shift ;;
	-T202*)	filter=2
		shift ;;
	-Taps*)	filter=a
		shift ;;
	-Tcan*)	filter=t
		shift ;;
	-s*)	sflags=s
		shift ;;
	-q*)	fflags=-q
		shift ;;
	*)	iflags="$iflags $i"
		shift ;;
	esac
done
case $filter in
	p)	$ideal $iflags | $IDDIR/pfilt
		;;

	4)	f="/tmp/id`getuid`"
		$ideal $iflags >$f
		$IDDIR/4filt $f
		rm $f
		;;

	n)	$ideal $iflags
		;;

	t)	case $sflags in
		s)	$ideal $iflags | $IDDIR/idsort | $IDDIR/tfilt $fflags ;;
		*)	$ideal $iflags | $IDDIR/tfilt $fflags ;;
		esac
		;;

	a)	case $sflags in
		s)	$ideal $iflags | $IDDIR/idsort | $IDDIR/apsfilt $fflags ;;
		*)	$ideal $iflags | $IDDIR/apsfilt $fflags ;;
		esac
		;;
esac
