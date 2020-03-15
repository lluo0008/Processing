class Bullet extends GameObject
{
  
  Bullet(float incomingX, float incomingY, float incomingVX, float incomingVY)
  {
    vx = incomingVX;
    vy = incomingVY;
    x = incomingX;
    y = incomingY;
    
  }
  
  void show()
  {
    fill(random(0, 255), random(0, 255), 255);
    noStroke();
    rect(x, y, 8, 8);
    
  }
  
}