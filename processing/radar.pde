int x,i;
int angle;
float diametre = 200;
int direction;
int isa = 0;
boolean pause;
void setup()
{
  size(500,500);
  x = 0;
  background(0,0,0);
  angle = 0;
  direction = 1;
  pause = false;
}

void draw()
{
  i = 0;
  x = (x + 2) % 200 ; 
  background(0,0,150);
  translate(width/2,height/2);
  
  //Cercle général du radar
  fill(0,0,0);
  ellipse(0,0, diametre,diametre);
  
  //Construction de 2 différents zones 
  stroke(200,200,200);
  noFill();
  while(i<=200)
  { 
    ellipse(0,0,i,i);
    i += 100;
  }
  
  //Traçage des lignes dans le cercle
  i = 0;
  while(i<=360)
  {
    line(0, 0, 100 * cos(radians(i)), 100 * sin(radians(i)) );
    i += 30;
  }
  
  
  /*
      Traçage des lignes pour le balayage.
      direction = -1 pour le sens de tour à gauche
      direction = 1  pour le sens de tour à droite
  */
  if(direction == 1)
  {
    i = 0;
    x = 255;
    i = angle;
    while(i>angle - 30)
    {
       stroke(x,0,0);
       line(0,0, (diametre/2) * cos(radians(i)), (diametre/2) * sin(radians(i))) ;
       i-- ;
       x-- ;
       if(x == 0)
       {
         x = 0;
       }
    }
  }
  else if(direction == -1)
  {
    i = 360;
    x = 255;
    i = angle;
    while(i<angle + 30)
    {
       stroke(x,0,0);
       line(0,0, (diametre/2) * cos(radians(i)), (diametre/2) * sin(radians(i))) ;
       i++ ;
       x-- ;
       if(x == 0)
       {
         x = 0;
       }
    }
  }
  //noFill();
  //stroke(255,0,255);
  //ellipse(0,0,x,2x); 
  angle = (angle + direction) % 360; 
}


void keyPressed()
{
  //Touche espace pour pause
  if(key == ' ' && pause==false)
  {
     noLoop();  //Arrêter l'appel en boucle de draw()
     pause = true;
  }
  //Touche espace pour continuer
  else if(key == ' ' && pause==true)
  {
     loop();
     pause = false;
  }
  else if(keyCode == LEFT)
  {
     direction = -1;
  }
  else if(keyCode == RIGHT)
  {
     direction = 1;
  }
}
