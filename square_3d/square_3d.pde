import peasy.*;
PeasyCam cam;

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
}

void draw() {
  background(0);
  pushMatrix();
  translate(-300, -300, -300);
  int dis = 20;
  for(int x = 0; x < 6; x++) {
    for(int y = 0; y < 6; y++) {
      for(int z = 0; z < 6; z++) {
        pushMatrix();
        translate(x*(100+dis), y*(100+dis), z*(100+dis));
        box(100);
        popMatrix();
      }
    }
  }
  popMatrix();
}
