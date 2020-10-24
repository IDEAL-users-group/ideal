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
    ne = (1, 2);
    sw = 0;
    wd = 0.5*ht;
    }
  }

.IE
