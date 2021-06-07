class Cat {
  private int currency;
  private color cat;
  private color boat;
  private int rodSpeed;
  private int x;
  private int y;
  private int w;
  private int h;
  private Rod r;
    
  Cat() {
    currency = 0;
    cat = color(255);
    boat = color(100,25,10);
    rodSpeed = 2;
    x = 540;
    y = 185;
    w = 50;
    h = 80;
    r = new Rod(x,y);
  }
    
  void drawCat() { // will be more complicated when adding graphics
    noStroke();
    
    //cat

    fill(255);
    //body of the cat
    rect(x-w/2,y-h,w,h); 
    //ears of the cat
    triangle(x-w/2,y-h,(x-w/2)+w/3,y-h,(x-w/2)+w/6,y-h-20);
    triangle((x-w/2)+w,y-h,(x-w/2)+w-w/3,y-h,(x-w/2)+w-w/6,y-h-20);
    //eyes
    //fill(000);
    //ellipse();
    //ellipse();


    
    //boat
    fill(boat);
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
    r.adjust(rodSpeed,x,y);
  }
  
  void reelLine() {
    r.adjust(-rodSpeed,x,y);
  }
  
  void caught(Fish f) {
    r.caught(f);
  }
  Fish sell() {
    currency += r.checkHook().GetValue();
    return r.release(0);
  }
  
  Fish makeBait(){
    return r.release(1);
  }
  // returns the stats of the cat 
  // rod stats
  Rod rod() {
    return r;
  }
  int points() {
    return currency;
  }
  int rodSpeed() {
    return rodSpeed;
  }
}
