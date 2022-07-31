// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com
// Example 5-9: Simple Gravity
float speed = 0;   // speed of square

// A new variable, for gravity (i.e. acceleration).
// We use a relatively small number (0.1) because this accelerations accumulates over time, increasing the speed.
// Try changing this number to 2.0 and see what happens.
float gravity = 1;

void setup() {
  size(800, 800);
  rectMode(CENTER);
}

void draw() {
  background(0);

  // Display the square
  fill(255, 0, 0);
  stroke(0);
  ellipse(mouseX, y, 10, 10);
  fill(0, 255, 0);
   for (int a=0; a<xobs.length; a++)
  {
  rect(xobs[a], 750, 100, 10);
  }
  text("x position:"+mouseX, 700, 100);
  text("y position:"+(int)y, 700, 150);
  text("gravity:"+abs(decrease), 700, 200);
  // Add speed to location.
  y = y + speed;

  // Add gravity to speed.
  speed = speed + gravity;

  // If square reaches the bottom
  // Reverse speed
  for (int a=0; a<xobs.length; a++)
  {
    if (y > height||(mouseX>xobs[a]-50&&mouseX<xobs[a]+50&&y>740))
    {
      // Multiplying by -0.95 instead of -1 slows the square down each time it bounces (by decreasing speed).
      // This is known as a "dampening" effect and is a more realistic simulation of the real world (without it, a ball would bounce forever).
      speed = abs(speed) * decrease;
    }
  }
}
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP)
    {
      decrease-=0.001;
    } else if (keyCode == DOWN)
    {
      decrease+=0.001;
    }
  }
}
float y = 0;     // y location of square
float decrease=-0.95;
int []xobs={(int)random(100, 800), (int)random(100, 800),(int)random(100, 800), (int)random(100, 800), (int)random(100, 800)};
