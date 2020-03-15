class Boss extends GameObject
{
  float hp, d, size;
  float cooldown;


  Boss(float incomingX, float incomingY)
  {
    x = incomingX;
    y = incomingY;
    vx = (random(-10, 10));
    vy = 0.1;
    hp = 200;
    cooldown = 0;
    d = 300;
  }

  void show()
  {
    noFill();
    stroke(random(0, 255), random(0, 255), 255);
    strokeWeight(15);
    size = map (hp, 0, 200, d, 50);
    ellipse (x, y, size, size);
  }

  void act()
  {
    x = x + vx;
    y = y + vy;
    
    
    if (cooldown <= 0)
    {
      engine.add(new Bullet(x, y, 0, 10));
      engine.add(new Bullet(x, y, -1, 10));
      engine.add(new Bullet(x, y, 1, 10));
      engine.add(new Bullet(x, y, -2, 10));
      engine.add(new Bullet(x, y, 2, 10));
      engine.add(new Bullet(x, y, -3, 10));
      engine.add(new Bullet(x, y, 3, 10));
      engine.add(new Bullet(x, y, -4, 10));
      engine.add(new Bullet(x, y, 4, 10));
      engine.add(new Bullet(x, y, -5, 10));
      engine.add(new Bullet(x, y, 5, 10));
      engine.add(new Bullet(x, y, -6, 10));
      engine.add(new Bullet(x, y, 6, 10));
      engine.add(new Bullet(x, y, -7, 10));
      engine.add(new Bullet(x, y, 7, 10));
      engine.add(new Bullet(x, y, -8, 10));
      engine.add(new Bullet(x, y, 8, 10));
      engine.add(new Bullet(x, y, -9, 10));
      engine.add(new Bullet(x, y, 9, 10));
      engine.add(new Bullet(x, y, -10, 10));
      engine.add(new Bullet(x, y, 10, 10));
      cooldown = 60;
    }
    cooldown--;
    
    if (x >= width || x <= 0)
    {
      vx = vx * -1;
    }
  }

  boolean dead()
  {
    
    int i = engine.size() - 1;
    while (i >= 0)
    {
      GameObject g = engine.get(i);
      if (g instanceof Laser && rectRect(g.x, g.y, 5, 5, x, y, 300, 300))
      {
        hp--;
        engine.remove(i);
      }
      i--;
    }
        
    if (hp <= 0) {
      return true;
    }
    else 
    {
     return false;
    }
  }
}