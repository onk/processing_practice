import peasy.*;
PeasyCam cam;
SeparateBox[] sboxes;

boolean sketchFullScreen() {
  return true;
}

void setup() {
  size(displayWidth, displayHeight, P3D);
  cam = new PeasyCam(this, width);
  cam.setMinimumDistance(width / 2);
  cam.setMaximumDistance(width * 2);
  fill(63, 127, 255);
  stroke(255);
  sboxes = new SeparateBox[6*6*6];
  for(int x = 0; x < 6; x++) {
    for(int y = 0; y < 6; y++) {
      for(int z = 0; z < 6; z++) {
        sboxes[x + y*6 + z*6*6] = new SeparateBox(x, y, z);
      }
    }
  }
}

void draw() {
  background(0);
  pushMatrix();
  translate(-300, -300, -300);
  for(SeparateBox sbox : sboxes) {
    sbox.update();
    sbox.render(cam.getRotations());
  }
  popMatrix();
}

class SeparateBox {
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
    int dis = 20;
    pushMatrix();
    translate(x*(100+dis), y*(100+dis), z*(100+dis));
    rotateX(rotation[0]);
    rotateY(rotation[1]);
    rotateZ(rotation[2]);
    rotateX(radians(r));
    box(100);
    popMatrix();
  }

  void update() {
    if (move) {
      r += 5;
    }
  }
}
