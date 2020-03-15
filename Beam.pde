class Beam extends GameObject
{
  
  Beam(float incomingX, float incomingY, float incomingVX, float incomingVY)
  {
    vx = incomingVX;
    vy = incomingVY;
    x = incomingX;
    y = incomingY;
    
  }
  
  void show()
  {
    fill(255);
    noStroke();
    ellipse (x, y, 50, 50);
    
  }
  
}