import java.util.Collections;
void setup()
{
  size(800, 800, P3D);
  resetcards();
}
ArrayList<Integer> list = new ArrayList<Integer>();
void draw()
{
  background(0);
  fill(255, 0, 0);
  translate(width/2-52, 0);
  textSize(16);
  text("To skip: Press right and then click anywhere.", -400+52, 50);
  text("You'll skip automatically after picking 5 cards.", -400+52, 100);
  text("Money: "+money+"$", -400+52, 150);
  for(int a=1;a<cardsleft+1;a++)
  {
    text("Card "+a+": "+cards[a-1], -400+52, 150+a*50);
  }
  for (int a=0; a<cards.length-cardsleft; a++)
  {
    rect(2*a, 2*a, 66, 100);
  }
  if (go==1)
  {
    if (cardsleft<5&&!skip)
    {
      turn();
      onetime=true;
    } else
    {
      fill(0, 255, 0);
      textSize(32);
      text("You finished with a score of: "+total, 0, 250);
      fill(255, 0, 0);
      text("Your opponent got a score of: "+ennemytotal, 0, 300);
      if(onetime)
      time=millis();
      if (total==ennemytotal)
      {
        if (total>21)
        {
          text("It's a tie! You both lost 10 $! ", 0, 350);
          if(onetime)
          money-=10;
        } else
        {
          text("It's a tie! You both won 5$! ", 0, 350);
          if(onetime)
          money+=5;
        }
      } else if (total<22&&ennemytotal<22)
      {
        if (total>ennemytotal)
        {
          if (total==21)
          {
            text("You got 21! You won 30$!", 0, 350);
            if(onetime)
            money+=30;
          } else
          {
            text("Nice! You won 15$", 0, 350);
            if(onetime)
            money+=15;
          }
        } else
        {
          if (total==21)
          {
            text("Your friend got 21! You lost 30$!", 0, 350);
            if(onetime)
            money-=30;
          } else
          {
            text("Oops! You lost 15$", 0, 350);
            if(onetime)
            money-=15;
          }
        }
      } else
      {
        if (total<ennemytotal)
        {
          text("Nice! You won 15$", 0, 350);
          if(onetime)
          money+=15;
        } else
        {
          text("Oh no! You lost 15$", 0, 350);
          if(onetime)
          money-=15;
        }
      }
      onetime=false;
      if (millis()-time>5000)
      {
        cardsleft=0;
        total=0;
        ennemytotal=0;
        skip=false;
        resetcards();
        println();
      }
    }
  }
}
void mousePressed()
{
  go=1;
}
void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == RIGHT)
    {
      skip=true;
    }
  }
}
void turn()
{
  if (angle<90)
  {
    background(0);
    translate(2*(cards.length-cardsleft)+33, 2*(cards.length-cardsleft));
    rotateY(angle*PI/90);
    rect(-33, 0, 66, 100);
    fill(255, 255, 23);
    circle(0, 50, 900-10*angle);
    fill(255, 0, 0);
    angle++;
  } else
  {
    if (cards[cardsleft]<14)
    {
      display();
      println("of Spades.");
    } else if ((cards[cardsleft]/100)<27)
    {
      cards[cardsleft]=(cards[cardsleft]/100)-13;
      display();
      println("of Clubs.");
    } else if (cards[cardsleft]/10000<40)
    {
      cards[cardsleft]=(cards[cardsleft]/10000)-26;
      display();
      println("of Hearts.");
    } else if (cards[cardsleft]/1000000<53)
    {
      cards[cardsleft]=(cards[cardsleft]/1000000)-39;
      display();
      println("of Diamonds.");
    }
    angle=0;
    total+=cards[cardsleft];
    cardsleft++;
    go=0;
    ennemytotal=(int)random(15, 27);
  }
}
int money=150;
int go=0;
int cardsleft=0;
int ennemytotal;
int angle=0;
int []cards=new int [52];
int total=0;
int time=0;
boolean skip=false;
boolean onetime;
void display()
{
  switch(cards[cardsleft])
  {
  case 1:
    print("Ace ");
    break;
  case 11:
    print("Jack ");
    break;
  case 12:
    print("Queen ");
    break;
  case 13:
    print("King ");
    break;
  default:
    print(cards[cardsleft]+" ");
  }
}
void resetcards()
{
  for (int i=1; i<14; i++)
  {
    list.add(i);
  }
  Collections.shuffle(list);
  for (int i=14; i<27; i++)
  {
    list.add(i*100);
  }
  Collections.shuffle(list);
  for (int i=27; i<40; i++)
  {
    list.add(i*10000);
  }
  Collections.shuffle(list);
  for (int i=40; i<53; i++)
  {
    list.add(i*1000000);
  }
  Collections.shuffle(list);
  for (int c=0; c<52; c++)
  {
    cards[c]=list.get(c);
  }
}
