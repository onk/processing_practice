void setup() {
  size(512, 512);
  background(0);
  noSmooth();
  noLoop();
}

void draw() {
  // 視点を決める
  PVector viewPoint = new PVector(0, 0, -5);
  // 球を設置する(中心点と半径)
  PVector rCenter = new PVector(0, 0, -5);
  float r = 1.0;
  // 画面を (-1, 1, 0)〜(1, -1, 0) の原点を中心とした 2x2 の平面として描画する
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      // 視点と 点 (x, y) に向かう半直線と球との交差判定を行う
      boolean isCollision = false; // TODO: 未実装

      if (isCollision) {
        stroke(255, 0, 0);
      } else {
        stroke(0, 0, 255);
      }
      point(x, y);
    }
  }
}
