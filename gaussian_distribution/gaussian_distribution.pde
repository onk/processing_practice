import java.util.Random;
Random generator;

void setup() {
  size(640, 360);
  background(0);
  generator = new Random();
}

void draw() {
  noStroke();
  fill(0, 10);
  rect(0, 0, width, height);

  float colorSd = 128;
  float sd = 60;

  noStroke();
  float r = (float) generator.nextGaussian();
  float g = (float) generator.nextGaussian();
  float b = (float) generator.nextGaussian();
  fill(128+(r*colorSd), 128+(g*colorSd), 128+(b*colorSd));

  for (int i = 0; i < 60; i++) {
    float x = (float) generator.nextGaussian();
    float y = (float) generator.nextGaussian();
    ellipse(mouseX + sd*x, mouseY + sd*y, 8, 8);
  }
}
