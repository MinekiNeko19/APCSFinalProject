class Cat {
  private int currency;
  private color c;
  private int x;
  private int y;
  private int w;
  private int h;
    
  public Cat() {
    currency = 0;
    c = color(250,250,200);
    x = 540;
    y = 270;
    w = 50;
    h = 80;
  }
    
  void drawCat() { // will be more complicated when adding graphics
    clear();
    noStroke();
    fill(255);
    //cat
    rect(x-w/2,y-h,w,h);
    //boat
    fill(100,25,10);
    rect(x-2*w,y-25,4*w,25);
  }
    
  void moveLeft(int step) {
    x = x-step;
    if (x< w/2) { // boundaries will change when background and camera work are implemented
      x = x-w/2;
    }
    drawCat();
  }
  
  void moveRight(int step) {
      x = x+step;
      if (x>displayWidth-w/2) { // boundaries will change when background and camera work are implemented
        x = displayWidth-w/2;
      }
      drawCat();
  }
}
