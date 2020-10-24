.IS

...libfile hole

box gridline {

  var a, b;
  vr neg, pos;

  conn a - neg to a + pos;
  }


main {

  var n;

  n = 21;

  conn (0, 0) to (0, 1 + 1/(n - 1))
    using n gridline {
      neg = 0;
      pos = 1;
      } <a, b>;

  conn (0, 0) to (1 + 1/(n - 1), 0)
    using n gridline {
      neg = 0;
      pos = (0, 1);
      } <a, b>;

  put hole {
    radius = 1;
    center = (0, 0);
    opaque exterior;
    }
  }

.IE
