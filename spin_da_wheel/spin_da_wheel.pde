PImage img;

void setup()
{
  size(800, 800, P3D);
  img = loadImage("money-wheel-just-for-fun-lol.png");
  imageMode(CENTER);
}

void draw()
{
  if (onetime)
  {
    if (angle>0)
    {
      background(0);
      translate(width/2, height/2);
      fill(255, 255, 0);
      triangle(0, -230, -25, -300, 25, -300);
      rotateZ(turn*PI/180);
      image(img, 0, 0);
      turn+=angle;
      angle-=0.01;
    } else
    {
      spin=turn;
      while (spin>360)
      {
        spin-=360;
      }
      switch(floor(spin/12.85714)+1)
      {
      case 1:
      case 15:
        money+=1000;
        break;
      case 2:
      case 16:
        money+=50;
        break;
      case 3:
      case 17:
        money+=2500;
        break;
      case 4:
      case 18:
        money+=10;
        break;
      case 5:
      case 19:
        money+=350;
        break;
      case 6:
      case 20:
        money+=400;
        break;
      case 7:
      case 21:
        money+=100;
        break;
      case 9:
      case 23:
        money+=300;
        break;
      case 10:
      case 24:
        money+=450;
        break;
      case 11:
      case 25:
        money+=250;
        break;
      case 12:
      case 26:
        money+=150;
        break;
      case 13:
      case 27:
        money+=500;
        break;
      case 14:
      case 28:
        money+=200;
        break;
      }
      turn=0;
      angle=random(5, 20);
      onetime=false;
    }
  } else
  {
    background(0);
    translate(width/2, height/2);
    fill(255, 255, 0);
    triangle(0, -230, -25, -300, 25, -300);
    image(img, 0, 0);
  }
  fill(255);
  textSize(64);
  text("Money:"+money+"$",-350,-350);
}
void mousePressed()
{
  onetime=true;
}
float turn=0;
float angle=random(5, 20);
float spin;
int money=0;
boolean onetime;
