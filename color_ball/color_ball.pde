int BALL_NUM = 3;
int BALL_SIZE = 15;
Ball[] balls = new Ball[BALL_NUM];
void setup() {
  size(320, 240);
  background(0, 0, 0);
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball(i);
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
  int id;
  int h = 0;
  PVector p;
  PVector v;

  Ball(int id) {
    this.id = id;
    float px = random(width);
    float py = random(height);
    p = new PVector(px, py);
    h = (int) random(360);
    float vx = random(4) + 1;
    float vy = random(4) + 1;
    v = new PVector(vx, vy);
  }

  void draw(int[] pixels) {
    int[] rgb = hue2rgb(h);
    int c = color(rgb[0], rgb[1], rgb[2]);

    for(int py = (int)max(p.y - BALL_SIZE, 0); py < min(p.y + BALL_SIZE, height); py++){
      for(int px = (int)max(p.x - BALL_SIZE, 0); px < min(p.x + BALL_SIZE, width); px++){
        if ((px-p.x)*(px-p.x) + (py-p.y)*(py-p.y) < BALL_SIZE*BALL_SIZE) {
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

    p.x = p.x + v.x;
    p.y = p.y + v.y;
    if (p.x < BALL_SIZE || (width - BALL_SIZE) < p.x) {
      v.x = v.x * -1;
      if (p.x < BALL_SIZE) { p.x = BALL_SIZE; }
      if ((width - BALL_SIZE) < p.x) { p.x = width - BALL_SIZE; }
    }
    if (p.y < BALL_SIZE || (height - BALL_SIZE) < p.y) {
      v.y = v.y * -1;
      if (p.y < BALL_SIZE) { p.y = BALL_SIZE; }
      if ((height - BALL_SIZE) < p.y) { p.y = height - BALL_SIZE; }
    }

    // 衝突判定
    for (Ball ball : balls) {
      if (ball.id == id) {
        continue;
      }

      if (isCollidion(ball)) {
        // 衝突したら色を変える
        h = (int) random(255);

        // 反発後の移動方向を設定
        v.x = v.x * -1;
        v.y = v.y * -1;
      }
    }
  }

  boolean isCollidion(Ball other) {
    float dx = this.p.x - other.p.x;
    float dy = this.p.y - other.p.y;
    return BALL_SIZE + BALL_SIZE > sqrt(dx*dx + dy*dy);
  }
}
