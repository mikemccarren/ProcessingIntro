float radius=40.0;
float xPos = radius-1.0;
float change = 1.0;

void setup() {
  size(800,400);
//  background(255,255,255);
  frameRate(30);
}

void draw() {
  background(255,255,255,0);
  stroke(0,0,0);
  rectMode(RADIUS);
  xPos = xPos + change;
  
 
//  line(width/2,radius, radius,height/2);
  line(width/2,radius, xPos,height/2);
  
  fill(255,0,0);
  rect(width/2,radius,radius,radius);

//  xPos = xPos + change;
  fill(0,0,255);
  rect(xPos,height/2,radius,radius);
  if ((xPos+radius) == width) {
    change = -1.0;
  }
  if ((xPos-radius) == 0) {
    change = 1.0;
  }
}
