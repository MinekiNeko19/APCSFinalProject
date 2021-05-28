class Cat {
  private int currency;
  private color c;
  private int x;
  private int y;
  private int w;
  private int h;
  private Rod r;
    
  Cat() {
    currency = 0;
    c = color(250,250,200);
    x = 540;
    y = 270;
    w = 50;
    h = 80;
    r = new Rod(x,y);
  }
    
  void drawCat() { // will be more complicated when adding graphics
    noStroke();
    
    //cat
    fill(255);
    rect(x-w/2,y-h,w,h);
    
    //boat
    fill(100,25,10);
    rect(x-2*w,y-25,4*w,25);
    
    // rod
    r.drawLine();
  }
    
  void moveLeft(int step) {
    x = x-step;
    if (x< w/2) { // boundaries will change when background and camera work are implemented
      x = w/2;
    }
    r.adjust(0,x,y);
  }
  
  void moveRight(int step) {
      x = x+step;
      if (x>width-w/2) { // boundaries will change when background and camera work are implemented
        x = width-w/2;
      }
      r.adjust(0,x,y);
  }
  
  void dropLine() {
    r.adjust(2,x,y);
  }
  
  void reelLine() {
    r.adjust(-2,x,y);
  }
  
  void caught(Fish f) {
    r.caught(f);
  }
  Fish sell() {
    currency += r.checkHook().GetValue();
    return r.release();
  }
    
  // returns the stats of the cat 
  // rod stats
  Rod rod() {
    return r;
  }
  int points() {
    return currency;
  }
}
