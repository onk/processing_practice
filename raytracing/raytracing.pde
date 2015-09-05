void setup() {
  size(512, 512);
  background(0);
  noSmooth();
  noLoop();
}

void draw() {
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      float r = 255.0f / width  * (width-x);
      float g = 255.0f / height * y;
      float b = 255.0f / (width*height) * (x * y);
      stroke(r, g, b);
      point(x, y);
    }
  }
}
