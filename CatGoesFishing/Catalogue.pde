class Catalogue {
  private int[] caught;
  boolean visible;

  
  
  Catalogue() {
    caught = new int[6];
    visible = false;
  
 
  }
  
  void addStat(Fish f) {
    if (f.getSize() == 1) {
      caught[0] +=1;
      if (f.special()) caught[3]++;
    }
    if (f.getSize() == 2) {
      caught[1] +=1;
      if (f.special()) caught[4]++;
    }
    if (f.getSize() == 3) {
      caught[2] +=1;
      if (f.special()) caught[5]++;
    }
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
    text("Cat-a-logue",720,30);
    textSize(15);
    text("Small: " + caught[0],720,50);
    text("Medium: " + caught[1],720,70);
    text("Large: " + caught[2],720,90);
    text("Specials: " + caught[3],900,50);
    text("Specials: " + caught[4],900,70);
    text("Specials: " + caught[5],900,90);
    text("Total: " + (caught[0] + caught[1] + caught[2]),720,110);
    
  }
}
