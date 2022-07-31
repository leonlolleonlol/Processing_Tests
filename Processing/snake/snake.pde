ArrayList<Integer> xPos = new ArrayList();
ArrayList<Integer> yPos = new ArrayList();
int taille = 10;
int vitesseX = 0;
int vitesseY = 0;
int pommeX;
int pommeY;
boolean game=true;
int once=0;
int applesEaten=0;

void generateApples() {
  pommeX = (int)random(50);
  pommeY = (int)random(50);
}

void setup() {
  size(500, 500);

  xPos.add(25);
  yPos.add(25);

  generateApples();
}

void draw() {
  frameRate(applesEaten+10);
  background(0);
  if (game==true) {
    if (xPos.get(0) == pommeX && yPos.get(0) == pommeY) {
      generateApples();
      xPos.add(0);
      yPos.add(0);
      applesEaten++;
    }
    //setting position for squares behind head
    for (int x = xPos.size()-1; x > 0; x--) {
      xPos.set(x, xPos.get(x-1));
      yPos.set(x, yPos.get(x-1));
    }
    //setting position for head
    xPos.set(0, xPos.get(0) + vitesseX);
    yPos.set(0, yPos.get(0) + vitesseY);
    //losing if out of bounds
    if (xPos.get(0)*10 < 0 || xPos.get(0)*10 > width || yPos.get(0)*10 < 0 || yPos.get(0)*10 > height) {
      game=false;
    }
    //grid
    fill(255);
    stroke(0);
    for (int x = 0; x < 50; x++) {
      for (int y = 0; y < 50; y++) {
        square(x * 10, y * 10, 10);
      }
    }
    //apple
    fill(255, 0, 0);
    square(pommeX*10, pommeY*10, 10);
    //squares behind head
    fill(0, 255, 0);
    for (int x = 0; x < xPos.size(); x++) {
      square(xPos.get(x)*10, yPos.get(x)*10, taille);
    }
    //head of snake
    fill(0, 155, 0);
    square(xPos.get(0)*10, yPos.get(0)*10, taille);
    for (int x = xPos.size()-1; x > 0; x--) {
      if (xPos.get(0) == xPos.get(x) && yPos.get(0) == yPos.get(x)) {
        game=false;
      }
    }
  } else {
    stroke(0);
    for (int x = 0; x < 50; x++) {
      for (int y = 0; y < 50; y++) {
        fill(random(255), random(255), random(255));
        square(x * 10, y * 10, 10);
      }
    }
    if (once==0) {
      println("YOU LOST!"+" You ate "+applesEaten+" apple(s)!");
    }
    once=1;
  }
}

void keyPressed() {
  switch(keyCode) {
  case UP:
    if (vitesseY != 1) {
      vitesseY = -1;
      vitesseX = 0;
    }
    break;
  case DOWN:
    if (vitesseY != -1) {
      vitesseY = 1;
      vitesseX = 0;
    }
    break;
  case RIGHT:
    if (vitesseX != -1) {
      vitesseX = 1;
      vitesseY = 0;
    }
    break;
  case LEFT:
    if (vitesseX != 1) {
      vitesseX = -1;
      vitesseY = 0;
    }
    break;
  }
}
