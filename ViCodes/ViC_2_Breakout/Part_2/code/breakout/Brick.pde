class Brick {
  float x;
  float y;

  float l;
  float h;

  float red = random(255);
  float green = random(255);
  float blue = random(255);

  Brick(float x, float y, float l, float h) {
    this.x = x;
    this.y = y;
    this.l = l;
    this.h = h;
  }

  void show() {
    fill(red, green, blue);
    rectMode(CENTER);
    rect(x, y, l, h);
  }
}