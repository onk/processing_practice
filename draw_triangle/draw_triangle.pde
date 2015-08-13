void setup() {
  size(480, 320);
}

void draw() {
}

class Triangle {
  float gx;
  float gy;
  float len;
  float angle;

  Triangle(float gx, float gy, float len, float angle) {
    this.gx = gx;
    this.gy = gy;
    this.len = len;
    this.angle = angle;
  }

  void draw() {
    float[] t = { gx+len*cos(radians(angle)),     gy+len*sin(radians(angle)) };
    float[] l = { gx+len*cos(radians(angle+120)), gy+len*sin(radians(angle+120)) };
    float[] r = { gx+len*cos(radians(angle+240)), gy+len*sin(radians(angle+240)) };
    line(t[0], t[1], l[0], l[1]);
    line(l[0], l[1], r[0], r[1]);
    line(r[0], r[1], t[0], t[1]);
    noFill();
    ellipse(gx, gy, len, len);
    ellipse(gx, gy, len*2, len*2);
  }
}

void mousePressed() {
  background(#cccccc);
  float gx = random(width);
  float gy = random(height);
  float len = random(160);
  float angle = random(360);
  Triangle tri = new Triangle(gx, gy, len, angle);
  tri.draw();
}
