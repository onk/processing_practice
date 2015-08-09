void setup() {
  size(400, 400);
  stroke(255);
}

void draw() {
  line(150, 25, mouseX, mouseY);
}

void mousePressed() {
  saveFrame("output-###.png");
  background(192, 64, 0);
}
