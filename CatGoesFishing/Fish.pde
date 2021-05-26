class Fish{
  float Size, x, y, dx, dy;
  Boolean Hooked;
  double value;
  String type;
  
  Fish(int Size, float x, float y,float dx, float dy){
    this.Size=Size;
    Hooked=false;
    this.x=x;
    this.y=y;
    this.dx=(int)(dx*100)/100.0;
    this.dy=(int)(dx*100)/100.0;
    if(Size==0){
      type= "small";
      value=5;

    }
    if (Size==1){
      type= "medium";
      value= 10;
     
    }
    if (Size==2){
      type= "large";
      value=15;
    }
  }
  double GetValue(){
    return value;
  }

}
