class SunDestroyer extends Weapon
{
  
  
  SunDestroyer()
  {
    cooldown = 0;
    
  }
  
  
  void shoot()
  {
    if (cooldown <= 0)
    {
      engine.add (new Line(0, -5));
      cooldown = 1000;
    }
    
  }
  
}