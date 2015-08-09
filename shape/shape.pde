void setup() {
  size(480, 320);
  strokeWeight(20);

  strokeJoin(MITER);
  rect(80, 100, 80, 120);

  strokeJoin(BEVEL);
  rect(200, 100, 80, 120);

  strokeJoin(ROUND);
  rect(320, 100, 80, 120);
}

void draw() {
}
