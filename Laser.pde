class Laser extends GameObject
{
    Laser( float incomingVX, float incomingVY) {
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
    fill(#FF2C2C);
    rect(x,y,5,5);
    //pushMatrix();
    //translate(x, y);
    //rotate(HALF_PI);
    //scale (0.01);
    //image (laser, x, y, width * 2, height * 2);
    //popMatrix();
  }
}