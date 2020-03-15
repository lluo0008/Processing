class Missile extends Weapon
{
  
  
 Missile()
 {
   cooldown = 0;
    
 }
  
  
 void shoot()
 {
   if (cooldown <= 0)
   {
     engine.add (new Rocket(0, -5));
     cooldown = 300;
   }
   cooldown--;
    
 }
  
}