void setup()
{
  fullScreen();
}
void draw()
{
  frameRate(60);
  background(x/5, g, b);
  if (x/5<325)
  {
    fill(127-x/5, 127-g, 127-b);
    circle(width/2, height/2, x);
    stroke(255);
    line(100+x, 0, 100+x, height);
    line(0, 100+x, width, 100+x);
    line(width-100-x, 0, width-100-x, height);
    line(0, height-100-x, width, height-100-x);
    x=x+1;
  } else
  {
    x=0;
    g=random(255);
    b=random(255);
  }
}
int x=0;
float g=random(255);
float b=random(255);
