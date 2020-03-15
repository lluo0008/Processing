class Rock
{
  float x, y;
  float vx, vy;
  float size;
  
  Rock()
  {
    x = random(0, width);
    y = -200;
    size = random(1, 5);
    vx = random (0, 4);
    vy = random (0, 4);
  }
  
  void show()
  {
    image (rock, x, y, width * 0.1, height * 0.1);
    
    if (dist(mouseX, mouseY, x, y) <= 50)
    {
      image (fire, x, y, width * 0.1, height * 0.1);
    }
    
  }
  
  void move()
  {
    y = y + vy;
    
    if (y > height)
    {
      y = 0;
      x = random (0, width);
    }
  }
}