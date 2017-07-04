class Brick {
  float x;
  float y;
  
  float l;
  float h;
  
  Brick(float x, float y, float l, float h) {
    this.x = x;
    this.y = y;
    this.l = l;
    this.h = h;
  }
  
  void show() {
    rectMode(CENTER);
    rect(x, y, l, h);
  }
}