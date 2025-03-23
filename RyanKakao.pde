void setup() {
  size(400, 400); // this is for window size
  background(255); // white

  // I set a color for Ryan using a soft, yellowish (more golden) color
  color ColorRyan = color(240, 168, 28); 

  fill(ColorRyan);
  // ear code: I started with the ear code so it won't overlap with the stroke
  // when drawing the head, so I made them half circle blending into the head
  stroke(0); 
  strokeWeight(6);
  ellipse(130, 130, 70, 70);
  ellipse(270, 130, 70, 70);
  ellipseMode(CENTER);
  
  // head code: head is basically an ellipse
  stroke(0);
  strokeWeight(6);
  fill(ColorRyan);
  ellipse(200, 210, 220, 200);



  //  eyebrows code: just drew two thick lines with a stroke size of 7
  strokeWeight(7);
  line(140, 176, 175, 176);
  line(225, 176, 260, 176);

  // eyes: THICKER points
  strokeWeight(15);
  point(160, 197);
  point(240, 197);

  // Nose code: I drew a triangle with first coordinate under the other two to make
  // it look like a triangle pointing downwards
  fill(0); // black color
  noStroke();
  triangle(200, 230, 192, 215, 207, 215);
  
  // mouth code
  fill(255);
  stroke(0);
  strokeWeight(6);
  // I used rectangle (rect()) to draw the mouth as it is the only possible usage of 
  // rect I could find in the picture
  rect(176, 230, 50, 25, 48);
  
  // I couldn't figure out how to draw the mouth using rect function whilst making it
  // look like the authentic picture ;(

}
