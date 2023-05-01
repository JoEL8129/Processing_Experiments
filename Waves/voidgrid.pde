void grid(int mult2) {
  int col=5*mult2;
  int row= 5*mult2;
  int scl=5;
  float flying;
  float[][] terrain;
  flying = 0;
  terrain = new float[col][row];  
  flying -= 0.1;
  float yoff = flying;

  for (int x = 0; x<col; x++) {
    float xoff = 0;
    for (int y = 0; y<row; y++) {
      if(frameCount>0) terrain[x][y] = map(noise(xoff, yoff, map(sin(radians(15+frameCount%720)), -1, 1, 3, 5)), 0, 1, -100, 100);
      if(frameCount>1000) terrain[x][y] = map(noise(xoff, yoff, map(sin(radians(15+frameCount%720)), -1, 1, 3, 5)*map(cos(radians(frameCount/4%180)), -1, 1, 1.5, 2.5)), 0, 1, -100, 100);
      if(frameCount>2000)       terrain[x][y] = map(noise(xoff/tan(radians(frameCount%180)), yoff*xoff, map(sin(radians(15+frameCount%720)), -1, 1, 3, 5)), 0, 1, -100, 100);

      xoff += 0.05;
    }
    yoff += 0.1;
  }

  for (int x = 0; x<col; x++) {
    beginShape(TRIANGLE_STRIP);
    for (int y = 0; y<row-1; y++) {
      //noFill();

      if(frameCount<2000) stroke(map(x, 0, col, 155, -50), 0, map(y, 0, row, 1, 255));
      if(frameCount>2000) stroke(0,0,map(x*sin(radians(frameCount/2%360)),-x,x,0,255));
      fill(map(x, 0, col, 0, 80),0, map(y, 0, row, 20, 50));
      //fill(map(mouseX,0,width,0,255));



    

      vertex(x*scl, (y)*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);

    }

    endShape();
  }
}
