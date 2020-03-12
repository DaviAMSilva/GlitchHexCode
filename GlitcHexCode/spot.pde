class Spot {
  int x;
  int y;
  String letter;
  color spotColor;

  public Spot(int x_, int y_, int num) {
    x = x_;
    y = y_;

    letter = hex(num, 1);
    spotColor = mario.get(this.x + spotWidth / 4, this.y + spotHeight / 2);
  }

  // fill, background, tint
  void draw(int fillNum, color fillColor, int tintNum, color tintColor, boolean drawText) {

    // TINT
    if (tintNum == 0) {
      tint(random(255), random(255), random(255), random(255));
    } else if (tintNum == 1) {
      tint(spotColor);
    } else if (tintNum == 2) {
      tint(tintColor);
    }
    image(mario.get(this.x-1, this.y-1, spotWidth+1, spotHeight+1), this.x-1, this.y-1);
    noTint();

    if (drawText) {
      fill(BACKGROUND);
      noStroke();
      rect(this.x-1, this.y-1, spotWidth+2, spotHeight+2);
    }

    // FILL
    if (fillNum == 0) {
      fill(random(255), random(255), random(255), random(255));
    } else if (fillNum == 1) {
      fill(spotColor);
    } else if (fillNum == 2) {
      fill(fillColor);
    }

    // TEXT
    if (drawText) {
      stroke(OUTLINE);
      text(this.letter, this.x, this.y + letterSize * 6 / 7);
    }

    // RANDOM SPRITE (eventually, possibly, maybe? ...)
  }

  void updateValue(int num) {
    letter = hex(num, 1);
  }
}






//
