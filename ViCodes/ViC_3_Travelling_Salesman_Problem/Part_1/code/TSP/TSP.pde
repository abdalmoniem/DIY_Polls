int total_cities = 7;
ArrayList<City> cities;
ArrayList<City> best_cities;

float shortest_distance;

void setup() {
  size(640, 480);

  cities = new ArrayList();
  best_cities = new ArrayList();
  
  // initialize the cities array with random locations
  for (int i = 0; i < total_cities; i++) {
    int x = floor(random(50, width - 50));
    int y = floor(random(50, height - 50));
    City city = new City(x, y, i);

    cities.add(city);
  }
  
  // calculate min. distance as the first distance it finds
  shortest_distance = calculate_distance(cities);
  
  // clone the best order into best cities
  best_cities = (ArrayList<City>) cities.clone();
  println("shortest distance: " + shortest_distance);
}

void draw() {
  background(0);
  
  
  // shuffle the array to get a new order
  shuffle_array(cities);
  
  // draw a line between all the cities
  for (int i = 0; i < cities.size() - 1; i++) {
    City A = cities.get(i);
    City B = cities.get(i + 1);

    stroke(255, 50);
    strokeWeight(6);
    line(A.x, A.y, B.x, B.y);
  }
  
  // connect the last city with the first
  City first = best_cities.get(0);
  City last = best_cities.get(best_cities.size() - 1);
  
  line(last.x, last.y, first.x, first.y);

  // calculate the distance of the new order
  float d = calculate_distance(cities);
  
  // if the new distance is smaller make
  // the new one the minimum
  // and clone the new order into best_cities
  if (d < shortest_distance) {
    shortest_distance = d;
    best_cities = (ArrayList<City>) cities.clone();

    println("shortest distance: " + shortest_distance);
  }
  
  // draw lines between the best cities in the order
  for (int i = 0; i < best_cities.size() - 1; i++) {
    City A = best_cities.get(i);
    City B = best_cities.get(i + 1);

    stroke(0, 255, 128);
    strokeWeight(10);
    line(A.x, A.y, B.x, B.y);
  }
  
  // connect the last city with the first in the shortest path  
  first = best_cities.get(0);
  last = best_cities.get(best_cities.size() - 1);
  
  line(last.x, last.y, first.x, first.y);
  
  
  // show all the cities, the first city as blue,
  // the last city as red
  for (City city : cities) {
    if (city.equals(best_cities.get(0))) {
      city.city_color = color(0, 0, 255);
    } else if (city.equals(best_cities.get(best_cities.size() - 1))) {
      city.city_color = color(255, 0, 0);
    } else {
      city.city_color = color(255);
    }
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
  float d = 0;

  for (int i = 0; i < list.size() - 1; i++) {
    City A = list.get(i);
    City B = list.get(i + 1);

    d = dist(A.x, A.y, B.x, B.y);

    sum += d;
  }
  
  City first = list.get(0);
  City last = list.get(list.size() - 1);
  
  d = dist(last.x, last.y, first.x, first.y);
  
  sum += d;

  return sum;
}