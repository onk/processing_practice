float x = 0;
float y = 0;
float dx = 1;
float dy = 0;
float g = 0.1;

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
