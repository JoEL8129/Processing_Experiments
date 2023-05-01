// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Prey {
  // genetic integration
  DNA dna;
  float health; 

  float maxforce;    // Maximum steering force
  float maxspeed;  
  float r;
  PVector position;
  PVector noiseForce;
  PVector velocity;
  PVector acceleration;
  PVector steerFlow;

  int count; // while count == 1 - chance to reproduce gets active // chance to reproduce is multiplied by Sympathy
  float contactCount; // Sympathy

  float mass;
  float xoff;       // For perlin noise
  float yoff;
  float xoff2;       // For perlin noise
  float yoff2;
  float vx2 ;
  float vy2;

  Prey(PVector l, DNA dna_) {
    dna = dna_;
    position = l.get();

    //position = new PVector(random(500), random( 500));

    xoff = random(1000);
    yoff = random(1000);

    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    //r = 30;
    //DNA MApping 
    //...
    //Gen 1 == 0 or 1 - male or female
    mass = map(dna.genes[11], 0, 1, 1, 6);
    health = map(dna.genes[12], 0, 1, 25, 200);
    maxspeed = map(dna.genes[13], 0, 1, 0.01, 3);
    maxforce = map(dna.genes[14], 0, 1, 0.01, 0.25);
    r = map(dna.genes[15], 0, 1, 5, 15);
  }

  void run() { // ggf.aus draw hierher für cleanup der draw
  }

  DNA getDNA() {
    return dna;
  }
  float getDNAgenes(int gene) {
    return dna.genes[gene];
  }

  float getSympathyRate() {

    return contactCount;
  }

  void resetSympathyRate() {
    contactCount=0;
  }

  float getSex() {
    return count;
  }


  void eat(Food f) {
    
    ArrayList<PVector> food = f.getFood();
    //food check if touched - maybe for Sex same principle //PVector partnerposition = ? 
    for (int i = food.size()-1; i>=0; i--) {
      PVector foodposition = food.get(i);
      float d = PVector.dist(position, foodposition);
      if (d <r/2) {
        health += 100;
        food.remove(i);
      }
    }
  }

  Prey reproduce(DNA father) {


    DNA childDNA = dna.crossover(father); // dna.mix
    childDNA.mutate(0.01);
    PVector babyPosition = new PVector (position.x + random (25, 50), position.y +random(25, 50));

    return new Prey(babyPosition, childDNA);
  }

  void applyForce(PVector force) {

    acceleration.add(force);
  }

  void sendPos() {

    OscMessage myOscMessage = new OscMessage("/floatx");
    myOscMessage.add(map(position.x, 0, width, -10-1, 10-1));
    myOscMessage.add(map(position.y, 0, height, 0.0001-1, 0.75-1));
    OscP5.flush(myOscMessage, myRemoteLocation);
  }



  void applyBehaviors(Prey p, PVector force, float sepAmount, float attractAmount, float noiseAmount, float noiseSpeed) {


    PVector f = PVector.div(force, mass);  
    PVector separateForce = separate(preys);
    PVector noiseForce = PVector.div(noiseMove(noiseSpeed), mass);

    noiseForce.mult(noiseAmount);
    f.mult(attractAmount);

    separateForce.mult(sepAmount);

    applyForce(noiseForce);
    applyForce(f);
    applyForce(separateForce);
  }




  PVector noiseMove(float Speed) {
    float vx = map(noise(xoff), 0, 1, 0, width);
    float vy = map(noise(yoff), 0, 1, 0, height);
    //position.x = vx ;
    //position.y = vy ;
    PVector target = new PVector(vx, vy);
    PVector desired = PVector.sub(target, position);
    desired.normalize();
    desired.mult(Speed);
    PVector steer = ( PVector.sub(desired, velocity));
    //xoff += 0.01;
    //yoff += 0.01;
    steer.limit(maxforce); 
    steer.mult(1);

    xoff += map(sin(radians(frameCount/2%360)), -1, 1, 0.004, 0.006);
    yoff += map(sin(radians(frameCount/2%360)), -1, 1, 0.004, 0.006);

    return steer;
    //float vx2 = map(noise(xoff2), 0, 1, -1, 1);
    //float vy2 = map(noise(yoff2), 0, 1, -1, 1); 
    //noiseForce = new PVector(vx2, vy2);
    //applyForce(PVector.mult(noiseForce, amount));
    //xoff += 0.010;
    //yoff += 0.010;
  }
  void update() {
    //println(contactCount);
    velocity.add(acceleration);

    position.add(velocity);
    acceleration.mult(0);
    health -= 0.01;

    //velocity.limit(50);
  }

  void display(float col) {
    ellipseMode(CENTER);
    stroke(col, 0, 0);
    strokeWeight(2);
    fill(col, 0, health);



    //velocity.add(new PVector(vx, vy));
    //ellipse(position.x, position.y, r, r);
rect(position.x, position.y,r,r);

    //xoff2 += map(sin(radians(frameCount%360)), -1, 1, 0.02, 0.013);
    //yoff2 += map(sin(radians(frameCount%360)), -1, 1, 0.02, 0.013);
  }


  PVector separate (ArrayList<Prey> preys) {
    count = 0;

    float desiredseparation = r*2;
    PVector sum = new PVector();
    // For every boid in the system, check if it's too close
    for (Prey other : preys) {
      float d = PVector.dist(position, other.position);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(position, other.position);
        diff.normalize();
        diff.div(d);        // Weight by distance
        sum.add(diff);
        count++;
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      sum.div(count);
      // Our desired vector is the average scaled to maximum speed
      sum.normalize();
      sum.mult(maxspeed);
      // Implement Reynolds: Steering = Desired - Velocity
      sum.sub(velocity);
      sum.limit(maxforce);
      contactCount += 0.0005;
    }
    return sum;
  }

  boolean dead() {
    if (health < 0.0) {
      return true;
    } else {
      return false;
    }
  }




  void checkEdges() {

    if (position.x > width) {
      velocity.x *= -0.5;
      position.x = width;
    }
    if (position.x < 0) {
      velocity.x *= -0.5;
      position.x = 0;
    }

    if (position.y > height) {
      velocity.y *= -0.5;
      position.y = height;
    }

    if (position.y < 0) {
      velocity.y *= -0.5;
      position.y = 0;
    }
  }
}
