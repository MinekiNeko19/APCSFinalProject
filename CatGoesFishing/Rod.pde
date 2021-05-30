class Rod {
  private int speed;
  private int baitSize;
  private int x,y;
  private int lineLen;
  private Fish f;
  
  Rod(int xcor, int ycor) {
    speed = 10;
    baitSize = 0;
    x = xcor;
    y = ycor;
    lineLen = 0;
  }
  
  void adjust(int l, int xcor, int ycor) { // if throwing rod is implemented will change or maybe use a new method for that
    lineLen += l;
    if (lineLen < 0) {
      lineLen = 0;
    }
    if (lineLen > height) lineLen -= l;
    
    x = xcor; y = ycor;
  }
  
  void drawLine() {
    stroke(0);
    line(x,y,x,y+lineLen);
    noStroke();
    if (f == null) {
      fill(255,0,0,50);
      ellipse(x,y+lineLen,baitSize*10,baitSize*10);
    }
  }
  
  void caught(Fish fish) {
    baitSize = (int)f.getSize();
    f = fish;
  }
  Fish release() {
    Fish temp = f;
    baitSize = 0;
    f = null;
    return temp;
  }
  
  int bait() {
    return baitSize;
  }
  int bx() {
    return x;
  }
  int by() {
    return y+lineLen;
  }
  Fish checkHook() {
    return f;
  }
}
