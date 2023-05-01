void grid(int mult) {
  int col=5*mult;
  int row= 5*mult;
  int scl=20;
  float mouse2 = map(mouseX, 0, width, 0.5, 3);
  float mouse3 = 0;
  float mouse4 = map(mouseX, 0, width, 0, 150);
  for (int x = 0; x<col; x++) {
    for (int y = 0; y<row; y++) {
      //noFill();




      if (keyPressed && key=='o' && strokegrid==false) strokegrid=true;
      if (keyPressed && key=='p' && strokegrid==true) strokegrid=false;
      if (keyPressed && key=='u' && green==false && strokegrid==true) green=true;
      if (keyPressed && key=='i' && green==true) green=false;
      if (green==true) mouse3 = map(mouseY, 0, height, 0, 150);

      if (strokegrid==true) {
        stroke(x+mouse3,0, y+mouse4-random(100));
        strokeWeight(random(0.1,3));
      }
      if (strokegrid==false)noStroke();
      rect(x*scl+random(10), y*scl*noise(x,y,frameCount/100)*10, scl/10+random(20), scl-random(10));
    }
  }
}
