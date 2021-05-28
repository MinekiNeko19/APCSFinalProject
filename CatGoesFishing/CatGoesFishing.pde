Cat player;
ArrayList<Fish> swimmers;

void setup() {
  background(125,200,250);
  size(1080,810);
  player = new Cat();
  player.drawCat();
  swimmers= new ArrayList<Fish>();
  for (int i=0;i<10;i++){
    int size= (int)random(3);
    float y= random(270,height);
    float x= random(width-80)+40; // border of 40
    swimmers.add(new Fish(size,x,y,2,2));
  }
}

void draw() {
  background(125,200,250);
  // draws in the water
  noStroke();
  fill(20,10,255,200);
  rect(0,260,width,height);
  // reports the currency
  textSize(20);
  fill(0);
  text("Points: " + player.points(),0,20);
  for (Fish f : swimmers) {
    if (f.hook(player.rod().bx(),player.rod().by())) {
      player.caught(f);
      f.moveTo(player.rod().bx(),player.rod().by());
    }
    f.move();
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
        player.rod().by()<= 280 && keyCode == 32) { // spacebar
      println(swimmers.remove(player.sell()));
      swimmers.add(new Fish((int)random(3),random(width-80)+40,random(270,height),2,2));
    }
  }
  player.drawCat();
  
}
