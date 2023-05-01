class Particle {
  
  // ATTRIBUTES
  float x,y,px,py;
  float speed;
  color c;
  float diameter = 1;
  float noiseSmoothness;

  // CONSTRUCTOR - it is named exactly like the classname 
  // it is used to construct / initialize one object of the class Particle
  // we can pass arguments to the constructor, which is especially useful if we want 
  // to initialize different objects of the class with different values
  Particle(float _x, float _y, float _speed, color _c, float _noiseSmoothness){
    x = _x;
    y =_y;
    px = x;
    py = y;
    speed = _speed;
    c = _c;
    noiseSmoothness = _noiseSmoothness;
  }
  
  
  
  // FUNCTIONS
  void update(){
    moveDirectionalNoise();
   // borderCondition();
    drawSelf();
    //drawTrace();
    
    px = x;
    py = y;
  }
  
  void drawSelf(){
    noStroke();
    fill(c);
    ellipse(x, y, diameter, diameter);
  }
  
  // usueful when the speed is higher than the size of the particles
  // unforntunately, antialiasing seems to work worse for strokes than for filled shapes !?
  void drawTrace(){
    stroke(c);
    strokeWeight(1);
    line(x,y,px,py);
  }
  
  void moveDirectionalNoise(){
    float nX = x/noiseSmoothness;  
    float nY = y/noiseSmoothness;
    float angle = noise(nX, nY,0) * TWO_PI;
   
    x += cos(angle) * speed;
    y += sin(angle) * speed;
  }
  
  void moveRandom(){
    x += random(-1,1) * speed;
    y += random(-1,1) * speed;
  }

  void borderCondition(){
    if(y<0){
      y = height;
      py = height;
    } else if(y>height){
      y = 0;
      py = 0;
    }
    
    if(x<0){
      x = width;
      px = width;
    }else if(x>width){
      x = 0;
      px = 0;
    }
  }
}
