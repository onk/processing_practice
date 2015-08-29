class Slide {
  SeparateBox[] sboxes;
  PImage[] imgs = new PImage[36];

  Slide(PImage img) {
    for(int y = 0; y < 6; y++) {
      for(int x = 0; x < 6; x++) {
        int i = x*6+y;
        imgs[i] = img.get(x * BOX_SIZE/2, y * BOX_SIZE/2, BOX_SIZE/2, BOX_SIZE/2);
      }
    }

    sboxes = new SeparateBox[6*6*6];
    for(int x = 0; x < 6; x++) {
      for(int y = 0; y < 6; y++) {
        for(int z = 0; z < 6; z++) {
          if (x == 0 || y == 0 || z == 0 || x == 5 || y == 5 || z == 5) {
            sboxes[x + y*6 + z*6*6] = new SeparateBox(x, y, z, imgs);
          }
        }
      }
    }
  }
}
