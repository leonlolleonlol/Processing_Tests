void setup() {
  fullScreen();
  frameRate(1000);
}
int y=0;
int x=0;
int sc=10;
void draw() {
  smooth();
  noStroke();
  if (x!=(width/sc))
  {
    if ((y!=height/sc))
    {

      fill(random(255), random(255), random(255));
      square(x*sc, y*sc, sc);
      y++;
    }
    if(y%(height/sc)==0)
    {
    x++;
    y=0;
    }
  }
  else{y=0;x=0;}
}
