void engine2() {

  noStroke();
  noFill();
  ellipse(300-random(-5,5), height-75-random(-5,5), 25, 25);
  ellipse(200, height-75, 25, 25);
  ellipse(400, height-75, 25, 25);

  for (int i= 0; i<2000; i++) {
    float step = 20;
    float angle = radians(i);
    float radius = 200;
    float circleX = sin(angle);
    float circleY  = cos(angle); 
    float a = 150;
    float n = noise(circleX +a, circleY + a) -0.5;

    float x = width/2 + cos(angle) * radius; 
    float y = height/2 + sin(angle) * radius;
    int num = 1;

if(frameCount%500>250) {
 x = width/2 + cos(angle) * radius * noise(frameCount%150,frameCount/4); 
 y = height/2 + sin(angle) * radius * noise(frameCount%150,frameCount/4);
  
}
    pushMatrix();
    stroke(random(50,85));
    strokeWeight(0.5);
    translate(0, 0, mouseX/50);
    //translate(noise(mouseX/50, mouseX/50), noise(mouseY/10,mouseX/10), 0);
    //ellipse(x, y, step/5, step/5);
    popMatrix();
//noStroke();

  }
}
