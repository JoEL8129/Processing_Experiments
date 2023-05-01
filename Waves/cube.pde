class cube {
  int mult;

  int scl=20;

  cube(int _mult) {
    mult = _mult;
  }

  void drawself() {
    int col=5*mult;
    int row=5*mult;

    for (int x = 0; x<col; x++) {
      for (int y = 0; y<row; y++) {



        pushMatrix();
        rect(x*scl, y*scl, scl, scl);
        popMatrix();

        pushMatrix();
        rotateY(radians(90));
        translate(0, 0, 0);
        rect(x*scl, y*scl, scl, scl);
        popMatrix();

        pushMatrix();
        rotateY(radians(90));
        translate(0, 0, mult*100);
        rect(x*scl, y*scl, scl, scl);
        popMatrix();

        pushMatrix();
        rotateY(radians(0));
        translate(0, 0, -mult*100);
        rect(x*scl, y*scl, scl, scl);
        popMatrix();

        pushMatrix();
        rotateX(radians(-90));
        translate(0, 0, 0);
        rect(x*scl, y*scl, scl, scl);
        popMatrix();

        pushMatrix();
        rotateX(radians(-90));
        translate(0, 0, mult*100);
        rect(x*scl, y*scl, scl, scl);
        popMatrix();
      }
    }
  }

}
