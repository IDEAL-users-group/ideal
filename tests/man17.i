.IS

listnode {

  put info: rect {
    var hook;
    hook = (nw + sw)/2;
    ht = lht;
    wd = lwd/2;
    }

  put next: rect {
    var c;
    c = (nw + se)/2;
    sw = info.se;
    ht = lht;
    wd = lwd/2;
    };

  }


main {

  var lht, lwd;

  lht = 1;
  lwd = 2*lht;

  put first: listnode {
    info.sw = 0;
    };

  put last: listnode {
    info.sw = 2[first.info.sw, first.next.se];
    conn next.sw to next.ne;
    };

  put new: listnode {
    info.nw = 2[first.next.ne, first.next.se];
    };

  put arrow {
    hd = new.info.hook;
    tl = hd - 1;
    right "new " at tl;
    };

  put arrow {
    hd = first.info.hook;
    tl = hd = 1;
    right "list " at tl;
    };

  }

.IE
