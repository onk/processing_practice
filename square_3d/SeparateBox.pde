class SeparateBox {
  int boxSize;
  int x;
  int y;
  int z;
  float r;
  boolean move;
  SeparateBox(int x, int y, int z) {
    this.x = x;
    this.y = y;
    this.z = z;
    move = random(1) < 0.5;
    r = 0;
  }
  void render(float[] rotation) {
    pushMatrix();
    translate(x*(BOX_SIZE+DISTANCE_SIZE), y*(BOX_SIZE+DISTANCE_SIZE), z*(BOX_SIZE+DISTANCE_SIZE));
    // rotateX(rotation[0]);
    // rotateY(rotation[1]);
    // rotateZ(rotation[2]);
    rotateX(radians(r));
    box(BOX_SIZE);
    popMatrix();
  }

  void rotate() {
    if (move) {
      r = 0;
      Ani ani = new Ani(this, 3.0, "r", 720);
    }
  }
}
