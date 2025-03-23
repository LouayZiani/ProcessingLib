// the variables:  
float brushSize = 5; 
color currentColor;
boolean eraserMode = false;  // so i can move between drawing and erasing

void setup() {
  size(800, 600); 
  background(255);   
  currentColor = color(0);  
  
  // Draw UI buttons
  drawUI();
}

void draw() {
  if (mousePressed && mouseY > 50) {  // draw below UI area --> only when mouse is pressed
    strokeWeight(brushSize);
    if (eraserMode) {
      stroke(255);  // eraser basically is drawing with white color
    } else {
      stroke(currentColor);
    }
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}

void mousePressed() {
  // here i am checking if UI buttons are clicked **top 50 pixels**
  if (mouseY <= 50) {
    if (mouseX < 50) {  
      currentColor = color(0);
      eraserMode = false;
    } else if (mouseX < 100) {
      currentColor = color(255, 0, 0);
      eraserMode = false;
    } else if (mouseX < 150) { 
      currentColor = color(0, 0, 255);
      eraserMode = false;
    } else if (mouseX < 200) {
      currentColor = color(0, 255, 0);
      eraserMode = false;
    } else if (mouseX < 250) {
      eraserMode = true; // erase
    } else if (mouseX < 300) {  
      background(255);
      drawUI();
    }
    else if (mouseX < 350) {    // small brush
      brushSize = 2;
    } else if (mouseX < 400) {  // sedium brush
      brushSize = 5;
    } else if (mouseX < 450) {  // large brush
      brushSize = 10;
    }
  }
}

void drawUI() {
  fill(220);
  noStroke();
  rect(0, 0, width, 50);
  
  stroke(0);
  fill(0);        // black
  rect(0, 0, 50, 50);
  fill(255, 0, 0); // red
  rect(50, 0, 50, 50);
  fill(0, 0, 255); // blue
  rect(100, 0, 50, 50);
  fill(0, 255, 0); // green
  rect(150, 0, 50, 50);
  
  // for the eraser button: 
  fill(255);
  rect(200, 0, 50, 50);
  fill(0);
  textAlign(CENTER, CENTER);
  text("E", 225, 25);
  
  // clear button:
  fill(200);
  rect(250, 0, 50, 50);
  fill(0);
  text("C", 275, 25);
  
  // brush size:
  fill(200);
  rect(300, 0, 50, 50);
  rect(350, 0, 50, 50);
  rect(400, 0, 50, 50);
  fill(0);
  text("S", 325, 25); // s for small
  text("M", 375, 25); // m for medium
  text("L", 425, 25); // l for large
}

void keyPressed() {
  if (key == 'e' || key == 'E') {
    eraserMode = !eraserMode;  // i need to click e for eraser
  }
  if (key == 'c' || key == 'C') {
    background(255);  // clear the whole page --> fill background with white color
    drawUI();
  }
}
