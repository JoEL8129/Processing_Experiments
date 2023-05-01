import oscP5.*;
import netP5.*;
import controlP5.*;
//import processing.serial.*;
//Serial myPort;
//String portName = Serial.list()[0];
float[] values;
float value;
float value2;
float x ; 
float y; 
float z; 
float l3; 
float t4;

boolean triggerO = false;
//GUi Stuff
ControlP5 cp5;

Slider2D s;
Slider2D s2;
Slider2D s3;
Slider2D s4;
int sliderValue ;
int sliderValue2 ;
int sliderValue3 ;
float sV1;
float sV2;
float sV3;
int sliderTicks1 = 100;
int sliderTicks2 = 30;
Slider abc;

// OSC, Serial, Datatransfer Stuff
NetAddress myRemoteLocation;

// GA Example 
Food food;
ArrayList<PVector> targets;


// Attraction Example
Attractor a; // food later
Attractor a2;
//Mover m; // Bloop later
//Mover m2;
Mover child;

ArrayList<Prey> preys; // man

ArrayList<Mover> allMovers; // 
ArrayList<Mover> movers; // man
ArrayList<Mover> movers2; // woman 
ArrayList<Mover> newMovers; // babys 

boolean release ;
float noiseAmount;


void setup() {
  size(800, 800);

  initGUI();
  //myRemoteLocation = new NetAddress("127.0.0.1", 12000);
  //myPort = new Serial(this, portName, 115200);
  delay(300);

  // genetic Setup

  food = new Food(20 );


  release = false;
  movers = new ArrayList<Mover>();
  movers2 = new ArrayList<Mover>();
  allMovers = new ArrayList<Mover>();
  newMovers = new ArrayList<Mover>();

  preys = new ArrayList<Prey>();

  for (int i = 0; i<20; i++) {
    PVector l = new PVector(random(width), random(height));
    DNA dnaPrey = new DNA();
    preys.add(new Prey(l, dnaPrey));
  }


  for (int i = 0; i<20; i++) {

    PVector l = new PVector(random(width), random(height));
    DNA dna = new DNA();

    //m= new Mover(l, dna);
    movers.add(new Mover(l, dna));
  }
  for (int i = 0; i<20; i++) {

    PVector l2 = new PVector(random(width), random(height));
    DNA dna2 = new DNA();
    //m2 = new Mover(l2, dna2);
    movers2.add(new Mover(l2, dna2));
  }
  //allMovers.add(m);
  //allMovers.add(m2);
  a = new Attractor();
  a2 = new Attractor();
}



void draw() {
      //t4 = 0;

  background(255);
  frameRate(15);
oscSender();
  runGUI();
  food.run();
  for (int i = preys.size()-1; i>=0; i--) {
    Prey p = preys.get(i);

    if (p.getSex() == 1) {
      DNA newDNA = p.getDNA();
      newDNA.mutate(0.01);
      Prey childPrey = p.reproduce(newDNA);   
      if (childPrey!= null) {
        preys.add(childPrey);
      }
    }
  }


  for (int i = movers.size()-2; i>=0; i--) {
    for (int j = movers2.size()-2; j>=0; j--) {

      Mover m = movers.get(i);
      Mover m2 = movers2.get(j);

        m.aging();
     
      
        m2.aging();
      

      m.applyBehaviorsInternal(m, food, 5, 0, sV3);
      m2.applyBehaviorsInternal(m2, food, 5, 0, sV3);
      //m.applyBehaviors(m2, new PVector(0, 0), 5, 0, sV2, sV3);
      //m2.applyBehaviors(m, new PVector(0, 0), 5, 0, sV2, sV3);

      PVector forcea3 = a.attract(m2, 0.01);
      PVector forcea23 = a2.attract(m2, 0.01);
      PVector force3 = PVector.add(forcea3, forcea23);
      PVector foodForce = food.attract(m, 0.01);

      force3 = PVector.add(force3, foodForce);



      PVector forcea = a.attract(m, 0.01);
      PVector forcea2 = a2.attract(m, 0.01);
      PVector force = PVector.add(forcea, forcea2);
      //m.applyBehaviors(m2, foodForce, 20, sV1, sV2, sV3); //movers, PVector force, float sepAmount, float attractAmount, float noiseAmount, float noiseSpeed
      m.update(constrain(map(value,0.14,100,1,0.5),0,1));
      m.checkEdges();
      m.display(255);
      m.eat(food);
      if (m.dead() == true) {
        println("dead");

        movers.remove(i);
      }

      if (m2.getSex() == 1) {
        if (m2.getDNAgenes(1)>= 0.5) {
          if (random(0, 1)<1*m2.getSympathyRate()) {
            if (random(0, 1)<0.001) {
              println("yey");
              //triggerOut();
              child = m2.reproduce(m.getDNA());
              DNA newDNA = child.getDNA();
              newDNA.mutate(0.01);
              if (child!= null) {
                println(child.getDNAgenes(0));

                // Genome 0 determines sexuality
                if (random(0,1) >= 0.5) {  
                  movers.add(child);
                }
                else  {
                  movers2.add(child);
                }
              }
              m2.resetSympathyRate();
            }
          }
        }
      }
      m2.update(constrain(map(value,0.14,100,1,0.5),0,1));
      m2.checkEdges();
      m2.display(0);
      m2.eat(food);

      if (m2.dead() == true) {
        println("dead");
        //triggerOut();
        movers2.remove(j);
      }
    }
  }
  //for (Mover child : movers) {
  //  child.applyBehaviors(movers2, force, 20, sV1, sV2, sV3); //movers, PVector force, float sepAmount, float attractAmount, float noiseAmount, float noiseSpeed
  //  child.update();
  //  child.checkEdges();
  //  child.display(255);
  //}

  //for (Mover child : movers2) {
  //  child.applyBehaviors(movers, force3, 20, sV1, sV2, sV3);
  //  child.update();
  //  child.checkEdges();
  //  child.display(0);
  //}

  a.noiseM();
  a.hover(mouseX, mouseY);

  a.display();
  a.checkEdges();

  a2.noiseM2();
  a2.display();
  a2.checkEdges();
}

