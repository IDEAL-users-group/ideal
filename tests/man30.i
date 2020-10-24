.IS

...libfile rect

box arrow {

  var tl, hd, neadvec, head;

  headvec = hd + head*(tl - hd)/abs(tl - hd);

  conn tl to hd;
  conn hd + cis(20)*(headvec - hd)
    to hd
    to hd cis(-20)*(headvec - hd);

  }

box dot {

  var s, e;

  '\(bu' at 0.5[s, e] - (0, 0.1);

  }

box per {

  var s, e;

  '.' at 0.5[s, e];

  }

main {

  var rw, rh;

  rw = 2;
  rh = 1;

  var hmv, vmv;

  hmv = 0.6;
  vmv = 0.3;

  var ah;

  ah = 0.2;

  put root: rect {
    sw = (0, 1);
    hd = rw;
    ht = 1;
    };

  put next: rect {
    sw = youngest.sw + w*(hmv, vmv);
    wd = rw;
    ht = rh;
    };

  put youngest: rect {
    sw = bro.sw + (hmv, vmv);
    wd = rw;
    ht = rh;
    opaque;
    }

  put bro: rect {
    sw = eldest.sw + (hmv, vmv);
    wd = rw;
    ht = rh;
    opaque;
    }

  put eldest: rect {
    im(nw) = im(e[root.nw, root.sw]);
    re(0.5[nw, next.nw]) = re(0.5[root.nw, root.ne]);
    wd = rw;
    ht = rh;
    opaque;

    put arrow {
      head = ah;
      tl = 0.0[sw, se] + 0.5*(nw - sw);
      hd = tl - (0, 1)*cis(-27);
      };

    put arrow {
      head = ah;
      tl = 0.33[sw, se] + 0.5*(nw - sw);
      hd = tl - (0, 1)*cis(-9);
      };

    put arrow {
      head = ah;
      tl = 0.67[sw, se] + 0.5*(nw - sw);
      hd = tl - (0, 1)*cis(9);
      };
    };

  put arrow {
    head = ah;
    tl = root.sw + 0.5*(root.nw - root.sw);
    hd = eldest.nw;
    };

  put arrow {
    head = ah;
    tl = 0.1[root.sw, root.se] + 0.5*(root.nw - root.sw);
    hd = bro.nw;
    };

  put a: arrow {
    head = ah;
    tl = 0.2[root.sw, root.se] + 0.5*(root.nw - root.sw);
    hd = youngest.nw;
    };

  put b: arrow {
    head = ah;
    tl = 0.5[root.sw, root.se];
    hd = next.nw;
    };

  put arrow {
    head = ah;
    tl = 0.5[root.sw, root.se] + (0, 1);
    hd = root.nw;
    };

  conn next.nw to youngest.nw using 3 dot { } <s, e>;
  conn next.se to youngest.se using 3 dot { } <s, e>;
  conn b.tl to a.tl using 4 per { } <s, e>;

  }
