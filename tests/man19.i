.IS

wavy {

  var start, end, perp, pt1, pt2, ht;

  perp = (0, 1)*(start - end)/abs(start - end);
  pt1 = 0.25[start, end] + perp*ht;
  pt2 = 0.75[start, end] - perp*ht;

  conn start to pt1 to pt2 to end;
  }

main {

  var ne, nw, se, sw;
  var n1, s1, n2, s2;

  ne = nw + 2;
  se = sw + 2;
  ne = se + (0, 1);
  n2 - 0.4 = n1 = 0.6[nw, ne];
  s2 - 0.4 = s1 = 0.4[sw, se];

  conn n1 to nw to sw to s1;
  conn n1 to s1
    using int(5*abs(n1 - s1)) wavy {
      ht = -0.1;
      } <start, end>;
  conn n2 to ne to se to s2;
  conn n2 to s2
    using int(5*abs(n2 - s2)) wavy {
      ht = -0.1;
      } <start, end>;

  }

.IE
