// March 6th, 2025
// Lawrence Mo
// Title: Drawing APP
// Block 2-4

color backgroundblue = #70B3ED;
color lightblue      = #82B3F3;
color mediumblue     = #5A8AD8;
color darkblue       = #2C6CB5;
color darkestblue    = #305896;


void setup() {
  size(1400, 800);
}



void draw() {
  background(255);
  
  //Toolbox structure
  fill(backgroundblue);
  noStroke();
  rect(0, 650, 1400, 150); //x, y, w, h
  
  //Indication line
  stroke(0);
  strokeWeight(3);
  line(0, 650, 1400, 650);
  
  circle(200, 700, 45);
  circle(270, 700, 45);
  circle(340, 700, 45);
  circle(200, 760, 45);
  circle(270, 760, 45);
  circle(340, 760, 45);
  
  
  
  
}


void drawColors() {
  circle(10, 10, 10);
}
