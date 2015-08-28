import java.util.*;
import peasy.*;
import de.looksgood.ani.*;
PeasyCam cam;
Slide[] slides;
private Particle[] particles = new Particle[1000];
float particleX = 100;
float particleY = 200;
int BOX_SIZE = 180;
int DISTANCE_SIZE = 10;
int currentSlide = 0;

boolean sketchFullScreen() {
  return true;
}

void setup() {
  size(displayWidth, displayHeight, P3D);
  cam = new PeasyCam(this, width * 1.2); // あまり box の手前をパーティクルに横切って欲しくないので
  cam.setMinimumDistance(width / 2);
  cam.setMaximumDistance(width * 2);
  Ani.init(this);
  fill(63, 127, 255);
  stroke(255);

  slides = new Slide[47];
  for(int i = 0; i < slides.length; i++) {
    slides[i] = new Slide(loadImage("ab-" + nf(i+1, 2) + ".png"));
  }

  List<PImage> images = new ArrayList<PImage>();
  for (Colors c : Colors.values ()) {
    images.add(createLight(c));
  }
  for (int i = 0; i < particles.length; i++) {
    PImage image = images.get(i % images.size());
    particles[i] = new Particle(image);
  }
}

void draw() {
  background(0);
  // drawAxes();
  pushMatrix();

  hint(DISABLE_DEPTH_TEST); // zバッファの無効化
  blendMode(SCREEN);
  cam.rotateX(radians(noise(particleX)-0.5));
  cam.rotateY(radians(noise(particleY)-0.5));
  particleX += 0.02;
  particleY += 0.02;
  float[] rotations = cam.getRotations();
  for (Particle p : particles) {
    p.render(rotations);
  }
  hint(ENABLE_DEPTH_TEST);  // zバッファの有効化
  blendMode(BLEND);

  translate(-BOX_SIZE*2.5-(DISTANCE_SIZE*2.5), -BOX_SIZE*2.5-(DISTANCE_SIZE*2.5), -BOX_SIZE*2.5-(DISTANCE_SIZE*2.5));
  for(SeparateBox sbox : slides[currentSlide].sboxes) {
    if (sbox == null) { continue; }
    sbox.render(cam.getRotations());
  }
  popMatrix();
}

private PImage createLight(Colors colors) {
  int side = 150;
  float center = side / 2.0;
  PImage img = createImage(side, side, RGB);

  for (int y = 0; y < side; y++) {
    for (int x = 0; x < side; x++) {
      float distance = (sq(center - x) + sq(center - y)) / 10;
      int c = colors.calculate(distance);
      img.pixels[x + y * side] = c;
    }
  }

  return img;
}

void keyPressed() {
  switch(key) {
    case ' ':
      for(SeparateBox sbox : slides[currentSlide].sboxes) {
        if (sbox == null) { continue; }
        sbox.rotate();
      }
      break;
    case 's':
      saveFrame("output-###.png");
      break;
    case 'n':
      currentSlide++;
      if (slides.length-1 < currentSlide) { currentSlide = 0; }
      break;
    case 'p':
      currentSlide--;
      if (currentSlide < 0) { currentSlide = slides.length-1; }
      break;
  }
}
void drawAxes() {
  beginShape(LINES);
  stroke(255,0,0);
  vertex(0,0,0);
  vertex(1000,0,0);

  stroke(0,255,0);
  vertex(0,0,0);
  vertex(0,1000,0);

  stroke(0,0,255);
  vertex(0,0,0);
  vertex(0,0,1000);
  endShape();
}
