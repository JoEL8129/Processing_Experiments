import peasy.*;

PeasyCam cam; 
float angle = 0;
float fc = frameCount/4;
ArrayList<PVector> vectors = new ArrayList<PVector>();
// r(beta) = 0.8 + 1.6 * sin(6 * beta)
// theta(beta) = 2 * beta
// phi(beta) = 0.6 * pi * sin(12 * beta)

//x = r * cos(phi) * cos(theta)
//y = r * cos(phi) * sin(theta)
//z = r * sin(phi)


float beta = 0;

void setup() {

  size(1200, 800, P3D);
  background(255);
  cam = new PeasyCam(this, 250);
  frameRate(30);
}

void draw() {
  scale(0.5);
  if (keyPressed) {
    if (key=='q') {
      background(255);
    }
    if (key=='w') {
      background(0);
    }
  }
  //background(255);
  translate(width/2, height/2);
  rotateY(angle/8);
  angle += 0.02;
  float s2 = 0.5;
  s2 =+ 0.5;
  float s = sin(radians(frameCount%1400));
  float s3 = map(s, -1, 1,-10, 255);

  float r = 60*(0.8 + 1.6 * noise(angle, 12 * beta));
  float theta = 2 * beta*noise(angle, -angle, s);
  float phi = 0.6 * PI * sin(12 * beta)* noise(fc/100, random(50))*2;
  float x = r * cos(phi) * cos(theta)*s3/6;
  float y = r * cos(phi) * sin(theta)*s3/4+angle*23;
  float z = r * sin(phi)*s3/4;
  stroke(255, r, 255);
  println(x, y, z);
  vectors.add(new PVector(x, y, z));


  beta += 0.01;


  noFill();

  println(s3);
  stroke(0+s3, 230-s3);
  //stroke(s3);
  strokeWeight(1);
  beginShape();
  for (PVector v : vectors) {
    float rate= 0 ;
    float n =1;

    rate =+ 0.01;
    float rate2 =+ 0.75;
    n=noise(rate, sin(radians(rate2%360)));
    //vertex(v.x*n, v.y, v.z);
    vertex(v.x, v.y, v.z);
  }
  endShape();

  beginShape();
  for (PVector v : vectors) {
    float rate= 0 ;
    float n =1;

    rate =+ 0.01;
    float rate2 =+ 0.75;
    n=noise(rate, sin(radians(rate2%360)));
    //vertex(v.x*n, v.y, v.z);
    float s5 = map(sin(radians(fc%360)), -1, 1, 5, 15);
    float s6 = map(sin(radians(fc%360)), -1, 1, 0, 450);
    stroke(s3);
    vertex(v.x+s5, v.y+s5, v.z+s5);
    vertex(v.x+s5+5, v.y+s5+5, v.z+s5+5);
  }
  endShape();

  pushMatrix();
  //triangles();
  popMatrix();

  pushMatrix();
  translate(-594+width/2, -403+height/2, 0);
  scale(0.101);
  //scaled();
  popMatrix();
}


void scaled() {
  beginShape();
  for (PVector v : vectors) {
    float rate= 0 ;
    float n =1;
    strokeWeight(random(0.5, 50));
    rate =+ 0.01;
    float rate2 =+ 0.75;
    n=noise(rate, sin(radians(rate2%360)));
    //vertex(v.x*n, v.y, v.z);
    float s5 = map(sin(radians(fc%360)), -1, 1, 5, 15);
    float s6 = map(sin(radians(fc%360)), -1, 1, 0, 450);
    stroke(185, 0, 0);

    vertex((v.x+s5*n), (v.y+s5), (v.z+s5-10));
    vertex((v.x+s5+5*n), (v.y+s5+5*n), (v.z+s5+5-10));
  }
  endShape();
}

void triangles() {
  float m2 = map(fc%100, 0, 100, 0, 0.02);
  rotateY(m2);
  beginShape(TRIANGLE_STRIP);
  for (PVector v : vectors) {
    float rate= 0 ;
    float n =1;

    rate =+ 0.01;
    float rate2 =+ 0.75;
    n=noise(rate, sin(radians(rate2%360)));
    //vertex(v.x*n, v.y, v.z);
    float s5 = map(sin(radians(fc%360)), -1, 1, 5, 15);
    float s6 = map(sin(radians(fc%360)), -1, 1, 0, 450);
    stroke(0);
    vertex(v.x+s5-10-fc, v.y+s5-10, v.z+s5-10);
    vertex(v.x+s5+5-10, v.y+s5+5-10, v.z+s5+5-10);
    vertex(v.x+s5+5-fc, v.y+s5+5-fc, v.z+s5+5-fc);
  }
  endShape();
}
