import peasy.*;
import de.looksgood.ani.*;
PeasyCam cam;
SeparateBox[] sboxes;
int BOX_SIZE = 180;

boolean sketchFullScreen() {
  return true;
}

void setup() {
  size(displayWidth, displayHeight, P3D);
  cam = new PeasyCam(this, width);
  cam.setMinimumDistance(width / 2);
  cam.setMaximumDistance(width * 2);
  cam.setActive(false);
  Ani.init(this);
  fill(63, 127, 255);
  stroke(255);
  sboxes = new SeparateBox[6*6*6];
  for(int x = 0; x < 6; x++) {
    for(int y = 0; y < 6; y++) {
      for(int z = 0; z < 6; z++) {
        sboxes[x + y*6 + z*6*6] = new SeparateBox(BOX_SIZE, x, y, z);
      }
    }
  }
}

void draw() {
  background(0);
  pushMatrix();
  translate(-BOX_SIZE*3, -BOX_SIZE*3, -BOX_SIZE*3);
  for(SeparateBox sbox : sboxes) {
    sbox.render(cam.getRotations());
  }
  popMatrix();
}

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
    rotateX(rotation[0]);
    rotateY(rotation[1]);
    rotateZ(rotation[2]);
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

void keyPressed() {
  switch(key) {
    case ' ':
      for(SeparateBox sbox : sboxes) {
        sbox.rotate();
      }
      break;
  }
}
