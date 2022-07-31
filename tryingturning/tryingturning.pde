void setup()
{
  size(800, 800,P3D);
}
void draw()
{
  if(angle<90)
  {
  background(0);
  translate(70,100);
  rotateY(angle*PI/90);
  rect(0, 0, 60, 100);
  angle++;
  }
}
int angle=0;
