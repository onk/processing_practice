float x;
float randomSeed;

void setup() {
  size(320, 320);

  background(255);
  noFill();
  stroke(nextColor());

  x = 0;
  randomSeed = random(100);
}

void draw() {
  line(x, randomHeight(randomSeed), x, height);

  x++;
  if (x > width) {
    noStroke();
    fill(255, 128);
    rect(0, 0, width, height);

    x = 0;
    stroke(nextColor());
    noFill();
  }

  randomSeed = randomSeed + 0.01;
}

float randomHeight(float randomSeed) {
  return noise(randomSeed) * height;
}

color nextColor() {
  return color(random(255), random(255), random(255), 192);
}
