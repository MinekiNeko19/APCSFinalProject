class Fish{
  private int Size, x, y, dx, dy,radius;
  private color c;
  private Boolean Hooked;
  private double value;
  private String type;
  private int topLimit, bottomLimit;
  
  
  Fish(int Size, int dx, int dy){//constructs a fish
    this.Size=Size;
    Hooked=false;
    this.dx=dx;
    this.dy=dy;
    x = (int)(Math.random()*(width-80)+40);
    if(Size==1){
      type= "small";
      value=5;
      radius=20;
      c = color(102,0,204);
      y = (int)(Math.random()*250+250);
      topLimit = 250;
      bottomLimit = 450;
    }
    if (Size==2){
      type= "medium";
      value= 10;
      radius=40;
      c = color(0,255,0);
      y = (int)(Math.random()*250+400);
      topLimit = 400;
      bottomLimit = 650;
    }
    if (Size==3){
      type= "large";
      value=15;
      radius=80;
      c = color(255,0,0);
      y = (int)(Math.random()*250+600);
      topLimit = 600;
      bottomLimit = height-radius;
    }
    if (Math.random()<0.01) {
      type = "Special " + type;
      value += 50;
      c = color(red(c),green(c),blue(c),150);
    }
  }
  
  Fish() {
    this(
      (int)(Math.random()*3)+1,2,1);
  }
  
  double GetValue(){//returns the value of the fish
    return value;
  }
  float getSize() {
    return Size;
  }
  
  boolean hook(int bx, int by, Rod r) {
    if (bx < x+radius 
        && bx > x-radius 
        && by < y+radius 
        && by > y-radius) {
      Hooked = detectBait(r);
    }
    if(Hooked){
      moveTo(bx,by);
    }
    return Hooked;
  }
  boolean detectBait(Rod r){
    if (r.bait() >= Size-1){
      return true;
    }
    else{
      return false;
    }
  }
  
  void moveTo(int newX, int newY) {
    x = newX;
    y = newY;
  }
  
  void move(){ // movement of fish 
    if (!Hooked){
      
      if (type.contains("Special") && Math.random() < 0.05) { // speedier special fish
        x += 10*dx;
      }
      if (type.contains("Special") && Math.random() < 0.00005) { // special fish can become normal
        type = type.substring(8);
        c = color(red(c),green(c),blue(c));
        value -= 50;
      }
      
      
      x += dx;
      y += dy;
      
      // changes x direction
      if (Math.random() <= 0.005) {
        dx *= -1;
      }
      if (x >= width - radius){
        dx *= -1;
        x = width-radius;        
      }
      if (x <= radius) {
        dx *= -1;
        x = radius;
      }
      
      // changes y direction
      if (Math.random() <= 0.05) {
        dy *= -1;
      }
      if (y > bottomLimit) {
        dy *= -1;
        y = bottomLimit-1;
      }
      if (y < topLimit) {
        dy *= -1;
        y = topLimit+1;
      }
    }
  }
  void drawFish(){
    noStroke();
    fill(c);
    ellipse(x,y,radius,radius);
  }

}
