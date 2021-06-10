class Shop {
  private ArrayList<ShopItem> list;
  boolean visible;
  
  Shop() {
    list = new ArrayList<ShopItem>();
    list.add(new ShopItem("Black Boat",100,color(0),0));
    list.add(new ShopItem("Faster Boat Speed!",100,color(0),5));
    list.add(new ShopItem("Faster Rod Speed!",100,color(0),5));
    visible = false;
  }
  
  void openShop() {
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
      String t = temp.name+ " Price: " + temp.price;
      if (mouseX > 720 && mouseX < 790 &&
        mouseY > space+(i*20)-15 && mouseY < space+(i*20)) {
        fill(0,0,255);
        t += " Not Purchased";
      }
      else if (temp.purchased) fill(255,0,0);
      else fill(0);
      text(t,720,space+(i*20));
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
  float product;
  boolean purchased;
  int maxUpgrade;
  
  ShopItem(String n, int cost, int value, int max) {
    purchased = false;
    name = n;
    price = cost;
    product = value;
    maxUpgrade = max;
  }

  void upgradeProduct(int cost, int value) {
    if (maxUpgrade > 0) {
       price = cost;
       product = value;
       purchased = false;
       maxUpgrade--;
    }
  }  
  
  //void upgradeProduct() { // default upgrade for speed?
  //  int tempCost = price+25;
  //  int tempValue = value;
  //  upgradeProduct(tempCost,tempValue);
  //}
}
