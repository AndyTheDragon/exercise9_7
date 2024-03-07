Snake s = new Snake();
void setup() {
  size(640, 600);
  smooth();
}
void draw() {
  background(255);
  noStroke();
  s.update(mouseX, mouseY);
  s.display();
}
class Snake {
  int[] xpos = new int[50];
  int[] ypos = new int[50];
  Point[] pos = new Point[50];

  Snake() {
    for (int i=0; i<pos.length; i++) {
      xpos[i] = 0;
      ypos[i] = 0;
      pos[i] = new Point(0, 0);
    }
  }

  void update(int mx, int my) {
    // Flyt alle xy-positioner een plads ned mod starten af vores array
    for (int i=0; i<pos.length-1; i++) {
      xpos[i] = xpos[i+1];
      ypos[i] = ypos[i+1];
      //pos[i] = pos[i+1];
      pos[i].setXY( pos[i+1].getX(), pos[i+1].getY() );
    }
    
    // Gem musens position i den sidste plads i vores array
    xpos[xpos.length-1] = mx;
    ypos[ypos.length-1] = my;
    pos[pos.length-1].setXY(mx, my);
  }

  void display() {
    for (int i=0; i<pos.length; i++) {
      fill(255-i*5);
      //ellipse(xpos[i], ypos[i], i, i);
      ellipse(pos[i].getX(), pos[i].getY(), i, i);
    }
  }
}
class Point {
  int x;
  int y;

  Point(int x, int y) {
    this.x = x;
    this.y = y;
  }
  void setXY(int x, int y) {
    this.x = x;
    this.y = y;
  }
  int getX() {
    return this.x;
  }
  int getY() {
    return this.y;
  }
  String toString() {
    return "(" + x + ", " + y + ")";
  }
}
