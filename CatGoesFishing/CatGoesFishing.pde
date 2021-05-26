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
    float x= random(width-80);
    swimmers.add(new Fish(size,x,y,2,2));
  }
}

void draw() {
  background(125,200,250);
  for (Fish f : swimmers) {
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
  }
  player.drawCat();
  
}
