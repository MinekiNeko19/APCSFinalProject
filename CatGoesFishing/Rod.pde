class Rod {
  private int speed;
  private boolean isCast;
  private int baitSize;
  private int x,y;
  private int lineLen;
  
  Rod(int xcor, int ycor) {
    speed = 10;
    isCast = false;
    baitSize = 0;
    x = xcor;
    y = ycor;
    lineLen = 0;
  }
  
  void adjust(int l, int xcor, int ycor) { // if throwing rod is implemented will change or maybe use a new method for that
    lineLen += l;
    if (lineLen > 0) isCast = true;
    if (lineLen < 0) {
      lineLen = 0;
      isCast = false;
    }
    if (lineLen > height) lineLen -= l;
    
    x = xcor; y = ycor;
  }
  
  void drawLine() {
    stroke(0);
    line(x,y,x,y+lineLen);
    noStroke();
    fill(255,0,0,50);
    ellipse(x,y+lineLen,baitSize*10,baitSize*10);
  }
}
