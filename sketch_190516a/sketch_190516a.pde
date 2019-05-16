import java.util.Calendar;

int tileCount = 60;
int actStrokeCap = ROUND;
int actRandomSeed = 0;

void setup() {
  size(1920, 1920);
}

void draw() {
  background(255);
  strokeCap(actStrokeCap);
  randomSeed(actRandomSeed);
  
  for (int gridY=0; gridY<tileCount; gridY++) {
    for (int gridX=0; gridX<tileCount; gridX++) {
      
      int posX = width/tileCount*gridX;
      int posY = height/tileCount*gridY;
      
      int toggle = (int) random(0,2);
      
      if (toggle == 0) {
        strokeWeight(mouseX/20);
        line(posX, posY, posX+width/tileCount, posY+height/tileCount);
      }
      if (toggle == 1) {
        strokeWeight(mouseY/20);
        line(posX, posY+width/tileCount, posX+height/tileCount, posY);
      }
    }
  }
}

void mousePressed() {
  actRandomSeed = (int) random(100000);
}

void keyReleased(){
  if (key == '1') {
    actStrokeCap = ROUND;
  }
  if (key == '2') {
    actStrokeCap = SQUARE;
  }
  if (key == '3') {
    actStrokeCap = PROJECT;
  }
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
}

String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
