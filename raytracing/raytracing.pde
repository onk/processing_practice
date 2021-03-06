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
  // 光源を設置する
  PVector lightPoint = new PVector(-5, 5, -5);

  // 画面を (-1, 1, 0)〜(1, -1, 0) の原点を中心とした 2x2 の平面として描画する
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      // [-1, 1], [1, -1] となるよう変換する
      float xw = map(x, 0, width, -1,  1);
      float yw = map(y, 0, height, 1, -1);
      // 視点と 点(x, y) の半直線
      Line line = new Line(viewPoint, PVector.sub(new PVector(xw, yw, 0), viewPoint));
      // 交差判定
      PVector intersection = sphere.intersection(line);
      if (intersection != null) {
        // 交点での拡散反射光の強さは法線ベクトルと入射ベクトルの内積
        PVector n = sphere.normalVector(intersection);
        PVector l = PVector.sub(intersection, lightPoint);
        l.normalize();
        // 内積 (-1..1) を 0..1 に切り詰めて 0..255 にマッピング
        float c = map(constrain(n.dot(l), 0, 1), 0, 1, 0, 255);
        stroke(c);
      } else {
        stroke(100,149,237);
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

  PVector intersection(Line l) {
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
    // 交差しない
    if (d < 0) { return null; }

    float sqrtd = sqrt(d);
    float t1 = (-b - sqrtd) / a;
    float t2 = (-b + sqrtd) / a;
    // 視点より先で先にぶつかる方を交点とする
    float tmax = max(t1, t2);
    float tmin = min(t1, t2);
    if (tmax < 0) { return null; } // 視点より手前
    float t = (0 < tmin) ? tmin : tmax;
    return PVector.add(l.s, PVector.mult(l.v, t));
  }

  // 法線ベクトル
  PVector normalVector(PVector i) {
    PVector n = PVector.sub(c, i);
    n.normalize();
    return n;
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
