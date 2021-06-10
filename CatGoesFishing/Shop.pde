class Shop {
  private ArrayList<ShopItem> list;
  boolean visible;
  
  Shop() {
    list = new ArrayList<ShopItem>();
    list.add(new ShopItem("Random Color Boat",100,0));
    list.add(new ShopItem("Faster Boat Speed!",100,5));
    list.add(new ShopItem("Faster Rod Speed!",100,5));
    visible = false;
  }
  
  ShopItem openShop() {
    ShopItem item = null;
    noStroke();
    fill(200,200,200);
    rect(710,10,width-720,155);
    fill(0);
    textSize(20);
    text("Shop",720,30);
    textSize(15);
    int space = 50;
    for (int i = 0; i < list.size(); i++) {
      ShopItem temp = list.get(i);
      if (!temp.purchased && mouseX > 720 && mouseX < 1040 &&
        mouseY > space+(i*20)-15 && mouseY < space+(i*20)) {
        fill(0,0,255);
        text(" Not Purchased",950,space+(i*20));
        item = temp;
      }
      if (temp.purchased) {
        fill(255,0,0);
      }
      else fill(0);
      text(temp.name+ " Price: " + temp.price,720,space+(i*20));
    }
    return item;
  }
  
  boolean visible() {
    return visible;
  }
  
  void toggle() {
    visible = !visible;
  }
}

class ShopItem {
  String name;
  int price;
  boolean purchased;
  int maxUpgrade;
  
  ShopItem(String n, int cost, int max) {
    purchased = false;
    name = n;
    price = cost;
    maxUpgrade = max;
  }
  
  void buy() {
    if (maxUpgrade > 0) {
      maxUpgrade--;
      price += 20;
      name += " I";
    }
    else purchased = true;
  }
}
