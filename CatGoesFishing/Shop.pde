class Shop{
  private ArrayList<ShopItem> list;
  boolean visible;
  
 Shop() {
    list = new ArrayList<ShopItem>();
    list.add(new ShopItem("Top Hat",1));
    list.add(new ShopItem("Straw Hat",1));
    list.add(new ShopItem("Bow",1));
    visible = true;
  }
  
  void openShop() {
    
    noStroke();
    fill(200,200,200);
    rect(710,10,width-720,155);
    fill(0);
    textSize(20);
    text("Buy Hats!",720,30);
    textSize(15);
    int space = 50;
    for (int i = 0; i < list.size(); i++) {
      ShopItem temp = list.get(i);
      if (mouseX > 720 && mouseX < 1040 &&
        mouseY > space+(i*20)-15 && mouseY < space+(i*20)) {
        fill(0,0,255);
        if(temp.purchased){
           text(" Purchased",950,space+(i*20));
        }
        else{
           text(" Not Purchased",950,space+(i*20));
        }
       
       
      }
      if (temp.purchased) {
        fill(255,0,0);
        
       if (temp.equipped){
         fill(0,255,0);
         
       }
      }
      else fill(0);
      text(temp.name+ " Price: " + temp.price,720,space+(i*20));
      
      temp.drawHat();
    }
    
  }
  
  void mousePressed() {
   //Right click:Buy.
   //Left click: Equip. 
  
   if(mouseButton == RIGHT){
     Buy();
   }
   if(mouseButton ==LEFT){
     Equip();
   }
 }
 void Buy(){
  for (int i = 0; i < list.size(); i++) {
      ShopItem temp = list.get(i);
      
      if (!temp.purchased && mouseX > 720 && mouseX < 1040 &&
          mouseY > 50+(i*20)-15 && mouseY < 50+(i*20)) {
            if(player.points()>=temp.price()){
              temp.bought();
              player.changepoints(-temp.price());
            }
            
        println(mouseX);
      }
  }
 }
 void Equip(){
   for (int i = 0; i < list.size(); i++) {
      ShopItem temp = list.get(i);
      if (!temp.equipped && mouseX > 720 && mouseX < 1040 &&
          mouseY > 50+(i*20)-15 && mouseY < 50+(i*20)) {
            for (int j = 0; j < list.size(); j++) {
              ShopItem t= list.get(j);
                t.unequip();
            }
        temp.puton();
        println(mouseX);
      }
  }
 }
  boolean visible() {
    return visible;
  }
  
  void toggle() {
    visible = !visible;
  }
}

private class ShopItem {
  String name;
  int price;
  boolean purchased;
  boolean equipped;

  int x,y,w,h;
  
  
  ShopItem(String n, int cost) {
    purchased = false;
    name = n;
    price = cost;
    equipped= false;
    x=player.getX();
    y=player.getY();
    h=player.getHeight();
    w=player.getWidth();
    
  }
  void drawHat(){
    noStroke();
    int startX=(x-w/2)+w/3;
    int startY=y-h;
    if (purchased && equipped){
      if(name.equals("Top Hat")){
        fill(0);
        rect(startX,startY-30,w/3,30);
        fill(255,0,0);
        rect(startX,startY-10,w/3,5);
      }
      if(name.equals("Straw Hat")){
        fill(228,214,0);
        rect(startX,startY-20,w/3,20);
        fill(255,0,0);
        rect(startX,startY-10,w/3,5);
      }
      if(name.equals("Bow")){
        fill(255,0,0);
        triangle(startX,startY-10,startX,startY,startX+w/6,startY);
        triangle(startX+w/3,startY-10,startX+w/3,startY,startX+w/3-w/6,startY);
      }
    }
    if (keyPressed) {
    if (keyCode == LEFT) {
      moveLeft(10);
    }
    if (keyCode == RIGHT) {
      moveRight(10);
    }
    
   }
  }
   
  void moveLeft(int step) {
    x = x-step;
    if (x< w/2) { 
      x = w/2;
    }
   
  }
  void moveRight(int step) {
      x = x+step;
      if (x>width-w/2) { 
        x = width-w/2;
      }
    
  }
  int price(){
    return price;
  }

  void bought(){
    purchased =true;
  }
  void puton(){
    equipped =true;
  }
  void unequip(){
    equipped =false;
  }
  
}
