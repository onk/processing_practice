Walker w;
void setup() {
  size(640, 360);
  w = new Walker();
  background(255);
}

void draw() {
  w.step();
  w.display();
}

class Walker {
  int x;
  int y;

  Walker() {
    x = width / 2;
    y = height / 2;
  }

  void display() {
    stroke(0);
    point(x, y);
  }

  void step() {
    int stepX;
    int stepY;

    float rx = random(1);
    if (rx < 0.5) {
      if (mouseX - x > 0) {
        stepX = 1;
      } else {
        stepX = -1;
      }
    } else {
      stepX = int(random(3))-1;
    }
    float ry = random(1);
    if (ry < 0.5) {
      if (mouseY - y > 0) {
        stepY = 1;
      } else {
        stepY = -1;
      }
    } else {
      stepY = int(random(3))-1;
    }

    x += stepX;
    y += stepY;
  }
}
