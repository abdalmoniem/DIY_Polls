class City {
  float x;
  float y;
  int id;
  
  City(float x, float y, int id) {
    this.x = x;
    this.y = y;
    this.id = id;
  }
  
  void show() {
    noFill();
    stroke(255);
    strokeWeight(6);
    
    ellipse(x, y, 16, 16);
    
    textFont(createFont("consolas bold", 25));
    text(id, x + 15, y + 15);
  }
}