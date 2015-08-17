int lastSecond;
color[] colors;
String colorString;
int fade;

void setup() {
  size(640, 360);
  noStroke();
  textSize(64);
  textAlign(CENTER, CENTER);

  lastSecond = -1;
  colors = new color[2];
  fade = 0;
}

void draw() {
  int currentSecond = second();

  if (fade > 0) {
    displayColor();
    fade--;
  }

  if (lastSecond != currentSecond) {
    setColors(currentSecond);
    fade = 15;
    lastSecond = currentSecond;
  }
}

void displayColor() {
  fill(colors[0], 48);
  rect(0, 0, width, height);
  fill(colors[1]);
  text(colorString, width/2, height/2);
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
