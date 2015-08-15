import java.util.Random;
Random generator;

void setup() {
  size(640, 360);
  generator = new Random();
}

void draw() {
}

void mousePressed() {
  float sd = 60;

  noStroke();
  fill(random(255), random(255), random(255));

  for (int i = 0; i < 60; i++) {
    float x = (float) generator.nextGaussian();
    float y = (float) generator.nextGaussian();
    ellipse(mouseX + sd*x, mouseY + sd*y, 8, 8);
  }
}
