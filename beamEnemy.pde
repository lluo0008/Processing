class beamEnemy extends GameObject
{
  float hp;
  float cooldown;


  beamEnemy(float incomingX, float incomingY)
  {
    x = width/2;
    y = height/2;
    hp = 50;
    cooldown = 0;
  }

  void show()
  {
    noFill();
    stroke(255);
    strokeWeight(2);
    ellipse (x, y, 60, 60);
  }

  void act()
  {
    if (cooldown <= 0)
    {
      engine.add(new Beam(x, y, -2, 2));
      engine.add(new Beam(x, y, 2, 2));
      engine.add(new Beam(x, y, -5, 2));
      engine.add(new Beam(x, y, 5, 2));
      cooldown = 0;
    }
    cooldown--;
  }

  boolean dead()
  {
    if (x < 0 || x > width || y > height || y < 0) 
    {
      return true;
      
    } else 
    
    {
      return false;
    }
  }
}