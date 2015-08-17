int lastSecond;
color[] colors;
String colorString;
int fade;
int fadeType;
int FRAME_RATE = 60;

void setup() {
  size(600, 360);
  noStroke();
  textFont(createFont("Tahoma-Bold", 64));
  textSize(64);
  textAlign(CENTER, CENTER);
  frameRate(FRAME_RATE);

  lastSecond = -1;
  colors = new color[2];
  fade = 0;
  fadeType = 0;
}

void draw() {
  int currentSecond = second();

  if (lastSecond != currentSecond) {
    setColors(currentSecond);
    fade = (int) FRAME_RATE/4;
    fadeType = currentSecond % 4;
    lastSecond = currentSecond;
  }

  if (fade > 0) {
    displayColor();
    fade--;
  }
}

// 1. 白地に青文字で描画
// 2. (cx1, cy1), (cx2, cy2) の矩形のピクセルを保存
// 3. (nx1, ny1), (nx2, ny2) の矩形を青地に
// 4. 白文字で描画
// 5. 2 を描き戻す
void displayColor() {
  // 1. 白地に青文字で描画
  background(colors[1]);
  fill(colors[0]);
  text(colorString, width/2, height/2);

  // 保存する領域
  int cx1 = 0;
  int cy1 = 0;
  int cx2 = 0;
  int cy2 = 0;
  // 新しい色で描画する領域
  int nx1 = 0;
  int ny1 = 0;
  int nx2 = 0;
  int ny2 = 0;
  int fr = (int) FRAME_RATE/4;
  switch (fadeType) {
    case 0: // 上から下に
      cx1 = 0;
      cy1 = (height/fr)*(fr-fade+1);
      cx2 = width;
      cy2 = height;
      nx1 = 0;
      ny1 = 0;
      nx2 = width;
      ny2 = (height/fr)*(fr-fade+1);
      break;
    case 1: // 右から左に
      cx1 = 0;
      cy1 = 0;
      cx2 = (width/fr)*(fade-1);
      cy2 = height;
      nx1 = (width/fr)*(fade-1);
      ny1 = 0;
      nx2 = width;
      ny2 = height;
      break;
    case 2: // 下から上に
      cx1 = 0;
      cy1 = 0;
      cx2 = width;
      cy2 = (height/fr)*(fade-1);
      nx1 = 0;
      ny1 = (height/fr)*(fade-1);
      nx2 = width;
      ny2 = height;
      break;
    case 3: // 左から右に
      cx1 = (width/fr)*(fr-fade+1);
      cy1 = 0;
      cx2 = width;
      cy2 = height;
      nx1 = 0;
      ny1 = 0;
      nx2 = (width/fr)*(fr-fade+1);
      ny2 = height;
      break;
  }

  // 2. (cx1, cy1), (cx2, cy2) の矩形のピクセルを保存
  color[] _pixels = new color[width*height];
  loadPixels();
  arraycopy(pixels, _pixels);

  // 3. (nx1, ny1), (nx2, ny2) の矩形を青地に
  for (int y = ny1; y < ny2; y++) {
    for (int x = nx1; x < nx2; x++) {
      int id = y * width + x;
      pixels[id] = colors[0];
    }
  }
  updatePixels();

  // 4. 白文字で描画
  fill(colors[1]);
  text(colorString, width/2, height/2);

  // 5. 2 を描き戻す
  loadPixels();
  for (int y = cy1; y < cy2; y++) {
    for (int x = cx1; x < cx2; x++) {
      int id = y * width + x;
      pixels[id] = _pixels[id];
    }
  }
  updatePixels();
}

void setColors(int currentSecond) {
  colorString = "#" + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
  color timeColor = color(unhex(nf(hour(), 2)), unhex(nf(minute(), 2)), unhex(nf(second(), 2)));
  color bgColor   = color(255);
  if (currentSecond % 2 == 0) {
    colors[0] = timeColor;
    colors[1] = bgColor;
  } else {
    colors[0] = bgColor;
    colors[1] = timeColor;
  }
}
