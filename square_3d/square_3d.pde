float rot = 0f;
void setup() {
  size(360, 360, P3D);
  fill(63, 127, 255);
  noStroke();
}

void draw() {
  background(0);
  translate(width/2, height/2);
  rotateX(rot);
  rect(-100, -100, 200, 200);
  rot += 0.06;
}
