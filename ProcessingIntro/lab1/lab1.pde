void setup() {
  size(800,400);
  background(255,255,255);
}

void draw() {
  
  int radius=40;

  stroke(0,0,0);
  rectMode(RADIUS);
 
  line(width/2,radius, radius,height/2);
//  line(height/2,radius,radius,width/2);
  
  fill(255,0,0);
  rect(width/2,radius,radius,radius);
  
  fill(0,0,255);
  rect(radius,height/2,radius,radius); 
}
