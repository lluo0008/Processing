class Triple extends Weapon
{
  
  
  Triple()
  {
    cooldown = 0;
  }
  
  
  void shoot()
  {
    if (cooldown <= 0)
    {
      engine.add (new Laser(0, -8));
      engine.add (new Laser(-2, -8));
      engine.add (new Laser(2, -8));
      engine.add (new Laser(-4, -8));
      engine.add (new Laser(4, -8));
      pew.play();
      pew.rewind();
      cooldown = 100;
    }
    cooldown--;
    
  }
  
}