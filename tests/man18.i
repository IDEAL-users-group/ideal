.IS

listnode {

  var n, s, e, w, ne, nw, se, sw, next;

  n = s + (0, 1)*lht;
  ne = n + 0.5*lwd = nw + lwd;
  se = s + 0.5*lwd = sw + lwd;
  e = (ne + se)/2;
  w = (nw + sw)/2;
  next = (ne + s)/2;

  conn nw to ne to se to sw to nw;
  conn n to s;
  }


main {

  var lht, lwd;

  lht = 1;
  lwd = 2*lht;

  put first: listnode {
    sw = 0;
    };

  put last: listnode {
    sw = 2[first.info.sw, first.next.se];
    conn s to ne;
    };

  put new: listnode {
    nw = 2[first.ne, first.se];
    };

  put arrow {
    hd = new.w;
    tl = first.next;
    };

  put arrow {
    hd = new.w;
    tl = hd - 1;
    right "new " at tl;
    };

  put arrow {
    hd = first.w;
    tl = hd = 1;
    right "list " at tl;
    };

  }

.IE
