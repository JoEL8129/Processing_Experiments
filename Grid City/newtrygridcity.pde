import codeanticode.syphon.*;

import peasy.*;

SyphonServer server;

PeasyCam cam;
int[] y = {0};
float r=0;
float cam1, cam2, cam3;
boolean strokegrid = false;
boolean green = false;
boolean grids = false;

void setup() {
  size(1280, 720, P3D);
  background(0);
 // cam = new PeasyCam(this, 1000);
  y[0] = 1;
  cam1 = 0;
  server = new SyphonServer(this, "Processing Syphon");
}

void draw() {
  //background(0);
  camera(935+map(sin(radians(frameCount%360)),-1,1,0,350),994-map(cos(radians(frameCount*2%720)),-1,1,1,250),-377,-35,13,245+map(sin(radians(frameCount%360)),-1,1,0,250),1,-3,77);

  float mouse = map(mouseX, 0, width, 20, 0.1);
float map = map(sin(radians(frameCount%360)),-1,1,100.1,7);
  pushMatrix();
  fill(255, map);
  //rotateX(radians(frameCount*2%360));

  translate(-440+map(sin(radians(frameCount%360)), -1, 1, 50, 500), -649+map(sin(radians(frameCount%360)),-1,1,0,500), 1044+map(sin(radians(frameCount%360)), -1, 1, 0, 50));
  if(keyPressed && key=='g' && grids== false) grids=true;
  if(grids==true) {
    strokeWeight(0.1);
    stroke(frameCount/2%200);
    grids(25);}
  if(keyPressed && key=='h' && grids== true) {
    grids=false;
    background(0);}
  //grids(25);
  
  fill(0, 20);  //println(mouseX,mouseY);

  popMatrix();




  stroke(36);

  noStroke();
  float mod1 = map(sin(radians(frameCount%360)), -1, 1, -250, 300);
  float mod2 = map(sin(radians(frameCount+1%360)), -1, 1, -25, 255);

  directionalLight(2, 102, 171, map(sin(radians(frameCount*2%360)), -1, 1, 0, 100), mod1, 47);


  pointLight(mod2, 43, 242, width/2+79, height/2+0, 153);
  //pointLight(110, -41, 15, width/2+16, height/2+-157, -215);
  //pointLight(255, 50, 50, width/2+0, height/2+0, -650);
  //pointLight((255), mod1, 50, width/2+0, height/2+0, -1167);
  pushMatrix();
  //translate(-1,545,-426);
  //rotateX(radians(frameCount/2%360));
  gridz(20+0);
  popMatrix();

//if(frameCount>300) saveFrame("render1/####.png");

  server.sendScreen();
}

void gridz(int mult) {
  int col=5*mult;
  int row= 5*mult;
  int scl=5;

  for (int x = 0; x<col; x++) {
    for (int y = 0; y<row; y++) {
      float rn = 0;
float mousex = map(sin(radians(frameCount%360)),-1,1,0,width/2);
float mousey = map(sin(radians(frameCount*2%360)),-1,1,0,height);
      rn += 0.1;
      r= noise(x, y*rn, rn*map(frameCount%1500, 0, 1500, 50, 200))*mousex/10;
      float r2= mousey/20*noise(rn*r, x, y);
      fill(x*r/2, y*r/2, 50);


      pushMatrix();

      translate(x*scl+150, y*scl+146, 0);
      box(scl*r2, scl, scl*r);
      popMatrix();
    }
  }
  //if (keyPressed && key=='ß') saveFrame("shots/####.png");
  //if (frameCount>150) saveFrame("littlerender/####.png");
}
