.IS

arrow {
  var hd, tl, head, wing;
  head = 0.1;
  wing = head*(tl -hd)/abs(tl -hd);
  conn hd to tl;
  conn hd + cis(25)*wing to hd to hd + cis(-25)*wing;
  }

.IE

