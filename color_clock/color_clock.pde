int lastSecond;

void setup() {
  size(640, 360);
  background(0);
  fill(255);
  noStroke();
  textSize(64);
  textAlign(CENTER, CENTER);

  lastSecond = -1;
}

void draw() {
  int currentSecond = second();

  if (lastSecond != currentSecond) {
    color timeColor = color(unhex(nf(hour(), 2)), unhex(nf(minute(), 2)), unhex(nf(second(), 2)));
    background(timeColor);
    String colorString = "#" + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
    text(colorString, width/2, height/2);
    lastSecond = currentSecond;
  }
}
