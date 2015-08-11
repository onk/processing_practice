float x = 0;
float y = 0;
float dx = 1;
float dy = 0;
float g = 0.1;

int mpX;
int mpY;

void setup() {
  size(320, 240);
  background(0, 0, 0);
}

void draw() {
  fill(0, 0, 0, 10);
  rect(0, 0, width, height);

  dy = dy + g;

  x = x + dx;
  y = y + dy;
  if (x < 0 || width < x) { dx = -dx; }
  // 上端では跳ねない
  if (height < y) { dy = -dy; }

  noStroke();
  fill(255, 255, 255);
  ellipse(x, y, 15, 15);
}

void mousePressed() {
  mpX = mouseX;
  mpY = mouseY;
}

void mouseReleased() {
  int mrX = mouseX;
  int mrY = mouseY;

  // マウスを離した地点にボールを置く
  x = (float) mrX;
  y = (float) mrY;
  // 初速、方向はマウスドラッグに依存
  dx = (float)(mpX - mrX)/50.0f;
  dy = (float)(mpY - mrY)/50.0f;
}
