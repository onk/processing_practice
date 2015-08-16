float rad;
void setup() {
  size(320, 320);
  rad = 0f;
}

void draw() {
  int r = 150;
  float x = r * sin(rad);
  float y = r * cos(rad);
  ellipse(x + width/2, y + height/2, 5, 5);
  rad++;
}
