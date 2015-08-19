int BALL_NUM = 3;
int BALL_SIZE = 15;
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

  loadPixels();
  for (Ball ball : balls) {
    ball.move();
    ball.draw(pixels);
  }
  updatePixels();
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

  void draw(int[] pixels) {
    int[] rgb = hue2rgb(h);
    int c = color(rgb[0], rgb[1], rgb[2]);

    for(int py = max(y - BALL_SIZE, 0); py < min(y + BALL_SIZE, height); py++){
      for(int px = max(x - BALL_SIZE, 0); px < min(x + BALL_SIZE, width); px++){
        if ((px-x)*(px-x) + (py-y)*(py-y) < BALL_SIZE*BALL_SIZE) {
          int id = py * width + px;
          pixels[id] = blendColor(pixels[id], c, ADD);
        }
      }
    }
  }

  void move() {
    h++;
    if (h > 360) {
      h = 0;
    }

    x = x + dx;
    y = y + dy;
    if (x < 0 || width < x) {
      dx = dx * -1;
    }
    if (y < 0 || height < y) {
      dy = dy * -1;
    }
  }
}
