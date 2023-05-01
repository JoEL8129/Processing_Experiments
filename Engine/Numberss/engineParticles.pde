void engine() {





  noFill();
  ellipse(300, height-75, 75, 75);
  ellipse(200, height-75, 75, 75);
  ellipse(400, height-75, 75, 75);

  for (int i= 0; i<2000; i++) {
    float step = 20;
    float angle = radians(i);
        float n2 = noise(frameCount+mouseX, frameCount  + mouseY);

    float radius = 85 + mouseX/3 ;
    float circleX = sin(angle);
    float circleY  = cos(angle); 
    float a = 200;
    float n = noise(circleX +a*n2, circleY + a);

    //float x = width/2 + cos(angle) * radius/(5-frameCount%499/100)*n; mod

    float x =  width/2 + cos(angle)  *n*radius*n2*3; 
    float y = height/2 + sin(angle) *n*radius*n2*3;
     //x = mouseX + cos(angle) * radius*n; 
     //y = mouseY+ sin(angle) * radius*n;
    int num = 1;


    pushMatrix();
    translate(0, 0, n*4);
    translate(noise(n2*4, n2*18), 0, 0);
    ellipse(x, y, step*5, step*5);
    popMatrix();

    pushMatrix();
    if (frameCount%1000>=100) {

      x = width/2 + cos(angle) * radius*n; 
      y = height/2 + sin(angle) * radius*n;
    }
    translate(-400, 330, 0);
    ellipse(x, y, 0.5, 0.5);
    popMatrix();
    

  }
}
