int width = 800; //<>//
int height = 400;

// edge length of square to use for calculations
int squareSideWidth = 50;

// int to track bottom rect location
int bottomRecCurrentX = 0;
int bottomRecCurrentY = height / 2;

  
// minimum and maximum Y values for up and down
int minY = 0;
int maxY = height - squareSideWidth;

// enum value to track direction of rect
Direction direction = Direction.REVERSE;

boolean running = true;


void setup() {
  println(System.getProperty("java.version"));

  size(800, 400);
//  text("Press the space bar to reverse the blue rectangles movement",0,0);
}

void draw() {

  if (running) {

    background(255);

    int topRectX = (width / 2) - (squareSideWidth / 2);
    int topRectY = 0;

    int bottomRectX = bottomRecCurrentX;
    int bottomRectY = bottomRecCurrentY;

    stroke(0);
    line(topRectX + (squareSideWidth / 2), topRectY+ (squareSideWidth / 2), bottomRectX+ (squareSideWidth / 2), bottomRectY+ (squareSideWidth / 2));

    fill(255, 0, 0);
    rect(topRectX, topRectY, squareSideWidth, squareSideWidth);

    fill(0, 0, 255);
    rect(bottomRectX, bottomRectY, squareSideWidth, squareSideWidth);

    step();
  }
}

void step() {

  // the X value to reverse the direction
  int reverseOn = width - squareSideWidth;
  
  // minimum Y value
  int minY = squareSideWidth / 2;
  int maxY = height - (squareSideWidth / 2);

  // how to decide which way to go
  if (Direction.REVERSE.equals(direction) && bottomRecCurrentX == 0) {
    direction = Direction.FORWARD;
  } else if (Direction.FORWARD.equals(direction) && bottomRecCurrentX == reverseOn) {
    direction = Direction.REVERSE;
  }

  // step instructions for current step
  if (Direction.FORWARD.equals(direction)) {
    bottomRecCurrentX++;
  } else if (Direction.REVERSE.equals(direction)) {
    bottomRecCurrentX--;
  }
}

void keyPressed() {
  if (key == ' ') {
    if (Direction.REVERSE.equals(direction)){
      direction = Direction.FORWARD;
    } else if (Direction.FORWARD.equals(direction)) {
      direction = Direction.REVERSE;
    }
  }
  if (key == CODED) {
    if (keyCode == UP) {
      // move up
//      println("Up");
      if ((bottomRecCurrentY-5) < minY) {
//        println("Hit the top");
        bottomRecCurrentY = minY;
      } else {
        bottomRecCurrentY -= 5;
      }
    } else if (keyCode == DOWN) {
      // move down
//      println("Down");
      if ((bottomRecCurrentY+5) > maxY) {
//        println("Hit the bottom");
        bottomRecCurrentY = maxY;
      } else {
        bottomRecCurrentY += 5;
      }
    }
  }
}

void mousePressed() {
  if ( (mouseX >= bottomRecCurrentX) && (mouseX <= (bottomRecCurrentX + squareSideWidth)) &&
       (mouseY >= bottomRecCurrentY) && (mouseY <= (bottomRecCurrentY + squareSideWidth))) {
         println("In the square");
         running = !running;
         if (running) {
           noLoop();
         }
  } else {
    bottomRecCurrentY = mouseY - (squareSideWidth/2);
  }
}

void mouseReleased() {
  loop();
}

public enum Direction {
  FORWARD, REVERSE
}
