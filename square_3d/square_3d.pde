float rotX = 0f;
float rotY = 0f;
float rotZ = 0f;
void setup() {
  size(360, 360, P3D);
  fill(63, 127, 255);
  noStroke();
}

void draw() {
  background(0);
  translate(width/2, height/2);
  rotateX(rotX);
  rotateY(rotY);
  rotateZ(rotZ);
  rect(-100, -100, 200, 200);
  rotX += 0.02;
  rotY += 0.03;
  rotZ += 0.05;
}
