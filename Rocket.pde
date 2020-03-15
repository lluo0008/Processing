class Rocket extends GameObject
{
    Rocket( float incomingVX, float incomingVY) 
  {
    vx = incomingVX;
    vy = incomingVY;
    x = ship.x + 5;
    y = ship.y - 80;
  }

  void act()
  {
    vy = vy * 1.1;
    x = x + vx;
    y = y + vy;
  }

  void show()
  {
    image (missile, x, y, width * 0.05, height * 0.2);
   
  }
}