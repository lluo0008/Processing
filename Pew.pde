class Pew extends Weapon
{
  
  
  Pew()
  {
    cooldown = 0;
  }
  
  
  void shoot()
  {
    if (cooldown <= 0)
    {
      engine.add (new Laser(0, -10));
      pew.play();
      pew.rewind();
      cooldown = 30;
    }
    cooldown--;
    
  }
  
}