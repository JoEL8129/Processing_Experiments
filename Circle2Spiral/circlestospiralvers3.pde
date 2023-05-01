import ch.bildspur.postfx.builder.*;
import ch.bildspur.postfx.pass.*;
import ch.bildspur.postfx.*;
PostFX fx;

void setup() {
  size(1200, 880, P3D);
  fx = new PostFX(this);
  background(0);
}

void draw() { 
  surface.setTitle("frameRate: " + frameRate + "frameCount: " + frameCount ); //" " makes Words a string
  translate(width/2, height/2);

  //if(frameCount%3==1) background(0);

  rotate(radians(frameCount)+noise(radians(frameCount)));
  //println(radians(frameCount));
  scale(0.005+radians(frameCount)*0.02);
  //scale(0.2);

  for (int c = 0; c<5000; c++) {
    float angle=radians(c+frameCount*random(50));

    float xA= sin(angle);
    float yA= cos(angle);
    float zA= sin(c);
    float a = frameCount/150.0;
    // float radius = frameCount ;
    float n3 = noise(xA+a*2, yA+a*4, zA+a);
    float n = noise(xA + a*5, yA + a*5)/2;
    float radius =  n  * mouseX*1.3;
    //if(frameCount>=15) radius=frameCount + n * mouseX*2;
    float x = width/2  + cos(angle) * radius*n3*2;
    float y = height/2 + sin(angle) * radius* n*5 ;

    //float x = xA + width/2;
    //float y = yA + height/2;
    noStroke();
    //strokeWeight(1);
    fill((mouseX)/10.0);
    ellipse(x, y, n*random(32.0), n*5);
    //println(n*3);
    //for (int i=0; i < 1400; i++) {
    //if (i%5==1) ellipse(i, i, 2, 2);
    //int p=round(random(1400));
    //if (i==p) ellipse(i+5, i+5, 4, 4);
    //}
  }
  //saveFrame("save/####.png");
  fx.render()
    .brightPass(1.8)
    .blur(20, 50);
    //.sobel()
    //.bloom(0.1, 10, 100)
    //.compose();
}
