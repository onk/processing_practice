void setup() {
  size(512, 512);
  background(0);
  noSmooth();
  noLoop();
}

void draw() {
  // 視点を決める
  PVector viewPoint = new PVector(0, 0, -5);
  // 球を設置する
  Sphere sphere = new Sphere(new PVector(0, 0, 5), 1.0f);
  // 画面を (-1, 1, 0)〜(1, -1, 0) の原点を中心とした 2x2 の平面として描画する
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      // [-1, 1], [1, -1] となるよう変換する
      float xw = map(x, 0, width, -1,  1);
      float yw = map(y, 0, height, 1, -1);
      // 視点と 点(x, y) の半直線
      Line line = new Line(viewPoint, PVector.sub(new PVector(xw, yw, 0), viewPoint));
      // 交差判定
      if (sphere.isIntersect(line)) {
        stroke(255, 0, 0);
      } else {
        stroke(0, 0, 255);
      }
      point(x, y);
    }
  }
}

class Sphere {
  PVector c;
  float r;

  Sphere(PVector c, float r) {
    this.c = c;
    this.r = r;
  }

  boolean isIntersect(Line l) {
    // TODO: 未実装
    return false;
  }
}

class Line {
  PVector s;
  PVector v;

  Line(PVector s, PVector v) {
    this.s = s;
    this.v = v;
  }
}
