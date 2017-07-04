class City {
  float x;
  float y;
  int id;
  color city_color;

  City(float x, float y, int id) {
    this.x = x;
    this.y = y;
    this.id = id;
    
    city_color = color(0, 0, 0);
  }

  void show() {
    noFill();

    if (city_color == color(0, 0, 0)) {
      stroke(255);
    } else {
      stroke(city_color);
    }
    strokeWeight(6);

    ellipse(x, y, 16, 16);

    textFont(createFont("consolas bold", 25));
    text(id, x + 15, y + 15);
  }
}