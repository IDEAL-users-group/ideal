.IS

box arrow {

  var tl, hd, head, perp, headang;

  conn tl to hd;
  perp = head*(tl - hd)/abs(tl - hd);

  conn hd + cis(headang)*perp to nd to hd + cis(-headang)*perp;

  head ~ 0.1;
  headang ~ 25;
  }

.IE
