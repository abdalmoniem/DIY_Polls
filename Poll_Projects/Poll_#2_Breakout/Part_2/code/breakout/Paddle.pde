class Paddle {
  float x;
  float y;
  
  float l;
  float h;
  
  float x_speed = 0;
  
  Paddle(float x, float y, float l, float h) {
    this.x = x;
    this.y = y;
    this.l = l;
    this.h = h;
  }
  
  void show() {
    fill(255);
    rectMode(CENTER);
    rect(x, y, l, h);
  }
  
  void update() {
    x += x_speed;
  }
  
  void move(float amount) {
    x_speed = amount;
    
    if (x >= width) {
      x = 0;
    } else if (x <= 0) {
      x = width;
    }
  }
}