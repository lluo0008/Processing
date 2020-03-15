import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer music;
AudioPlayer pew;
AudioPlayer teleport;
AudioPlayer IMMA;

//Laser [] lasers;
ArrayList<GameObject> engine;
Ship ship;

int mode;

boolean wkey, akey, skey, dkey, spacekey;
boolean key1, key2, key3, key4, shift, ctl;


PImage spaceship;
PImage rock;
PImage laser;
PImage pewpew;
PImage fire;
PImage shotgun;
PImage launcher;
PImage missile;
PImage sun;

void setup() 
{
  colorMode (HSB);
  minim = new Minim(this);
  music = minim.loadFile ("music.mp3");
  pew = minim.loadFile ("pew.wav");
  teleport = minim.loadFile ("teleport.mp3");
  IMMA = minim.loadFile ("IMMA.wav");
  
  music.loop();
  rectMode(CENTER);
  imageMode (CENTER);
  spaceship = loadImage ("ship.png");
  rock = loadImage ("rock.png");
  laser = loadImage ("laser.png");
  pewpew = loadImage ("pew.png");
  fire = loadImage ("fire.png");
  shotgun = loadImage ("shotgun.png");
  launcher = loadImage ("launcher.png");
  missile = loadImage ("missile.png");
  sun = loadImage ("sun.jpg");
  fullScreen(FX2D);
  engine = new ArrayList<GameObject>();
  ship = new Ship();
  engine.add( ship );
  engine.add(new Spawner());
  noStroke();

}

void draw()
{
  makeStars();
  fill(0, 100);
  rect(width/2, height/2, width, height);

  int i = engine.size()-1;
  while (i >= 0 )
  {
    GameObject myLaser = engine.get(i);
    if (myLaser.dead()) 
    {
      engine.remove(i);
    } else 
    {
      myLaser.show();
      myLaser.act();
    }
    i--;
  }
  //image(spaceship, mouseX, mouseY, width * 0.07, height * 0.15);
  fill(255);
  textSize (45);
  
  
  
}

void makeStars() 
{
  if (frameCount % 10 == 0) 
  {
    engine.add( new Star() );
  }
}

//void mousePressed() 
//{
//  int i = 0;
//  while (i < 10) {
//    engine.add(new Laser());
//    i++;
//  }
//}


void keyPressed() {
 println(key);
  //if (key == 'm')       mkey = true;
  //if (key == ' ')       spacekey = true;
  if (key == ' ')       spacekey = true;
  if (key == '1')       key1 = true;
  if (key == '2')       key2 = true;
  if (key == '3')       key3 = true;
  if (key == '4')       key4 = true;
  if (key == 'W')    wkey = true;
  if (key == 'S')  skey = true; 
  if (key == 'D') dkey = true; 
  if (key == 'A')  akey = true;
  
  if (keyCode == SHIFT) shift = true;
  if (keyCode == CONTROL) ctl = true;
}

void keyReleased() {
  //if (key == 'm')       mkey = false;
  if (key == ' ')       spacekey = false;
  if (key == '1')       key1 = false;
  if (key == '2')       key2 = false;
  if (key == '3')       key3 = false;
  if (key == '4')       key4 = false;
  if (key == 'W')    wkey = false;
  if (key == 'S')  skey = false; 
  if (key == 'D') dkey = false; 
  if (key == 'A')  akey = false;
  
  if (keyCode == SHIFT) shift = false;
  if (keyCode == CONTROL) ctl = false;
}