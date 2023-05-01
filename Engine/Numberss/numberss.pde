
float n1 = noise(frameCount%50)*500;
void setup() {
  //fullScreen();
  size(1200, 800, P3D);
  background(0);
  frameRate(15);
}

void draw() { 
  //translate(-width/2,-height/2,0);
  if (mouseY>height-50) {
    pushMatrix();
    translate(0, 0, -50+mouseX/15);
    fill(0);
    rect(0, 0, width, height);
    popMatrix();
  }

  pushMatrix();
  scale(0.5);
  translate(-345, 750, 0);
  rectStructure(round(random(175, 255)));
  popMatrix();
  blackcircle();

  pushMatrix();
  translate(width/2-340, height/2, -2);
  rectStructure(50);
  popMatrix();

  pushMatrix();
  translate(500, 55, 0);
  scale(0.5);
  simpleRectStructure(5, frameCount%50);
  popMatrix();
  engine2();

  pushMatrix();
  stroke(frameCount%400/2);
  translate(0, 0, -250);
  engine();

  popMatrix();
  lineStructures(6);

  pushMatrix();
  translate(-1575, 100, 100);
  lineStructures(3); 
  popMatrix();


  glitchLine();
  staticObjects();
  numbers();
  surface.setTitle("frameRate: " + frameRate + "frameCount: " + frameCount ); //" " makes Words a string
  //saveFrame("firstrender/####.png");
}
void simpleRectStructure(int iR, int C) {

  for (int i = 0; i<iR; i++) {
    int x = i*50;
    stroke(C+x/6);
    rect(x, 0, 10, 10);
  }
}
void rectStructure(int C) {
  translate(0, 0, 0);
  noFill();
  stroke(C);
  strokeWeight(random(0.01, 1.5));
  int f = 0;
  if (frameCount%500>300) f = frameCount%200;
  int l= 7 + f/3;
  for (int i = 0; i<l; i++) {
    int x = i*50;
    int x2 = i*25;
    int x3 = i*100;
    int y = i*50;
    rect(350, height-50, 10, 10);
    rect(350+x, height-100, 10, 10);
    rect(350+x2, height-150, 10, 10);
    rect(350, height-250-y, 10, 10);
    rect(350+x, height-550, 10, 10);
    rect(350+x2, height-750, 10, 10);
  }
}

void lineStructures(int Anzahl) {
  if (Anzahl>=1) {
    liness(5);
  }
  if (Anzahl>=2) {
    pushMatrix();
    translate(0, -60, 0);
    liness(2);
  }
  popMatrix();
  if (Anzahl>=3) {
    pushMatrix();
    translate(width/2, height/2, 0);
    rotate(radians(180));
    translate(-1400, 0, -50);
    liness(round(random(7, 10)));
    popMatrix();
  }
  if (Anzahl>=4) {
    pushMatrix();
    translate(width/2, height/2, 0);
    rotate(radians(90));
    translate(0, 0, -50);
    liness(3);
    popMatrix();
  }

  if (Anzahl>=5) {
    pushMatrix();
    translate(width/2, height/2, 0);
    rotate(radians(45));
    translate(0, -100, -50);
    liness(3);
    popMatrix();
  }

  if (Anzahl>=6) {
    pushMatrix();
    translate(width/2, height/2+250, 0);
    rotate(radians(90));
    translate(-850, -50, -100);
    liness(4);
    popMatrix();
  }
}

