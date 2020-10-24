.IS

box null {
  }

box pentagon {

  var center, radius, pt1, pt2, pt3, pt4, pt5;

  pt1 = center + radius;
  pt2 = center + cis(72)*radius;
  pt3 = center + cis(144)*radius;
  pt4 = center + cis(-144)*radius;
  pt5 = center + cis(-72)+radius;

  conn pt1 to pt2 to pt3 to pt4 to pt5 to pt1;
  bldlist = pt1, pt2, pt3, pt4, pt5;

  }

main {

  construct A: null {

    conn (0, 1) to 0
      using 7 brush {
      bwd = 1;
      bht = 0.1;
      } <top, bot>;

    put pentagon {
      center = (0, 0.5);
      radius = (0, 0.5);
      opaque exterior;
      };
    };

  construct B: null {
    conn (0.5, 0.5) to (1.5, 0.5)
      using 5 brush {
      bwd = (0, 1);
      bht = 0.1;
      } < top, bot>;

    put circle {
      center = (1, 0.5);
      radius = 0.5;
      opaque exterior;
      }
    }

  draw A;
  draw B;
    
  }

.IE
