class Catalogue {
  int[] caught;
  boolean visible;
  
  Catalogue() {
    caught = new int[3];
    visible = false;
  }
  
  void addStat(Fish f) {
    if (f.getSize() == 1) {
      caught[0] +=1;
    }
    if (f.getSize() == 2) {
      caught[1] +=1;
    }
    if (f.getSize() == 3) {
      caught[2] +=1;
    }
  }
  
  boolean visible() {
    return visible;
  }
  
  void toggle() {
    visible = !visible;
  }
  
  void displayStats() {
    noStroke();
    fill(200,125,75);
    rect(710,10,width-720,155);
    fill(0);
    textSize(20);
    text("Catalogue",720,30);
    textSize(15);
    text("Small: " + caught[0],720,45);
    text("Medium: " + caught[1],720,65);
    text("Large: " + caught[2],720,85);
  }
}
