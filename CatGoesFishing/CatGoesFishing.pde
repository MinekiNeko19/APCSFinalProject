Cat player;


void setup() {
  background(125,200,250);
  size(1080,810);
  player = new Cat();
  player.drawCat();
}

void draw() {
  background(125,200,250);
  if (keyPressed) {
    if (keyCode == LEFT) {
      player.moveLeft(10);
      player.drawCat();
    }
    if (keyCode == RIGHT) {
      player.moveRight(10);
      player.drawCat();
    }
    if (keyCode == UP) {
      player.reelLine();
      player.drawCat();
    }
    if (keyCode == DOWN) {
      player.dropLine();
      player.drawCat();
    }
  }
  player.drawCat();
  
}
