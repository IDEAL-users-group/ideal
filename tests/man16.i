.IS

triangle {
  var z1, z2, z3;
  conn z1 to z2 to z3 to z1;
  }


main {
  put T: triangle {
    z1 = 0;
    z2 = 1;
    z3 = (2, 2);
    };

  put circle {
    z1 = T.z1;
    z2 = T.z2;
    z3 = T.z3;
    }
  }

.IE
