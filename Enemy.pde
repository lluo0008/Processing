class Enemy extends GameObject
{
  float hp;
  float cooldown;


  Enemy(float incomingX, float incomingY)
  {
    x = incomingX;
    y = incomingY;
    vx = 0;
    vy = 3;
    hp = 1;
    cooldown = 0;
  }

  void show()
  {
    noFill();
    stroke(255);
    strokeWeight(2);
    ellipse (x, y, 20, 20);
  }

  void act()
  {
    x = x + vx;
    y = y + vy;
    if (cooldown <= 0)
    {
      engine.add(new Bullet(x, y, 0, 10));
      cooldown = 50;
    }
    cooldown--;
  }

  boolean dead()
  { 
    int i = engine.size() - 1;
    while (i >= 0)
    {
      GameObject g = engine.get(i);
      if (g instanceof Laser && rectRect(g.x, g.y, 5, 5, x, y, 20, 20)|| g instanceof Rocket && rectRect(g.x, g.y, 5, 5, x, y, 20, 20))
      {
        hp--;
        engine.remove(i);
      }
      i--;
    }
        
    if (x < 0 || x > width || y > height || hp <= 0 ) 
    {
      return true;
    }
    else 
    {
     return false;
    }
  }
}