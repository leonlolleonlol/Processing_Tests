int angle1=0;
int angle2=0;
int angle3=800;
int angle4=0;
int heightrect1=0;
int widthrect1=0;
int heightrect2=0;
int widthrect2=0;
int r,g,b;
void setup()
{
  background(0);
 size(800, 800,P2D);
 rectMode(CENTER);
}
void draw()
{
  if(angle1!=800)
{
 push();
 translate(angle1,angle2);
 rotate(angle1/(heightrect1+1));
 fill(r,g,b);
 rect(0,0,heightrect1,widthrect1);
 angle1+=5;
 pop();
  }
  else
  {
    angle1=0;
    angle2=(int)random(800);
    heightrect1=(int)random(200);
    widthrect1=(int)random(200);
    r=(int)random(255);
    g=(int)random(255);
    b=(int)random(255);
  }
  if(angle3!=0)
{
 push();
 translate(angle3,angle4);
 rotate(-angle1/(heightrect2+1));
 fill(b,r,g);
 rect(0,0,heightrect2,widthrect2);
 angle3-=5;
 pop();
  }
  else
  {
    angle3=800;
    angle4=(int)random(800);
    heightrect2=(int)random(200);
    widthrect2=(int)random(200);
  }
  if(mousePressed)
  {
    background(0);
  }
}
