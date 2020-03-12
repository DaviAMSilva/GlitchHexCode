PImage mario;
PFont marioFont;
int letterSize = 54;
int spotWidth = letterSize*6/8;
int spotHeight = letterSize * 8 / 9;
int cols;
int rows;
color OUTLINE, BACKGROUND, GREEN, LIGHT_BLUE;

Spot[] spots;

void settings() {
  mario = loadImage("SuperMarioWorld.jpg");
  //mario = loadImage("SuperMarioWorld2.jpg");

  size(mario.width, mario.height);
}

void setup() {
  cols = ceil(width/spotWidth+1);
  rows = ceil(height/spotHeight+1);  

  spots = new Spot[cols*rows];

  background(mario);

  marioFont = createFont("SuperMarioWorld.ttf", 1);

  textFont(marioFont);
  textSize(letterSize * 7 / 8);
  strokeWeight(int(letterSize / 4 + 3));

  mario.loadPixels();

  OUTLINE = color(0, 250);
  BACKGROUND = mario.get(100, 100);
  GREEN = color(0, 255, 0);
  LIGHT_BLUE = color(124, 235, 252);

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      spots[i+j*cols] = new Spot(i*spotWidth, j*spotHeight, int(random(15)));
    }
  }
}

void draw() {
  float xoff = 0;
  float yoff = map(mouseX, 0, width, 0, 1);
  yoff += int(frameCount/5)/10.0;

  int fillNum = 0;
  int tintNum = 0;
  color fillColor = color(0);
  color tintColor = color(0);

  for (Spot s : spots) {
    float n1 = noise(xoff, yoff);
    float n2 = noise(xoff + 200, yoff);
    float n3 = noise(xoff + 300, yoff);
    float n4 = noise(xoff + 400, yoff);
 
    if (n1 < .30) {
      fillNum = 0;
    } else if (n1 < .60) {
      fillNum = 1;
    } else if (n1 < .65) {
      fillNum = 2; 
      fillColor = GREEN;
    } else {
      fillNum = 2; 
      fillColor = LIGHT_BLUE;
    }
    if (n2 < .25) {
      tintNum = 0;
    } else if (n2 < .40) {
      tintNum = 2; 
      tintColor = GREEN;
    } else if (n2 < .50) {
      tintNum = 2; 
      tintColor = LIGHT_BLUE;
    } else {
      tintNum = 3;
    }
    boolean drawText = n3 < .45;
    if (n4 < .30) s.updateValue(int(random(15)));

    // fill, tint, text
    s.draw(fillNum, fillColor, tintNum, tintColor, drawText);

    xoff += .075;
  }
}







//
