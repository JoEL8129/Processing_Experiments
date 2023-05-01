void grids(int mult2) {

  pushMatrix();
  grid(mult2);
  popMatrix();

  pushMatrix();
  
  rotateY(radians(90));
  translate(0, 0, 0);
  //grid(mult2);
  popMatrix();

  pushMatrix();

  rotateY(radians(90));
  translate(0, 0, mult2*100);
  grid(mult2);
  popMatrix();

  pushMatrix();
  rotateY(radians(0));
  translate(0, 0, -mult2*100);
  grid(mult2);
  popMatrix();

  pushMatrix();
  rotateX(radians(-90));
  translate(0, 0, 0);
  grid(mult2);
  popMatrix();

  pushMatrix();
  rotateZ(radians(270));
  rotateY(radians(90));
  rotateX(radians(-90));
  translate(0, 0, 0);
  grid(mult2);
  popMatrix();
  
  pushMatrix();

  rotateX(radians(-90));
  translate(0, 0, mult2*100);
  grid(mult2);
  popMatrix();
}
