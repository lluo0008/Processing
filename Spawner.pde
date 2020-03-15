class Spawner extends GameObject
{
  float cooldown;
  float x;
  float y;
  float n;
  float size;

  Spawner()
  {
    x = width/2;
    y = 50;
    vx = 0;
    vy = 0;
    n = 0;
    size = 0;
  }

  void show()
  {
    strokeWeight(5);
    fill(0);
    stroke(255);
    ellipse(x, y, 50, 50);
  }

  void act()
  {
    if (frameCount <= 500)  
    {
      fill(255);
      textSize (size);
      textMode (CENTER);
      text ("BULLET HELL GAME", 0, height/2);
      size = size + 0.7;
    } 
    else if (frameCount <= 1000)  
    {
     randomWave();
    } 
    else if (frameCount <= 2000) 
    {
     sineWave();
    } 
    //else if (frameCount <= 3000)
    //{
    //  beam();
    //}
    else if (frameCount <= 3000) 
    {
     lineWave();
    }
     else if (frameCount <= 5000)
    {
      Boss();
    }
  }

  void randomWave()
  {    
    if (cooldown <= 0)
    {
      engine.add(new Enemy(x, y));
      cooldown = 40;
    }
    cooldown--;
  }
  
  void sineWave()
  {
    x = width/2 + sin(n) * 700;
    n = n + 0.05;
    if (cooldown <= 0)
    {
      engine.add(new Enemy(x, y));
      cooldown = 10;
      print(">");
    }
    cooldown--;
  }
  
  
  void beam()
  {
    x = width/2;
    y = height/2;
    if (cooldown <= 0)
    {
      engine.add(new beamEnemy(x-100, y));
      engine.add(new beamEnemy(x+100, y));
      cooldown = 1000;
    }
    cooldown--;
    
  }
  
  void lineWave()
  {
    x = 0;
    if (cooldown <= 0)
    {
      int i = 0;
      while (i < width)
      {
        engine.add (new Enemy (x + i*30, y));
        i++;
      }
      cooldown = 500;
    }
    cooldown--;
  }
  
  void Boss()
  {
    x = width/2;
    if (cooldown <= 0)
    {
      engine.add(new Boss(x, y));
      engine.add(new Boss(x, y));
      cooldown = 99999999;
    }
    cooldown--;
  }
  
    
}


boolean dead()
{
  return false;
}