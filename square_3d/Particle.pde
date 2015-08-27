class Particle {

  private final PImage light;
  private final float x, y, z;

  Particle(PImage light) {
    this.light = light;

    float radP = radians(random(360));

    float unitZ = random(-1, 1);
    float sinT = sqrt(1 - sq(unitZ));

    float unitR = pow(random(1), 1.0/3.0);
    float r = width;

    x = r * unitR * sinT * cos(radP);
    y = r * unitR * sinT * sin(radP);
    z = r * unitR * unitZ;
  }

  void render(float[] rotation) {
    pushMatrix();
    translate(x, y, z);
    rotateX(rotation[0]);
    rotateY(rotation[1]);
    rotateZ(rotation[2]);
    image(light, 0, 0);
    popMatrix();
  }
}
