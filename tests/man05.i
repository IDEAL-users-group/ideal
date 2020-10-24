.IS

rect {

  var ne, nw, se, sw, wd, ht;
  
  nw = sw + (0, 1)*ht;
  ne = nw + wd;
  se = sw + wd;

  conn ne to nw to sw to se to ne;
  }


main {
  put rect {
    (nw + sw)/2 = (0, 1);
    nw = (0, 2);
    wd = 1;
    }
  }

.IE
