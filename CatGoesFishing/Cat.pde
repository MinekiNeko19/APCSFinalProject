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
      noStroke();
      //cat
      rect(x-w/2,y-h,w,h);
      //boat
      rect(x-w,y-25,2*w,25);
    }
  
}
