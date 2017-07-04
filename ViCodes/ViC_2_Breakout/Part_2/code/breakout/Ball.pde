class Ball {
  float x;
  float y;
  float r;
  float d;

  float x_speed;
  float y_speed;

  float speed = 5;

  Ball(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;

    this.d = r * 2;

    float angle = random(PI / 4, 3 * PI / 4);
    x_speed = speed * cos(angle);
    y_speed = - speed * sin(angle);
  }

  void show() {
    fill(255);
    ellipseMode(CENTER);
    ellipse(x, y, d, d);
  }

  void update() {
    x += x_speed;
    y += y_speed;
  }

  void check_edges() {
    if (((x - r)) <= 0 || ((x + r) >= width)) {
      x_speed *= -1;
    }

    if ((y - r) <= 0 ) {
      y_speed *= -1;
    }
  }
  
  void check_paddle(Paddle pad) {
    float x_min = pad.x - (pad.l / 2) - r;
    float x_max = pad.x + (pad.l / 2) + r;
    
    float y_min = pad.y - (pad.h / 2) - r;
    float y_max = pad.y + (pad.h / 2);
    
    if ((x >= x_min) && (x <= x_max) && (y >= y_min) && (y <= y_max)) {
      y_speed *= -1;
    }
  }
  
  boolean hits(Brick brick) {
    float x_min = brick.x - (brick.l / 2) - r;
    float x_max = brick.x + (brick.l / 2) + r;
    
    float y_min = brick.y - (brick.h / 2) - r;
    float y_max = brick.y + (brick.h / 2) + r;
    
    return ((x >= x_min) && (x <= x_max) && (y >= y_min) && (y <= y_max));
  }
}