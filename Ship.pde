class Ship extends GameObject
{
  float w, h;
  float hp;
  float vx, vy;
  float cooldown;
  float healthBar;
  float teleBar;

  Weapon gun;

  Ship()
  {
    w = 100;
    h = 150;
    hp = 100;    
    vx = 0;
    vy = 0;
    gun = new Pew();
    cooldown = 0;

    x = width/2;
    y = height/2;
  }



  void show()
  {
    noStroke();
    fill(#C40606);
    rect(270, 50, 500, 50);
    fill(#FF0000);
    healthBar = map(hp, 0, 100, 0, 500);
    rect(270, 50, healthBar, 50);


    fill(255);
    image (spaceship, x, y, w, h);
    ellipse (x, y - 15, 5, 5);
    if (gun instanceof Pew)
    {
      image (pewpew, 250, height-150, width * 0.2, height * 0.2);
    }

    if (gun instanceof Triple)
    {
      image (shotgun, 400, height-150);
    }

    if (gun instanceof Missile)
    {
      image (launcher, 360, height-150, width * 0.3, height * 0.2);
    }

    if (gun instanceof SunDestroyer)
    {
      image (sun, 300, height-200);
    }
  }

  void act() 
  {
    gun.shoot();

    if (key1 == true) 
    {
      gun = new Pew();
      image (pewpew, 250, height-150, width * 0.2, height * 0.2);
    }

    if (key2 == true) 
    {
      gun = new Triple();
      image (shotgun, 400, height-150);
    }

    if (key3 == true)
    {
      gun = new Missile();
      image (launcher, 360, height-150, width * 0.3, height * 0.2);
    }

    if (key4 == true)
    {
      gun = new SunDestroyer();
      image (sun, 300, height-250);
    }





    if (wkey) vy = -4;
    if (skey) vy = 4;
    if (akey) vx = -4;
    if (dkey) vx = 4;  

    if (!wkey && !skey) vy = vy * 0.5;
    if (!akey && !dkey) vx = vx * 0.5;

    if (shift && wkey) vy = -14;
    if (shift && skey) vy = 14;
    if (shift && akey) vx = -14;
    if (shift && dkey) vx = 14;

    if (ctl && wkey) vy = -1;
    if (ctl && skey) vy = 1;
    if (ctl && akey) vx = -1;
    if (ctl && dkey) vx = 1;



    if (cooldown <= 0)
    {
      if (dkey == true && spacekey == true) 
      {
        x = x + 500;
        teleport.play();
        teleport.rewind();
        cooldown = 1000;
      }
    } else if (cooldown <= 0)
    {
      if (akey == true && spacekey == true) 
      {
        x = x - 500;
        teleport.play();
        teleport.rewind();
        cooldown = 1000;
      }
    } else if (cooldown <= 0)
    {
      if (wkey == true && spacekey == true)
      {
        y = y - 500;
        teleport.play();
        teleport.rewind();
        cooldown = 1000;
      }
    } else if (cooldown <= 0)
    {
      if (skey == true && spacekey == true)
      {
        y = y + 500;
        teleport.play();
        teleport.rewind();
        cooldown = 1000;
      }
    }

    cooldown--;








    x = x + vx;
    y = y + vy;

    gun.update();
  }

  boolean dead() 
  {
    int i = engine.size() - 1;
    while (i >= 0)
    {
      GameObject g = engine.get(i);
      if (g instanceof Bullet && rectRect(g.x, g.y, 5, 5, x, y, w, h))
      {
        hp--;
        engine.remove(i);
      }
      i--;
    }


    if (hp <= 0)
    {
      mode = 0;
      return true;
    } else 
    {
      return false;
    }
  }
}