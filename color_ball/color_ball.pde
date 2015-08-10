int BALL_NUM = 3;
Ball[] balls = new Ball[BALL_NUM];
void setup() {
  size(320, 240);
  background(0, 0, 0);
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball();
  }
}

void draw() {
  fill(0, 0, 0, 10);
  rect(0, 0, width, height);
  for (int i = 0; i < balls.length; i++) {
    balls[i].draw();
  }
}

// hsv -> rgb
// s, b は max 固定
// @param h [Integer] hue 0..360 degree
int[] hue2rgb(int h) {
  int[] rgb = new int[3];
  int i = (int) Math.floor(h / 60.0f) % 6;
  int x = (int) ((1 - (float)Math.abs((h / 60.0f) % 2 - 1)) * 255);
  switch(i) {
    case 0:
      rgb[0] = 255;
      rgb[1] = x;
      rgb[2] = 0;
      break;
    case 1:
      rgb[0] = x;
      rgb[1] = 255;
      rgb[2] = 0;
      break;
    case 2:
      rgb[0] = 0;
      rgb[1] = 255;
      rgb[2] = x;
      break;
    case 3:
      rgb[0] = 0;
      rgb[1] = x;
      rgb[2] = 255;
      break;
    case 4:
      rgb[0] = x;
      rgb[1] = 0;
      rgb[2] = 255;
      break;
    case 5:
      rgb[0] = 255;
      rgb[1] = 0;
      rgb[2] = x;
      break;
  }
  return rgb;
}

class Ball {
  int h = 0;
  int x = 0;
  int y = 0;
  int dx = 0;
  int dy = 0;

  Ball() {
    x = (int) random(width);
    y = (int) random(height);
    h = (int) random(360);
    dx = (int) random(4) + 1;
    dy = (int) random(4) + 1;
  }

  void draw() {
    h++;
    if (h > 360) {
      h = 0;
    }

    x = x + dx;
    y = y + dy;
    if (x > width) {
      dx = dx * -1;
    }
    if (x < 0) {
      dx = dx * -1;
    }
    if (y > height) {
      dy = dy * -1;
    }
    if (y < 0) {
      dy = dy * -1;
    }

    int[] rgb = hue2rgb(h);
    fill(rgb[0], rgb[1], rgb[2]);
    noStroke();
    ellipse(x, y, 30, 30);
  }
}
