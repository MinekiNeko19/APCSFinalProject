class Fish{
  float Size, x, y, dx, dy,radius;
  Boolean Hooked;
  double value;
  String type;
  
  Fish(int Size, float x, float y,float dx, float dy){//constructs a fish
    this.Size=Size;
    Hooked=false;
    this.x=x;
    this.y=y;
    this.dx=(int)(dx*100)/100.0;
    this.dy=(int)(dx*100)/100.0;
    if(Size==0){
      type= "small";
      value=5;
      radius=20;
    }
    if (Size==1){
      type= "medium";
      value= 10;
      radius=40;
    }
    if (Size==2){
      type= "large";
      value=15;
      radius=80;
    }
  }
  
  double GetValue(){//returns the value of the fish
    return value;
  }
  
  boolean hook(int bx, int by) {
    if (bx < x+radius && bx > x-radius && by < y+radius && by > y-radius) {
      Hooked = true;
      moveTo(bx,by);
    }
    return Hooked;
  }
  
  void moveTo(int newX, int newY) {
    x = newX;
    y = newY;
  }
  
  void move(){ // movement of fish 
    x += dx;
    //y += dy; for now no y so it moves horizantally
    if (x >= width - radius || x <= radius){
      dx *= -1;
    }
  }
  void drawFish(){
    noStroke();
    if(Size==0){
      fill(102,0,204);
      ellipse(x, y, 20, 20);
    }
    if (Size==1){
      fill(0,255,0);
      ellipse(x, y, 40, 40);
    }
    if (Size==2){
      fill(255,0,0);
      ellipse(x, y, 80, 80);
    }
  }

}