void glitchLine() {

  pushMatrix();
  scale(0.2);
  translate(width/8*random(1, 2), height/8, random(50, 100));
  stroke(255);
  float l = frameCount%100;
  for (int i = 0; i<l; i++) {
    strokeWeight(random(0.5, 4.5));
    stroke(random(frameCount%80));
    line(i*5+frameCount%20, 0, 0, 200, height*i*500, 0);
  }
  popMatrix();
}
void liness (int Repeats) {



  for (int i= 0; i<Repeats; i++) {
    stroke(15+frameCount%240/5);
    strokeWeight(1);
    int i2 = i*5;
    if (i==3) stroke(frameCount%250/2);
    if (i==2) stroke(frameCount%250/3.5);
    line(750, 47+i2, 1250, 47+i2); 
    line(750, 47+i2, 700, 67+i2);
    line(700, 67+i2, 500, 67+i2);
    line(500, 67+i2, 450, 87+i2);
    line(450, 87+i2, 350, 87+i2);
    line(350, 87+i2, 300, 67+i2);
    line(300, 67+i2, 0, 67+i2);
    stroke(random(75, 255));
    point(750+frameCount%350, 47+i2, 1);
    point( 700-frameCount%200, 67+i2, 1);
    point( 500, 67+i2, 1);
    point( 450-frameCount%100, 87+i2, 1);
    point( 350, 87+i2, 1);
    point( 300, 67+i2, 1);
    point(-5+frameCount%305, 67+i2, 1);
    //line(300, 67+i2, 0, 67+i2);
    //point( 1250, 47+i2);
  }
}


void staticObjects() {
  fill(frameCount%255);
  noStroke();
  ellipse(width/2, height/2, 400, 400);
  noFill();
  stroke(random(255));
  strokeWeight(random(0.5, 2.5));
  pushMatrix();
  //translate(width/2,height/2);
  //translate(width/2,height/2);
  //SCANER1
  for (int i=0; i<50; i++) {
    float c=i*random(frameCount%8, 8);
    float d=c;
    noFill();
    stroke(0);
    arc(width/2, height/2, c, d, radians(frameCount%360), radians(50+frameCount%360));
  }  
  //SCANER2
  for (int i=0; i<35; i++) {
    float c=i*8;
    float d=c;
    noFill();
    stroke(0);
    arc(width/2, height/2, c, d, radians(0+frameCount%360), radians(360-frameCount%160));
  }  
  int A = 0;
  if (frameCount>500 & frameCount<1000)  A = frameCount%80;
  for (int i=0; i<A; i++) {
    float c=i*5;
    float d=c;
    noFill();
    stroke(0);
    arc(width/2, height/2, c, d, radians(0), radians(360));
  }  

  stroke(random(255));

  for (int i=0; i<10; i++) {
    float c=i*10+150;
    float d=c;
    noFill();
    stroke(0);
    arc(width/2, height/2, c, d, radians(45), radians(120));
  }  
  arc(width/2, height/2, 175, 175, radians(250), radians(360));

  arc(width/2, height/2, 50, 50, HALF_PI, radians(frameCount%360));
  popMatrix();

  arc(width/2, height/2, 60, 60, HALF_PI-radians(frameCount%200), PI+radians(frameCount%100));


  //static arc's
  arc(width/2, height/2, 300, 300, PI-frameCount%400, PI+QUARTER_PI);
  arc(width/2, height/2, 350, 350, radians(0), PI+QUARTER_PI);
  arc(width/2, height/2, 250, 250, radians(180), radians(276));
  arc(width/2, height/2, 200, 200, PI, PI+45+frameCount%360);
  arc(width/2, height/2, 150, 150, PI, PI+QUARTER_PI);
  //arc(width/2, height/2, 80, 80, PI+QUARTER_PI, TWO_PI);
  strokeWeight(5);
  arc(width/2, height/2, 399, 399, radians(0), radians(360));
  strokeWeight(1);
  arc(width/2, height/2, 395, 395, radians(0), radians(360));
  arc(width/2, height/2, 390, 390, radians(0), radians(360));
  arc(width/2, height/2, 385, 385, radians(0), radians(360));


  strokeWeight(3);
  arc(width/2, height/2, 375, 375, radians(0), radians(50));
  arc(width/2, height/2, 325, 325, radians(50), radians(100));
  arc(width/2, height/2, 275, 275, radians(180), radians(230));
  arc(width/2, height/2, 225, 225, radians(280), radians(330));
  strokeWeight(1);
  for (int i = 0; i< 15; i++) {
    strokeWeight(0.25);
    arc(width/2, height/2, 399-i*5-frameCount%100, 399-i*5-frameCount%100, radians(0), radians(360));
  }

  //rect(width/2,0,map(noise(frameCount),0,1,50,350),map(noise(frameCount),0,1,350,700));
}
