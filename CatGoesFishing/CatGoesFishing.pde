Cat player;
ArrayList<Fish> swimmers;
Catalogue c;
Shop s;
int boatSpeed;
boolean instructions;

void setup() {
  size(1080,810);
  player = new Cat();
  swimmers= new ArrayList<Fish>();
  boatSpeed = 10;
  swimmers.add (new Fish(1,2,1));
  for (int i=0;i<20;i++){

    swimmers.add(new Fish());
  }
  c = new Catalogue();
  s = new Shop();
  instructions = true;
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
  text("Boat Speed: " + boatSpeed,0,40);
  text("Rod Speed: " + player.rodSpeed(),0,60);
  if (instructions) {
    text("C: Toggle Catalogue",0,80);
    text("S: Toggle Shop",0,100);
    text("Z: Sell Fish",0,120);
    text("Shift: Turn Fish into Bait",0,140);
    text("I: Toggle Help",0,160);
  }
  if (c.visible()) {
    c.displayStats();
  }
  if (s.visible()) {
    String item = s.openShop();
    if (mousePressed) {
      if (item.contains("Boat Speed")) {
        boatSpeed += 2;
      }
    }
  }
  
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
      player.moveLeft(boatSpeed);
    }
    if (keyCode == RIGHT) {
      player.moveRight(boatSpeed);
    }
    if (keyCode == UP) {
      player.reelLine();
    }
    if (keyCode == DOWN) {
      player.dropLine();
    }
    if (keyCode == 67) { // c key
      if (s.visible()) s.toggle();
      c.toggle();
    }
    if (keyCode == 83) { // s key
      if (c.visible()) c.toggle();
      s.toggle();
    }
    if (keyCode == 73) { // i key
      instructions = !instructions;
    }
    if (player.rod().checkHook() != null &&
        player.rod().by()<= 200 && keyCode == 90) { // z key
      Fish temp = player.sell();
      swimmers.remove(temp);
      c.addStat(temp);
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
