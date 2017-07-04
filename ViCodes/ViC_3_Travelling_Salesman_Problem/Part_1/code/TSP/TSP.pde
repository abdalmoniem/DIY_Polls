int total_cities = 5;
ArrayList<City> cities;
ArrayList<City> best_cities;

float shortest_distance;

void setup() {
  size(640, 480);

  cities = new ArrayList();
  best_cities = new ArrayList();

  for (int i = 0; i < total_cities; i++) {
    int x = floor(random(50, width - 50));
    int y = floor(random(50, height - 50));
    City city = new City(x, y, i);

    cities.add(city);
  }

  shortest_distance = calculate_distance(cities);
  best_cities = (ArrayList<City>) cities.clone();
  println("shortest distance: " + shortest_distance);
}

void draw() {
  background(0);

  shuffle_array(cities);

  for (int i = 0; i < cities.size() - 1; i++) {
    City A = cities.get(i);
    City B = cities.get(i + 1);

    stroke(255, 50);
    strokeWeight(6);
    line(A.x, A.y, B.x, B.y);
  }

  float d = calculate_distance(cities);

  if (d < shortest_distance) {
    shortest_distance = d;
    best_cities = (ArrayList<City>) cities.clone();

    println("shortest distance: " + shortest_distance);
  }

  for (int i = 0; i < best_cities.size() - 1; i++) {
    City A = best_cities.get(i);
    City B = best_cities.get(i + 1);

    stroke(0, 255, 128);
    strokeWeight(10);
    line(A.x, A.y, B.x, B.y);
  }

  for (City city : cities) {
    city.show();
  }
}

void swap(ArrayList<City> list, int a, int b) {
  City temp = list.get(a);
  list.set(a, list.get(b));
  list.set(b, temp);
}

void shuffle_array(ArrayList<City> list) {
  for (int i = list.size() - 1; i >= 0; i--) {
    int ri = floor(random(list.size()));

    swap(list, i, ri);
  }
}

float calculate_distance(ArrayList<City> list) {
  float sum = 0;

  for (int i = 0; i < list.size() - 1; i++) {
    City A = list.get(i);
    City B = list.get(i + 1);

    float d = dist(A.x, A.y, B.x, B.y);

    sum += d;
  }

  return sum;
}