void setup()
{
  background(202, 164, 114);
  size(1000, 800);
  ellipseMode(CENTER);
}
void draw()
{
  fill(245, 245, 220);
  textSize(128);
  text("Mandala!", 250, 100);
  for (int c=0; c<cap.length; c++)
  {
    cap[c]=4;
  }
  for (int b=2; b<8; b++)
  {
    fill(245, 245, 220);
    ellipse(50+b*100, 300, 75, 50);
    fill(0, 255, 0);
    textSize(32);
    text(cap[b-2], 40+b*100, 310);
  }
  for (int b=2; b<8; b++)
  {
    fill(245, 245, 220);
    ellipse(50+b*100, 500, 75, 50);
    fill(0, 255, 0);
    textSize(32);
    text(cap[b+4], 40+b*100, 510);
  }
  fill(245, 245, 220);
  ellipse(100, 400, 100, 400);
  ellipse(900, 400, 100, 400);
  fill(0, 255, 0);
  text(left, 90, 400);
  text(right, 890, 400);
  while (one==true)
  {
    if (choice<6)
    {
      choice=mousePressed(rturn);
    } else
    {
      choice=mousePressed(rturn);
      rturn=true;
    }
    one=false;
  }
}
int []cap=new int [12];
int right=0;
int left=0;
int choice=0;
boolean one=true;
boolean rturn=true;
public int mousePressed(boolean rturn)
{
  if (rturn==true)
  {
    for (int b=2; b<8; b++)
    {
      if (((mouseX-(50+b*100))*(mouseX-(50+b*100))/1406.25+(mouseY-300)*(mouseY-300)/625)<1)
      {
        choice=cap[b-2];
        println(b-2);
      }
    }
  } else if (rturn==false)
  {
    for (int b=2; b<8; b++)
    {
      if (((mouseX-(50+b*100))*(mouseX-(50+b*100))/1406.25+(mouseY-500)*(mouseY-500)/625)<1)
      {
        choice=cap[b+4];
        println(b+4);
      }
    }
  }
  return choice;
}
