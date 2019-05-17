import java.util.Calendar; //For timestamps

int tileCount = 20; //Tiles per side
int actStrokeCap = ROUND;
int actRandomSeed = 0;

void setup() {
  size(1280, 1280);
}

void draw() {
  background(255);
  strokeCap(actStrokeCap);
  randomSeed(actRandomSeed);
  
  for (int gridY=0; gridY<tileCount; gridY++) {
    for (int gridX=0; gridX<tileCount; gridX++) {
      
      int posX = width/tileCount*gridX;
      int posY = height/tileCount*gridY;
      
      int toggle = (int) random(0,2); //random 0 or 1
      
      if (toggle == 0) {
        strokeWeight(mouseX/20); //Set the width of the stroke according to mouse's X coordinate
        line(posX, posY, posX+width/tileCount, posY+height/tileCount); //top-left -> bottom-right
      }
      
      if (toggle == 1) {
        strokeWeight(mouseY/20); //Set the width of the stroke according to mouse's Y coordinate
        line(posX, posY+width/tileCount, posX+height/tileCount, posY); //top-right -> bottom-left
      }
      
    }
  }
}

//The mousePressed() function is called once after every time a mouse button is pressed. 
void mousePressed() {
  actRandomSeed = (int) random(100000); //Re-generate
}

//The keyReleased() function is called once every time a key is released.
void keyReleased(){
  if (key == '1') {
    actStrokeCap = ROUND; //1 for rounded line endings
  }
  if (key == '2') {
    actStrokeCap = SQUARE; //2 for squared line endings
  }
  if (key == '3') {
    actStrokeCap = PROJECT; //3 for extended line endings
  }
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png"); //S for saving images
}

//Timestamp -> String
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now); //YMD_HMS. 1$ means the 1st parameter (now).
}
