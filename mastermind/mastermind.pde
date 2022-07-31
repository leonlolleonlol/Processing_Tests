void setup()
{
  size(800, 800);
  background(0);
  rectMode(CENTER);
  noStroke();
  frameRate(30);
  while(ans[0]==ans[1]||ans[0]==ans[2]||ans[0]==ans[3]||ans[1]==ans[2]||ans[1]==ans[3]||ans[2]==ans[3])
{
  ans[0]=(int)random(8)+1;
  ans[1]=(int)random(8)+1;
  ans[2]=(int)random(8)+1;
  ans[3]=(int)random(8)+1;
}
}
void draw()
{
  if (!win)
  {
    if (tries>19)
    {
      win=true;
    }
    PFont TimesNewRoman;
    TimesNewRoman = createFont("Times New Roman", 64);
    textFont(TimesNewRoman);
    for (int x=1; x<21; x++)
    {
      fill(255);
      textSize(16);
      text("Tries: "+x, 0, height-(30*x));
      text("----------------------------------------------------------------------------------------------------------------", 0, height-(30*x)-15);
    }
    for (int y=0; y<tries+1; y++)
    {
      for (int z=0; z<choicelist[y].length; z++)
      {
        if (choicelist[y][z]!=0)
        {
          switch(choicelist[y][z])
          {
          case 1:
            fill(255, 0, 0);
            break;
          case 2:
            fill(255, 118, 13);
            break;
          case 3:
            fill(250, 242, 0);
            break;
          case 4:
            fill(0, 255, 0);
            break;
          case 5:
            fill(0, 0, 255);
            break;
          case 6:
            fill(153, 0, 250);
            break;
          case 7:
            fill(255, 0, 170);
            break;
          case 8:
            fill(255);
            break;
          }
          circle((z+1)*100, height-(30*(y+1)), 20);
        }
      }
        if (correctlist[y]!=0)
        {
          textSize(16);
          fill(0, 255, 0);
          text(correctlist[y], 500, height-(30*(y+1)));
        }
        if (wronglist[y]!=0)
        {
          fill(255, 0, 0);
          text(wronglist[y], 550, height-(30*(y+1)));
        }
    }
    fill(r, g, b);
    textSize(64);
    text("MASTERMIND!", 0, 50);
    textSize(32);
    fill(r, g, b);
    text("Combination generated!", 0, 100);
    textSize(20);
    fill(r, g, b);
    text("Click 4 colors and then click anywhere to confirm your choice", 0, 150);
    fill(255, 0, 0);
    rect(width-100, 25, 200, 50);
    fill(255, 118, 13);
    rect(width-100, 75, 200, 50);
    fill(250, 242, 0);
    rect(width-100, 125, 200, 50);
    fill(0, 255, 0);
    rect(width-100, 175, 200, 50);
    fill(0, 0, 255);
    rect(width-100, 225, 200, 50);
    fill(153, 0, 250);
    rect(width-100, 275, 200, 50);
    fill(255, 0, 170);
    rect(width-100, 325, 200, 50);
    fill(255);
    rect(width-100, 375, 200, 50);
  } else
  {
    background(0);
    for (int c=25; c<height; c+=50)
    {
      delay(5);
      fill((int)random(255), (int)random(255), (int)random(255));
      rect(c, c, 200, 100);
      textSize(c/10);
      if (tries>19)
      {
        text("YOU LOSE!!!", width/2-100, height/2);
      } else
      {
        text("YOU WIN!!!", width/2-100, height/2);
      }
    }
  }
}
void mousePressed() {
  if (choicepos<4)
  {
    if (mouseX>width-200&&mouseX<width&&mouseY>0&&mouseY<50)
    {
      print("red ");
      choice[choicepos]=1;
    } else if (mouseX>width-200&&mouseX<width&&mouseY>50&&mouseY<100)
    {
      print("orange ");
      choice[choicepos]=2;
    } else if (mouseX>width-200&&mouseX<width&&mouseY>100&&mouseY<150)
    {
      print("yellow ");
      choice[choicepos]=3;
    } else if (mouseX>width-200&&mouseX<width&&mouseY>150&&mouseY<200)
    {
      print("green ");
      choice[choicepos]=4;
    } else if (mouseX>width-200&&mouseX<width&&mouseY>200&&mouseY<250)
    {
      print("blue ");
      choice[choicepos]=5;
    } else if (mouseX>width-200&&mouseX<width&&mouseY>250&&mouseY<300)
    {
      print("violet ");
      choice[choicepos]=6;
    } else if (mouseX>width-200&&mouseX<width&&mouseY>300&&mouseY<350)
    {
      print("pink ");
      choice[choicepos]=7;
    } else if (mouseX>width-200&&mouseX<width&&mouseY>350&&mouseY<400)
    {
      print("white ");
      choice[choicepos]=8;
    } else
    {
      choicepos--;
      println("Click on a color.");
    }
    choicepos++;
    r=(int)random(255);
    g=(int)random(255);
    b=(int)random(255);
  } else
  {
    println();
    background(0);
    for (int b=0; b<4; b++)
    {
      if (choice[b]==ans[b])
      {
        correctans++;
      } else
      {
        for (int d=0; d<4; d++)
        {
          if (d!=b&&choice[b]==ans[d])
          {
            wrongplace++;
          }
        }
      }
      choicelist[tries][b]=choice[b];
      choice[b]=0;
    }
    if(correctans==4)
    {
      win=true;
    }
    wronglist[tries]=wrongplace;
    correctlist[tries]=correctans;
    tries++;
    choicepos=0;
    correctans=0;
    wrongplace=0;
  }
}
int wrongplace=0;
int choice[]=new int [4];
int ans[]={(int)random(8)+1, (int)random(8)+1, (int)random(8)+1, (int)random(8)+1};
int choicelist[][]=new int [20][4];
int wronglist[]=new int [20];
int correctlist[]=new int [20];
int choicepos=0;
int correctans=0;
int tries=0;
int r=(int)random(255);
int g=(int)random(255);
int b=(int)random(255);
boolean win=false;
