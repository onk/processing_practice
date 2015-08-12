Line line1;
Line line2;

void setup() {
  size(480, 320);
  background(#ffffff);

  line1 = new Line(new Point(), new Point());
  line2 = new Line(new Point(), new Point());
}
void draw() {
  line1.draw();
  line2.draw();

  // 交点を描画
  line1.intersect_point(line2).draw();
}


void mousePressed() {
  background(#ffffff);
  line1 = new Line(new Point(), new Point());
  line2 = new Line(new Point(), new Point());
}

class Point {
  float x;
  float y;

  Point(float x, float y) {
    this.x = x;
    this.y = y;
  }

  Point() {
    this.x = random(width);
    this.y = random(height);
  }

  void draw() {
    ellipse(this.x, this.y, 15, 15);
  }
}

class Line {
  Point p1;
  Point p2;

  Line(Point p1, Point p2) {
    this.p1 = p1;
    this.p2 = p2;
  }

  void draw() {
    line(p1.x, p1.y, p2.x, p2.y);
  }

  // 衝突点の Point を返す
  Point intersect_point(Line other) {
    // 求める点 p[x, y]
    float x;
    float y;

    // 連立一次方程式を解く
    float a1;
    float b1;
    float a2;
    float b2;

    // それぞれ y = ax + b の形にする
    a1 = (this.p2.y - this.p1.y)/(this.p2.x - this.p1.x);
    a2 = (other.p2.y - other.p1.y)/(other.p2.x - other.p1.x);
    b1 = this.p1.y - a1 * this.p1.x;
    b2 = other.p1.y - a2 * other.p1.x;

    // y を消去する
    // a1 * x + b1 = a2 * x + b2
    // (a1 - a2) * x = b2 - b1
    x = (b2 - b1)/(a1 - a2);
    // y を代入する
    y = a1 * x + b1;

    return new Point(x, y);
  }
}
