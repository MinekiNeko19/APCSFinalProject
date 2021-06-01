Cat player;
ArrayList<Fish> swimmers;

void setup() {
  background(125,200,250);
  size(1080,810);
  player = new Cat();
  player.drawCat();
  swimmers= new ArrayList<Fish>();
  for (int i=0;i<10;i++){
    swimmers.add(new Fish());
  }
}

void draw() {
  background(125,200,250);
  // draws in the water
  noStroke();
  fill(20,10,255,200);
  rect(0,175,width,height);
  // reports the currency
  textSize(20);
  fill(0);
  text("Points: " + player.points(),0,20);
  for (Fish f : swimmers) {
    if (f == player.rod().checkHook()) {// if fish is on line it'll move with the line
      f.moveTo(player.rod().bx(), player.rod().by());
    }
    else if (player.rod().checkHook() == null && 
      f.hook(player.rod().bx(), player.rod().by(),player.rod())) {//fish determines whether the line is worth biting
      //f.moveTo(player.rod().bx(), player.rod().by());
      player.caught(f);
    } else {
      f.move();
    }
    f.drawFish();
  }
  if (keyPressed) {
    if (keyCode == LEFT) {
      player.moveLeft(10);
    }
    if (keyCode == RIGHT) {
      player.moveRight(10);
    }
    if (keyCode == UP) {
      player.reelLine();
    }
    if (keyCode == DOWN) {
      player.dropLine();
    }
    if (player.rod().checkHook() != null &&
        player.rod().by()<= 200 && keyCode == 90) { // z key
      swimmers.remove(player.sell());
      swimmers.add(new Fish());
    }
    if (player.rod().checkHook() != null &&
        player.rod().by()<= 200 && keyCode == 16) {//shift key
      swimmers.remove(player.makeBait());
      swimmers.add(new Fish());
    }
  }
  player.drawCat();
  
}
