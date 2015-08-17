int lastSecond;
color[] colors;
String colorString;
int fade;
int fadeType;
int FRAME_RATE = 60;

void setup() {
  size(600, 360);
  noStroke();
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

  if (fade > 0) {
    displayColor();
    fade--;
  }

  if (lastSecond != currentSecond) {
    setColors(currentSecond);
    fade = (int) FRAME_RATE/4;
    fadeType = currentSecond % 4;
    background(colors[1]);
    fill(colors[0]);
    text(colorString, width/2, height/2);
    lastSecond = currentSecond;
  }
}

void displayColor() {
  int sx = 0;
  int sy = 0;
  int dx = 0;
  int dy = 0;
  int fr = (int) FRAME_RATE/4;
  switch (fadeType) {
    case 0: // 上から下に
      sx = 0;
      sy = (height/fr)*(fr-fade);
      dx = width;
      dy = (height/fr)*(fr-fade+1);
      break;
    case 1: // 右から左に
      sx = (width/fr)*(fade-1);
      sy = 0;
      dx = (width/fr)*(fade);
      dy = height;
      break;
    case 2: // 下から上に
      sx = 0;
      sy = (height/fr)*(fade-1);
      dx = width;
      dy = (height/fr)*(fade);
      break;
    case 3: // 左から右に
      sx = (width/fr)*(fr-fade);
      sy = 0;
      dx = (width/fr)*(fr-fade+1);
      dy = height;
      break;
  }

  loadPixels();
  for (int y = sy; y < dy; y++) {
    for (int x = sx; x < dx; x++) {
      int id = y * width + x;
      if (pixels[id] == colors[0]) {
        pixels[id] = colors[1];
      } else {
        pixels[id] = colors[0];
      }
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
