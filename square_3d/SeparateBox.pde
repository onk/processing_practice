class SeparateBox {
  int boxSize;
  int x;
  int y;
  int z;
  float r;
  boolean move;
  SeparateBox(int boxSize, int x, int y, int z) {
    this.boxSize = boxSize;
    this.x = x;
    this.y = y;
    this.z = z;
    move = random(1) < 0.5;
    r = 0;
  }
  void render(float[] rotation) {
    int dis = 10;
    pushMatrix();
    translate(x*(boxSize+dis), y*(boxSize+dis), z*(boxSize+dis));
    // rotateX(rotation[0]);
    // rotateY(rotation[1]);
    // rotateZ(rotation[2]);
    rotateX(radians(r));
    box(boxSize);
    popMatrix();
  }

  void rotate() {
    if (move) {
      r = 0;
      Ani ani = new Ani(this, 3.0, "r", 720);
    }
  }
}
