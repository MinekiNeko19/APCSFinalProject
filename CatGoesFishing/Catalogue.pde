class Catalogue {
  int[] caught;
  boolean visible;
  
  Catalogue() {
    int[] caught = new int[3];
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
    stroke(100,75,50);
    fill(200,125,75);
    rect(10,10,width-20,200);
  }
}
