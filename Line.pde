class Line extends GameObject
{
    Line( float incomingVX, float incomingVY) {
    vx = incomingVX;
    vy = incomingVY;
    x = ship.x + 5;
    y = ship.y - 80;
  }

  void act()
  {
    x = x + vx;
    y = y + vy;
  }

  void show()
  {
    strokeWeight(30);
    stroke(#51FF2C);
    line (0, y, width, y);

  }
}