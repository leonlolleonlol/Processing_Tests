boolean touchx=false;
boolean touchy=false;
boolean touch=false;
boolean lose=true;
boolean start=false;
int addx=100;
int addy=50;
int posx;
int posy;
void setup()
{
  size(900, 800);
  background(0);
  rectMode(CENTER);
  noStroke();
  frameRate(30);
  ellipseMode(RADIUS);
  // Set the starting position of the shape
  xpos = width/2;
  ypos = height/2;
}
void mouseClicked() {
  start=true;
}

void draw()
{
  if (mouseX<width/2+50&&mouseX>width/2-50&&mouseY<height/2+25&&mouseY>height/2-25)
  {
    touch=true;
  } else
  {
    background(0);
    addx=100;
    addy=50;
    touch=false;
    textSize(16);
    posx=-25;
    posy=5;
  }
  if (touch)
  {
    addx=150;
    addy=75;
    textSize(32);
    posx=-50;
    posy=10;
  }
  fill(r, g, b);
  rect(xpos, ypos, addx, addy);
  fill(255);
  String s="START!";
  text(s, xpos+posx, ypos+posy);
  if (start)
  {
    if (ypos<760&&ypos>40&&xpos>40&&xpos<860)
    {
      fill(r, g, b);
      circle(xpos, ypos, 10);
      touch=false;
      xpos = xpos + ( (int)xspeed * xdirection );
      ypos = ypos + ( (int)yspeed * ydirection );
      // Test to see if the shape exceeds the boundaries of the screen
      // If it does, reverse its direction by multiplying by -1
      for (int a=0; a<100; a++)
      {
        if ((int)xpos==mouseX-50+a&&(int)ypos>740&&(int)ypos<760||(int)xpos==mouseX-50+a&&(int)ypos>40&&(int)ypos<60)
        {
          touchx=true;
          acc++;
          count+=1;
          r=(int)random(255);
          g=(int)random(255);
          b=(int)random(255);
        } else if ((int)ypos==mouseY-50+a&&(int)xpos>840&&(int)ypos<860||(int)ypos==mouseY-50+a&&(int)xpos>40&&(int)xpos<60)
        {
          touchy=true;
          acc++;
          count+=1;
          r=(int)random(255);
          g=(int)random(255);
          b=(int)random(255);
        }
      }
      if (touchx)
      {
        ydirection *= -1;
        xspeed+=0.1;
        yspeed+=0.1;
        touchx=false;
      }
      if (touchy)
      {
        xdirection *= -1;
        xspeed+=0.1;
        yspeed+=0.1;
        touchy=false;
      }

      // Draw the shape
      background(0);
      ellipse(xpos, ypos, rad, rad);
      rect(mouseX, 750, 100, 10);
      rect(mouseX, 50, 100, 10);
      rect(850, mouseY, 10, 100);
      rect(50, mouseY, 10, 100);
      if (acc>0&&count!=0)
      {
        xspeed+=1;
        yspeed+=1;
        acc=0;
      }
      textSize(32);
      fill(r, g, b);
      String show="You saved the ball "+count+" times!";
      text(show, width/2, 50);
      textSize(16);
      String showxspeed="Horizontal speed: "+xspeed+" pixels/sec";
      text(showxspeed, width/2+50, 100);
      String showyspeed="Vertical speed: "+yspeed+" pixels/sec";
      text(showyspeed, width/2+50, 125);
    } else
    {
      background(255);
      if (lose)
      {
        println("You saved the ball "+count+" times!");
      }
      lose=false;
      start=false;
    }
  }
}
int rad = 10;        // Width of the shape
float xpos, ypos;    // Starting position of shape
int count=0;
int acc=0;
float xspeed = 12;// Speed of the shape
float yspeed = 6;// Speed of the shape
int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom
int r=(int)random(255);
int g=(int)random(255);
int b=(int)random(255);
