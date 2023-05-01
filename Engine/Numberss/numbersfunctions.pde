

void numbers() {
  if (frameCount%5==1);
  {
    //noFill(); //for chaos
    //stroke(100*noise(random(-1000, 1000)));//100*noise... for chaos
    strokeWeight(2);
    stroke(random(0, 50));
    fill(0);
    rect(0, 0, 100-2*frameCount%150, height);
    rect(1200, 0, width, 200);
    noStroke();
    rect(0, 0, 200-frameCount%25, height);
  }
  float r1 = random(0.50000003, 0.9);
  float r2 = 0.001+random(5000.0020, 12000);
  String sa = nf(r2, 12, 5);
  String sd = nf(random(10000000.0)+r2+r1, 10, 4);
  String sad = nf(frameCount/r2, 5, 5) ;
  String ad = nf(frameCount%200*r2, round(random(2, 20)), 25) ;
  fill(50);
  String Te = "_0101_Syntax_010001111_xatnyS_000111_";
  text(Te, 1200, 0+frameCount%200, width, 200);
  // Ladebalken
  fill(random(50, 80));
  text(Te, 1200-frameCount%200, 0, width, 200);
  fill(random(100, 120));
  text(Te, 1200-frameCount%30, 20, width, 200);
  fill(50);
  text(Te, 1200-frameCount*2%200, 40, width, 200);
  text(Te, 1200-frameCount%15, 60, width, 200);
  fill(random(30, 120));
  text(Te, 1200-frameCount%12, 80, width, 200);
  fill(random(30, 50));
  text(Te, 1200-frameCount%90, 100, width, 200);
  fill(random(50, 100));
  text(Te, 1200-frameCount%5, 120, width, 200);
  fill(random(135));
  text(Te, 1200-frameCount%65, 140, width, 200);





  text(Te, 1200+frameCount%150, random(140, 180), width, 200);


  text(sa, 10, 10, 70, 80);
  text(sd, 40, 40, 70, 80);
  text(sad, 1300-random(60), random(height), random(-550, 100));
  println(n1);
  fill(185);
  for (int i = 2; i<15; i++) {
    if (frameCount%random(i)==1) text(sa, 10, 700*noise(frameCount), 70, 80*noise(frameCount));
  }
  if (frameCount%3==1) text(sa, 10+frameCount%(100), 700*noise(frameCount), 70, 80*noise(frameCount));
  if (frameCount%4==1) text(sa, 10+random(50), 700*noise(frameCount), 70, 80*noise(frameCount));
  if (frameCount%5==1) text(sa, 10+random(30), 700*noise(frameCount), 70, 80*noise(frameCount));
  if (frameCount%6==1) text(sa, 10+random(90), 700*noise(frameCount), 70, 80*noise(frameCount));
  if (frameCount%7==1) text(sa, 10+random(30), 700*noise(frameCount), 70, 80*noise(frameCount));
  if (frameCount%8==1) text(sa, 10+random(2), 700*noise(frameCount), 70, 80*noise(frameCount));
  if (frameCount%9==1) text(sa, 10+random(90), 700*noise(frameCount), 70, 80*noise(frameCount));
  if (frameCount%10==1) text(sa, 10+random(25), 700*noise(frameCount), 70, 80*noise(frameCount));

  text(sd, 60, 65, n1/3);
  // text(sd, width/2, height/2, 0);
  //text(sd, width/2, height/2, 25);
  fill(0);


  text(sd, width/2, height/2+100, random(1, 100));
  text(sa, width/2-20, height/2+10, frameCount%200+random(1, 100));

  text(ad, width/2-150, height/2-80, random(1, 100));

  text(sad, width/2+50, height/2, random(1, 100));

  beginShape();
  scale(noise(random(2, 10)));
  translate(width/2, height/2, 0);

  text(sd, width/2, height/2, 0);
  endShape();
  fill(random(50, 150));
  text(sd, random(width), random(height), random(1, 160));
  if (frameCount%200==1) background(0);

  //text(sd, width/2-20, height/2-100, random(1, 100));
}
