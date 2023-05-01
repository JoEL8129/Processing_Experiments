void blackcircle() { 
  pushMatrix();
  noStroke();
  fill(0);
  translate(0,0,-500);
  ellipse(width/2,height/2,450+frameCount%250,450+frameCount%250);
  popMatrix();
  
  
} 
