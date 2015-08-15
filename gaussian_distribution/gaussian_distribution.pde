void setup() {
  size(640, 360);
  background(0);
}

void draw() {
  noStroke();
  fill(0, 10);
  rect(0, 0, width, height);

  float colorSd = 60;
  float sd = 60;

  noStroke();
  float r = (float) randomGaussian();
  float g = (float) randomGaussian();
  float b = (float) randomGaussian();
  fill(128+(r*colorSd), 128+(g*colorSd), 128+(b*colorSd));

  for (int i = 0; i < 60; i++) {
    float x = (float) randomGaussian();
    float y = (float) randomGaussian();
    ellipse(mouseX + sd*x, mouseY + sd*y, 8, 8);
  }
}
