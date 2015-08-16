float r;
float rad;
void setup() {
  size(320, 320);
  rad = 0f;
  r = 0;

  noStroke();
  fill(0);
}

void draw() {
  if (r < 150) {
    float x = r * sin(rad);
    float y = r * cos(rad);
    ellipse(x + width/2, y + height/2, 5, 5);
    rad = rad + 0.1;
    r = r + 0.3;
  }
}
