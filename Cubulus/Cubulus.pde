void setup()
{
  size(1000, 1000);
  background(0);
  rectMode(CENTER);
}
void draw()
{
  if (!initialize)
  {
    for (int i=0; i<tab.length; i++)
    {
      for (int j=0; j<tab.length; j++)
      {
        for (int k=0; k<tab.length; k++)
        {
          tab[i][j][k]=(int)random(3);
        }
      }
    }
    initialize=true;
  }
  for (int y=0; y<tab.length; y++)
  {
    for (int x=0; x<tab.length; x++)
    {
      fill(255);
      rect(100*x+width/2-100,(3-y)*100+height/2-200,100,100);
      fill(255,0,0);
      text(tab[0][y][x],100*x+width/2-100,(3-y)*100+height/2-200);
    }
  }
}
int tab[][][]=new int[3][3][3];
boolean initialize=false;
int x=0, y=0, z=0;
