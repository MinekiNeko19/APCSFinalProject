class Shop {
  
}

class ShopItem {
  private String name;
  private int price;
  private float product;
  private boolean purchased;
  private int maxUpgrade;
  
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
