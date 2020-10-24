.IS

...libfile rect

main {
  put first: rect {
    sw = 0;
    ht = wd = 1;
    };
  put next: rect {
    nw = first.se;
    ht = wd = first.ht;
    };
  put last: rect {
    nw = first.ne;
    se = next.ne;
    ht = wd;
    };
  }

.IE
