import peasy.*;
PeasyCam cam; 
cube cube1;
CameraState state;
boolean render = false;

void setup() {
  size(1920, 1080, P3D);
  background(0);
  cam = new PeasyCam(this, 0, 0, 0, 750);
  cube1 = new cube(10);
  state = cam.getState();
  frameRate(60);
}


void draw() {
  //background(0);
  
  println(cam.getRotateDragHandler());
  stroke(255);
  objects();

float cam1 = 0;
cam1 += 0.1;
float fc = map(sin(radians(frameCount/3%360)),-1,1,15,-60);

  //beginCamera();
  //camera();
  //cam1 += 0.1;
  //translate(588+map(sin(radians(frameCount%360)),-1,1,0,150),121,610+map(sin(radians(frameCount%360)),-1,1,-50,300));
  
  //rotateX(radians(-5));
  //rotateY(radians(70+cam1));
  //rotateZ(radians(-15-cam1*10));
  //endCamera();

  //if (keyPressed && key=='r' && render==false) render=true;
  //if (render == true) saveFrame("render2/####.png");
  
  
  if (keyPressed && key=='r') saveFrame("shots/####.png") ;

}

void objects() {
  float mouse = map(mouseX, 0, width, 0.01, 15);
  pushMatrix();
  translate(-339, -373, 805);
  fill(0,mouse);
  //if(frameCount<1000) fill(0, map(cos(radians(frameCount*3%1080)), -1, 1, -7.5, 10));
  if(frameCount>1500) fill(0, map(sin(radians(frameCount*3%1080)), -1, 1, -7.5, 15));
//if(mouseY>=height/1.5)   fill(255, map(sin(radians(frameCount*3%1080)), -1, 1, -5, 15));
 
  noStroke();
  if (keyPressed && key=='y') stroke(0);

  cube1.drawself();
if(frameCount<1000)  fill(255, 40);
if(frameCount>1500 )  fill(255, 40);


  popMatrix();

  pushMatrix();
  rotateX(radians(90));
  translate(-291, -181, -500);
  grid(40);
  popMatrix();
}


public void keyReleased() {
  if (key == '1') state = cam.getState();
  if (key == '2') cam.setState(state, 1000);
}
