float diameter = 50;    
float maxSize = 300;   
float minSize = 10;
float speed = 1;       
boolean growing = true; 

void setup() {
  size(400, 400);      
  background(255);     
}

void draw() {
  background(255);      
  
  // finding the center position:
  float x = width/2;
  float y = height/2;
  
  fill(255, 192, 203);  // I chose a pink color for the ball
  noStroke();
  ellipse(x, y, diameter, diameter);
  
  if (growing) {
    diameter += speed;
    if (diameter >= maxSize) {
      growing = false;  
    }
  } else {
    diameter -= speed;
    if (diameter <= minSize) {
      growing = true;  
    }
  }
}
