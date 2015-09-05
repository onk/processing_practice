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
    // 線の方程式は X = l.s + t * l.v
    // 球の方程式は (X-c)^2 = r^2
    // 連立させて
    // (s + t*v - c)^2 = r^2
    // ベクトルの加算減算は順不同なので
    // ((s-c) + t*v)^2 = r^2
    // t について整理すると
    // (|v|^2 * t^2) + (2*v*(x-c)*t) + (|s-c|^2 - r^2) = 0
    // これを A*t^2 + B*t + C = 0 の一時変数にする
    // A = |v|^2
    // B = 2*v*(x-c)
    // C = |s-c|^2 - r*r
    // B の値が偶数なので A*t^2 + 2B*t + C = 0 の形を用いる
    // B = v*(x-c)
    // ここで判別式D (B^2 - AC) の値が
    // D < 0 ... 解が虚数
    // D = 0 ... 球に接する
    // D > 0 ... 球と交点を2つ持つ
    // よって交差するかどうかは D >= 0 を確かめれば良い。
    PVector s_c = PVector.sub(l.s, c);
    float a = sq(l.v.mag());
    float b = PVector.dot(l.v, s_c);
    float c = sq(s_c.mag()) - sq(r);
    float d = sq(b) - a * c;
    return d >= 0;
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
