void setup() {
  size(480, 320);
}

void draw() {
}

class Triangle {
  float gx;
  float gy;
  float l;
  float angle;

  Triangle(float gx, float gy, float l, float angle) {
    this.gx = gx;
    this.gy = gy;
    this.l = l;
    this.angle = angle;
  }

  void draw() {
    line(gx, gy, gx + l*cos(radians(angle)), gy + l*sin(radians(angle)));
    line(gx, gy, gx + l*cos(radians(angle+120)), gy + l*sin(radians(angle+120)));
    line(gx, gy, gx + l*cos(radians(angle+240)), gy + l*sin(radians(angle+240)));
  }
}

void mousePressed() {
  background(#cccccc);
  float gx = random(width);
  float gy = random(height);
  float l = random(160);
  float angle = random(360);
  Triangle tri = new Triangle(gx, gy, l, angle);
  tri.draw();
}
