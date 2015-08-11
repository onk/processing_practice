float x1;
float y1;
float x2;
float y2;
float x3;
float y3;
float x4;
float y4;

void setup() {
  size(480, 320);
  background(#ffffff);

  x1 = random(width);
  y1 = random(height);
  x2 = random(width);
  y2 = random(height);
  x3 = random(width);
  y3 = random(height);
  x3 = random(width);
  y4 = random(height);
}
void draw() {
  line(x1, y1, x2, y2);
  line(x3, y3, x4, y4);

  float[] xy = line_intersect_point();
  ellipse(xy[0], xy[1], 15, 15);
}

// 衝突点の [x, y] を返す
float[] line_intersect_point() {
  // 求める点 p[x, y]
  float[] p = new float[2];

  // 連立一次方程式を解く
  float a1;
  float b1;
  float a2;
  float b2;

  // それぞれ y = ax + b の形にする
  a1 = (y2 - y1)/(x2 - x1);
  a2 = (y4 - y3)/(x4 - x3);
  b1 = y1 - a1*x1;
  b2 = y3 - a2*x3;

  // y を消去する
  // a1 * x + b1 = a2 * x + b2
  // (a1 - a2) * x = b2 - b1
  p[0] = (b2 - b1)/(a1 - a2);
  // y を代入する
  p[1] = a1 * p[0] + b1;

  return p;
}

void mousePressed() {
  background(#ffffff);
  x1 = random(width);
  y1 = random(height);
  x2 = random(width);
  y2 = random(height);
  x3 = random(width);
  y3 = random(height);
  x3 = random(width);
  y4 = random(height);
}
