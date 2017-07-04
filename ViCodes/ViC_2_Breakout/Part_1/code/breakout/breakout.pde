Ball ball;
Paddle pad;

ArrayList<Brick> bricks;

void setup() {
  size(640, 480);
  ball = new Ball(width / 2, height / 2, 5);
  pad = new Paddle(width / 2, height - 30, 100, 10);
  
  bricks = new ArrayList();
  
  for(int x = 50; x < width; x += 60) {
    for(int y = 20; y < height / 2; y += 30) {
      bricks.add(new Brick(x, y, 50, 20));
    }
  }
}

void draw() {
  background(128);
  
  for(Brick brick : bricks) {
    brick.show();
  }
  
  for(int i = bricks.size() - 1; i >= 0; i--) {
    Brick brick = bricks.get(i);
    if(ball.hits(brick)) {
      bricks.remove(i);
      
      ball.y_speed *= -1;
    }
  }
  
  ball.update();
  ball.check_edges();
  ball.check_paddle(pad);
  ball.show();
  
  pad.show();
  pad.update();
}

void keyPressed() {
  if (keyCode == RIGHT) {
    pad.move(5);
  } else if (keyCode == LEFT) {
    pad.move(-5);
  }
}

void keyReleased() {
    pad.move(0);
}