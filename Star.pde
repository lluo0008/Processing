class Star extends GameObject {
  
  
  
  Star() {
    y = 0;
    x = random(width);
    vx = 0;
    vy = random(1,5);
  }
  
  void show() {
    fill(255);
    noStroke();
    rect(x,y,vy,vy);
  }
  
}