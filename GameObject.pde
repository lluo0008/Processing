abstract class GameObject 
{

  float x, y;
  float vx, vy;

  GameObject() {
  }

  void show() {
    fill(255);
    rect(x, y, 10, 10); 
    
  }

  void act() {
    x = x + vx;
    y = y + vy;
  }
  
  boolean dead() {
    if (x < 0 || x > width || y > height || y < 0) {
      return true;
    } else {
      return false; 
    }
  }
}