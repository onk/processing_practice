class SeparateBox {
  int boxSize;
  int x;
  int y;
  int z;
  float rx;
  float ry;
  float rz;
  boolean move;
  PImage[] texes = new PImage[6]; // 6面あるので

  SeparateBox(int x, int y, int z, PImage[] imgs) {
    this.x = x;
    this.y = y;
    this.z = z;
    move = random(1) < 0.7;
    rx = 0;
    ry = 0;
    rz = 0;
    texes[0] = imgs[ x   * 6 +  y   ];
    texes[1] = imgs[(5-x)* 6 +  y   ];
    texes[2] = imgs[ x   * 6 + (5-z)];
    texes[3] = imgs[ x   * 6 +  z   ];
    texes[4] = imgs[(5-z)* 6 +  y   ];
    texes[5] = imgs[ z   * 6 +  y   ];
  }
  void render(float[] rotation) {
    pushMatrix();
    translate(x*(BOX_SIZE+DISTANCE_SIZE), y*(BOX_SIZE+DISTANCE_SIZE), z*(BOX_SIZE+DISTANCE_SIZE));
    // rotateX(rotation[0]);
    // rotateY(rotation[1]);
    // rotateZ(rotation[2]);
    rotateX(radians(rx));
    rotateY(radians(ry));
    rotateZ(radians(rz));
    texturedCube(texes, BOX_SIZE / 2);
    popMatrix();
  }

  void rotate(int c) {
    rx = 0;
    ry = 0;
    rz = 0;
    if (move) {
      String target = "rx";
      switch(c) {
        case 0:
          target = "rx";
          break;
        case 1:
          target = "ry";
          break;
        case 2:
          target = "rz";
          break;
      }
      Ani ani = new Ani(this, 3.0, target, 720);
    }
  }

  void texturedCube(PImage[] texes, int scaleRate) {
    noStroke();
    noFill();

    // +Z "front" face
    beginShape(QUADS);
    texture(texes[0]);
    vertex(-scaleRate, -scaleRate,  scaleRate, 0, 0);
    vertex( scaleRate, -scaleRate,  scaleRate, scaleRate, 0);
    vertex( scaleRate,  scaleRate,  scaleRate, scaleRate, scaleRate);
    vertex(-scaleRate,  scaleRate,  scaleRate, 0, scaleRate);
    endShape();

    // -Z "back" face
    beginShape(QUADS);
    texture(texes[1]);
    vertex( scaleRate,  scaleRate, -scaleRate, 0, scaleRate);
    vertex(-scaleRate,  scaleRate, -scaleRate, scaleRate, scaleRate);
    vertex(-scaleRate, -scaleRate, -scaleRate, scaleRate, 0);
    vertex( scaleRate, -scaleRate, -scaleRate, 0, 0);
    endShape();

    // +Y "bottom" face
    beginShape(QUADS);
    texture(texes[2]);
    vertex(-scaleRate,  scaleRate,  scaleRate, 0, 0);
    vertex( scaleRate,  scaleRate,  scaleRate, scaleRate, 0);
    vertex( scaleRate,  scaleRate, -scaleRate, scaleRate, scaleRate);
    vertex(-scaleRate,  scaleRate, -scaleRate, 0, scaleRate);
    endShape();

    // -Y "top" face
    beginShape(QUADS);
    texture(texes[3]);
    vertex(-scaleRate, -scaleRate, -scaleRate, 0, 0);
    vertex( scaleRate, -scaleRate, -scaleRate, scaleRate, 0);
    vertex( scaleRate, -scaleRate,  scaleRate, scaleRate, scaleRate);
    vertex(-scaleRate, -scaleRate,  scaleRate, 0, scaleRate);
    endShape();

    // +X "right" face
    beginShape(QUADS);
    texture(texes[4]);
    vertex( scaleRate, -scaleRate,  scaleRate, 0, 0);
    vertex( scaleRate, -scaleRate, -scaleRate, scaleRate, 0);
    vertex( scaleRate,  scaleRate, -scaleRate, scaleRate, scaleRate);
    vertex( scaleRate,  scaleRate,  scaleRate, 0, scaleRate);
    endShape();

    // -X "left" face
    beginShape(QUADS);
    texture(texes[5]);
    vertex(-scaleRate, -scaleRate, -scaleRate, 0, 0);
    vertex(-scaleRate, -scaleRate,  scaleRate, scaleRate, 0);
    vertex(-scaleRate,  scaleRate,  scaleRate, scaleRate, scaleRate);
    vertex(-scaleRate,  scaleRate, -scaleRate, 0, scaleRate);
    endShape();
  }
}
