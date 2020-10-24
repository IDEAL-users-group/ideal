.IS

main {

  construct A: rect {
    sw = 0;
    wd = ht = 1;
    };

  construct B: rect {
    n = A.s - (0, 1);
    wd = ht = 1;
    };

  'top' at A.c;
  'bottom' at B.c;

  put arrow {
    hd = B.n;
    tl = A.s;
    };

  }

.IE
