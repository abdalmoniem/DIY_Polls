import processing.sound.*;

Ball ball;
Paddle pad;
ArrayList<Brick> bricks;

int score;
int lives;

void setup() {
   //size(640, 480);
  
  fullScreen(P2D);
  
  reset_game();
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
      
      score++;
    }
  }
  
  ball.update();
  ball.check_edges();
  ball.check_paddle(pad);
  ball.show();
  
  if (ball.y >= height) {
    reset_ball();
  }
  
  if (lives <= 0) {
    reset_game();
  }
  
  pad.show();
  pad.update();
  pad.x = ball.x;
  
  fill(0, 255, 0);
  textSize(20);
  textAlign(CENTER);
  text("Score: " + score, 60, 20);
  text("Lives: " + lives, width - 60, 20);
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

void reset_ball() {
  lives--;
  ball = new Ball(width / 2, height / 2, 5);
}

void reset_game() {
  ball = new Ball(width / 2, height / 2, 5);
  pad = new Paddle(width / 2, height - 50, 100, 10);
  
  bricks = new ArrayList();
  
  for(int x = 50; x < width; x += 60) {
    for(int y = 60; y < height / 2; y += 30) {
      bricks.add(new Brick(x, y, 50, 20));
    }
  }
  
  score = 0;
  lives = 3;
}