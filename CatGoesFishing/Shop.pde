class Shop{
  private ArrayList<ShopItem> list;
  boolean visible;
  
 Shop() {
    list = new ArrayList<ShopItem>();
    list.add(new ShopItem("Top Hat",1));
    list.add(new ShopItem("Straw Hat",100));
    list.add(new ShopItem("Bowtie",100));
    visible = true;
  }
  
  String openShop() {
    String item = "";
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
       
        item = temp.name;
      }
      if (temp.purchased) {
        fill(255,0,0);
        item = "";
       if (temp.equipped){
       }
      }
      else fill(0);
      text(temp.name+ " Price: " + temp.price,720,space+(i*20));
      
      temp.drawHat();
    }
    
    return item;
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
    if (purchased && equipped){
        fill(255);
        rect((x-w/2+w/2),y-20, 5*w/3,20);
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
  
}
