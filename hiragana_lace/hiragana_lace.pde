float VT = radians(45);
int FONT_SIZE = 64;
PFont font;
float theta;
int gyou;
int retsu;

final String[][] chars = {
  { "あ", "い", "う", "え", "お" },
  { "か", "き", "く", "け", "こ" },
  { "さ", "し", "す", "せ", "そ" },
  { "た", "ち", "つ", "て", "と" },
  { "な", "に", "ぬ", "ね", "の" },
  { "は", "ひ", "ふ", "へ", "ほ" },
  { "ま", "み", "む", "め", "も" },
  { "や", "",   "ゆ", "",   "よ" },
  { "ら", "り", "る", "れ", "ろ" },
  { "わ", "",   "",   "",   "を" },
  { "ん", "",   "",   "",   ""   },
  { "が", "ぎ", "ぐ", "げ", "ご" },
  { "ざ", "じ", "ず", "ぜ", "ぞ" },
  { "だ", "ぢ", "づ", "で", "ど" },
  { "ば", "び", "ぶ", "べ", "ぼ" },
  { "ぱ", "ぴ", "ぷ", "ぺ", "ぽ" }
};

void setup() {
  size((FONT_SIZE+16)*chars.length + FONT_SIZE, (FONT_SIZE+16) * 5 + FONT_SIZE);
  theta = 0f;
  gyou = 0;
  retsu = 0;
  background(255);
  font = createFont("Serif", FONT_SIZE);
  textFont(font);
}


void draw() {
  textSize(FONT_SIZE);
  fill(0);

  pushMatrix();
    translate(gyou * (FONT_SIZE+16) + FONT_SIZE, retsu * (FONT_SIZE+16) + FONT_SIZE);
    rotate(theta);
    text(chars[gyou][retsu], -FONT_SIZE/2, FONT_SIZE/2);
  popMatrix();

  theta = theta + VT;
  if (theta >= PI*2) {
    retsu++;
    if (retsu > 4) {
      retsu = 0;
      gyou++;
      if (gyou >= chars.length) {
        gyou = 0;
        background(255);
      }
    }
    theta = 0f;
  }
}
