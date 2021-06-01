class Fish{
  private int Size, x, y, dx, dy,radius;
  private color c;
  private Boolean Hooked;
  private double value;
  private String type;
  
  
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
      y = (int)(Math.random()*250+300);
    }
    if (Size==2){
      type= "medium";
      value= 10;
      radius=40;
      c = color(0,255,0);
      y = (int)(Math.random()*250+500);
    }
    if (Size==3){
      type= "large";
      value=15;
      radius=80;
      c = color(255,0,0);
      y = (int)(Math.random()*250+700);
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
    if (r.bait()>Size || r.bait()<Size-1){
      return false;
    }
    else{
      return true;
    }
  }
  
  void moveTo(int newX, int newY) {
    x = newX;
    y = newY;
  }
  
  void move(){ // movement of fish 
    if (!Hooked){
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
      if (y > height - radius) {
        dy *= -1;
        y = height-radius;
      }
      if (y < 250+radius) {
        dy *= -1;
        y = 250+radius;
      }
    }
  }
  void drawFish(){
    noStroke();
    fill(c);
    ellipse(x,y,radius,radius);
  }

}
