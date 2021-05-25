Cat player;

void setup() {
  background(125,200,250);
  size(1080,810);
  player = new Cat();
  player.drawCat();
}

void draw() {
  if (keyPressed) {
    if (keyCode == LEFT) {
      player.moveLeft(10);
    }
    if (keyCode == RIGHT) {
      player.moveRight(10);
    }
  }
  
}
