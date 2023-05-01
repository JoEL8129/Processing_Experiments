// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// A class for a draggable attractive body in our world

class Attractor {

  float mass;    // Mass, tied to size
  float G;      // Gravitational Constant
  float noiseWeight;
  PVector position;   // position
  PVector velocity;
  PVector acceleration;

  boolean dragging = false; // Is the object being dragged?
  boolean rollover = false; // Is the mouse over the ellipse?
  PVector dragOffset;  // holds the offset for when object is clicked on
  float xoff;       // For perlin noise
  float yoff;
  float xoff2;       // For perlin noise
  float yoff2;
  Attractor() {
    position = new PVector(width/2+random(-200, 200), height/2+(random(-200, 200)));
    mass = 20;
    G = 5;
    dragOffset = new PVector(0.0, 0.0);
    xoff = random(1000);
    yoff = random(1000);
    xoff2 = random(1000);
    yoff2 = random(1000);
    velocity = new PVector(0, 0);
    noiseWeight = 1;
  }

  PVector attract(Mover m, float maxspeed) {
    float vx = map(noise(xoff), 0, 1, -2, 6);
    float vy = map(noise(yoff), 0, 1, -2, 6);

    PVector force = PVector.sub(position, m.position);   // Calculate direction of force
    float d = force.mag(); 
    d = constrain(d, -5, 15);// Distance between objects
    //d = constrain(d, -5+vx, 15+vy);
    force.mult(maxspeed);// Limiting the distance to eliminate "extreme" results for very close or very far objects
    force.normalize();                                  // Normalize vector (distance doesn't matter here, we just want this vector for direction)
    float strength = (G * mass * m.mass) / (d * d *5 );     // Calculate gravitional force magnitude
    force.mult(strength);     // Get force vector --> magnitude * direction
    return force;
  }

  // Method to display
  void display() {
    ellipseMode(CENTER);
    strokeWeight(4);
    stroke(0);
    if (dragging) fill (50);
    else if (rollover) fill(100);
    else fill(175, 200);
    ellipse(position.x, position.y, mass*2, mass*2);
  }

  // The methods below are for mouse interaction
  void clicked(int mx, int my) {
    float d = dist(mx, my, position.x, position.y);
    if (d < mass) {
      dragging = true;
      //dragOffset.x = position.x-mx;
      //dragOffset.y = position.y-my;
    }
  }

  void hover(int mx, int my) {
    float d = dist(mx, my, position.x, position.y);
    if (d < mass) {
      rollover = true;
    } else {
      rollover = false;
    }
  }

  void stopDragging() {
    dragging = false;
  }



  void noiseM() {
    if (dragging) {
      float vx = map(noise(xoff), 0, 1, 0, width);
      float vy = map(noise(yoff), 0, 1, 0, height);
      position.x = vx ;
      position.y = vy ;
      //xoff += 0.01;
      //yoff += 0.01;
      xoff += map(sin(radians(frameCount/4%360)), -1, 1, 0.004, 0.013);
      yoff += map(sin(radians(frameCount/4%360)), -1, 1, 0.004, 0.013);
    }
  }

  void noiseM2() {
    noiseWeight = 0.5;
    if (dragging) {
      float vx = map(noise(xoff2), 0, 1, -1, 1);
      float vy = map(noise(yoff2), 0, 1, -1, 1);

      acceleration = new PVector(vx, vy);



      acceleration.mult(noiseWeight);
      velocity.add(acceleration);
      // velocity.normalize();
      position.add(velocity);
      xoff2 += 0.2;
      yoff2 += 0.2;
      acceleration.mult(0);
      //xoff += map(sin(radians(frameCount/2%360)), -1, 1, 0.004, 0.013);
      //yoff += map(sin(radians(frameCount/2%360)), -1, 1, 0.004, 0.013);
    }
  }

  void checkEdges() {

    if (position.x > width) {
      velocity.x *= -0.5;
      noiseWeight = 0;
      position.x = width;
    }
    if (position.x < 0) {
      velocity.x *= -0.5;
      position.x = 0;
      noiseWeight = 0;
    }

    if (position.y > height) {
      velocity.y *= -0.5;
      position.y = height;
      noiseWeight = 0;
    }

    if (position.y < 0) {
      velocity.y *= -0.5;
      position.y = 0;
      noiseWeight = 0;
    }
  }
}
