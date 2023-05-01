class Food {
  ArrayList<PVector> food;
  DNA foodDNA;
  float sweetness;
  float bitterness; 
  float sourness;
  float mass;    // Mass, tied to size
  float G; 
  PVector force;

  Food(int num) {
    mass = 20;
    G = 5;
    food = new ArrayList();
    for (int i = 0; i < num; i++) {

      food.add(new PVector(random(width), random(height)));
    }
  }


  PVector attract(Mover m, float maxspeed) {
    
    //PVector[] forces = new PVector[food.size()];
for(PVector f : food) {
      PVector foodPos = new PVector(f.x, f.y); 
      force = PVector.sub(foodPos, m.position);   // Calculate direction of force
      float d = force.mag();
      d = constrain(d, -5, 15);
      force.mult(maxspeed);
      force.normalize();                                  // Normalize vector (distance doesn't matter here, we just want this vector for direction)

      float strength = (G * mass * m.mass) / (d * d *5 );     // Calculate gravitional force magnitude
      force.mult(strength);     // Get force vector --> magnitude * direction
}
    return force;
  }


  void add(PVector l) {
    food.add(l.get()); // l.copy()
  }


  void run() {
    for (PVector f : food) { 

      stroke(0);
      fill(sourness, sweetness, bitterness);
      ellipse(f.x, f.y, 15, 15);
    } 

    if ( random(1) < 0.1) {
      food.add(new PVector(random(width), random(height)));
    }
  }

  ArrayList getFood() {
    return food;
  }
}