void born(float x, float y) {
  PVector l = new PVector(x, y);
  DNA dna = new DNA();
  movers2.add(new Mover(l, dna));
}

void mousePressed() {
  //born(mouseX, mouseY);
  a.clicked(mouseX, mouseY); 
  a2.clicked(mouseX, mouseY);
}

void mouseReleased() {
  if (mouseX > width*0.8) {
    a.stopDragging(); 
    a2.stopDragging();
  }
}

void initGUI() {
  //1D SLider
  cp5 = new ControlP5(this);
  cp5.addSlider("sliderValue")
    .setPosition(25, height-125)
    .setSize(50, 100)
    .setRange(0, 10000)
    ;
  cp5.addSlider("sliderValue2")
    .setPosition(125, height-125)
    .setSize(50, 100)
    .setRange(0, 10000)
    ;
  cp5.addSlider("sliderValue3")
    .setPosition(225, height-125)
    .setSize(50, 100)
    .setRange(0, 10000)
    ;
  smooth();
}

void runGUI() {
  //attraction force amount
  sV1 = map(sliderValue, 0, 10000, 0, .01);
  //noise Force amount 
  sV2 = map(sliderValue2, 0, 10000, 0.0001, 2.5001);
  //Noise Speed
  sV3 = map(sliderValue3, 0, 10000, 0.01, 20);
  //println(sV2);
}



void reset() {
 // myPort.stop();
  frameCount = -1;
}

//void serialEvent(Serial myPort) {
//  if (myPort.available() > 0) {
//    String  message = myPort.readStringUntil(13);
//    if (message != null && triggerO == false) {
//      values = float(split(trim(message), "split"));
//      value = values[0];
//      value2 = values[1];
//    }
//  }
//}

//void mouseClicked() {
//  if (myPort.available() > 0) {
//    myPort.write("z"); 
//t4=100;

//    //myPort.write("i"); 
//    delay(75);
//    myPort.write("x"); 
//    delay(50);
//  }
//}

//void triggerOut() {
//   triggerO = true;
//t4=100;
//   if (myPort.available() > 0) {
//    myPort.write("z"); 
//    //myPort.write("i"); 
//    delay(75);
//    myPort.write("x"); 
//    delay(50);
//  }
//     triggerO = false;

//}
void keyPressed() {

  if (key == 'q') reset();
}

void oscSender() {
  println(value);
  println(value2);
  rect(map(value, 0, 100, 0, width), map(value2, 0, 100, 0, height), 25, 25);

  OscMessage myOscMessage = new OscMessage("/floatx");
  x = map(value, 0, 100, 0, 10);
  myOscMessage.add(x);      
  y = map(value2, 0, 100, 0, 10);
  myOscMessage.add(y);       
  z = constrain(map(value,20,100,0,20),0,20);
  myOscMessage.add(z); 
  l3 = constrain(map(value,20,100,0,1),0,1);
  myOscMessage.add(l3); 

  myOscMessage.add(t4);
  
  //OscP5.flush(myOscMessage, myRemoteLocation);
        t4=0;

  
}
