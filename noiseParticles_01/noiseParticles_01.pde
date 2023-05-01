// CLASSES - OBJECT ORIENTATED PROGRAMMING 04

// Particles reacting to a noise field

ArrayList<Particle> myParticles = new ArrayList<Particle>();

void setup (){
  //fullScreen();
  size(1200,800);
  background(0);
  
  initParticles(500);
}

void draw (){



noiseDetail(76,0.21);
noiseSeed(214);
  //update all particles
 
  for(int i = 0; i<myParticles.size(); i++){
    myParticles.get(i).update();
  }
  
  // after 700 frames, reset the particles
  refreshParticles(70000);

}
       


void mouseDragged(){
  
  if(mouseButton == LEFT) {
    // create new particles when the mouse is dragged
    myParticles.add(new Particle(mouseX, mouseY, 1, color(30), 100));
  } 
  
}


void initParticles(int num) {
  
  //generate some values that count for all the particles
  float speed = 0.63;
  float noiseSmoothness = random(30,561);
  
  //initialize the particle array
  for(int i = 0; i<num; i++){
    
    // 3 examples for different starting positions of the particles
    
    // random position in a centered square
    //float x = random(width/4, width-width/4);
    //float y = random(height/4, height-height/4);
    //myParticles.add(new Particle(x, y, speed, color(30,30), noiseSmoothness));
    
    // position on a circle
    float angle = map(i,0,num,0,TWO_PI);
    float radius = width/32;
    float x = width/2 + cos(angle) * radius;
    float y = height/2 + sin(angle) * radius;
    myParticles.add(new Particle(x, y, speed, color(130,30), noiseSmoothness));
    
    //position on a straight line through the center
    //float x = map(i, 0, num, 0, width);
    //myParticles.add(new Particle(x, height/2, speed, color(30, 30),noiseSmoothness));
  }
}


void refreshParticles(int timeSpan) {
  
  // after n frames... check out the modulo operator (%) in the processing reference 
  if(frameCount%timeSpan == 0) {
    
    // delete all particles
    myParticles.clear();
    
    // clear the canvas
    background(255);
    
    // generate a new noise seed
    noiseSeed(round(random(10000)));
    
    // initialize 500 new particles
    initParticles(500);
  }
}
