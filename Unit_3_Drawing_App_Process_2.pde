// March 6th, 2025
// Lawrence Mo
// Title: Drawing APP
// Block 2-4

color backgroundblue  = #70B3ED;
color lightblue       = #82B3F3;
color mediumblue      = #5A8AD8;
color darkblue        = #2C6CB5;
color darkestblue     = #305896;
color black           = #000000;
color white           = #FFFFFF;

color buttonSelection = #5F5C5C;

float sliderX;

color selectedColor;

void setup() {
  size(1400, 800);
  sliderX = 745;
  selectedColor = black;
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
  
  
//Color Button Section: ===================================================================================
  
  //Color #1: white
  tactile(200, 700, 23);
  fill(white);
  circle(200, 700, 45);
  
  //Color #2: lightblue
  tactile(270, 700, 23);
  fill(lightblue);
  circle(270, 700, 45);
  
  //Color #3: mediumblue
  tactile(340, 700, 23);
  fill(mediumblue);
  circle(340, 700, 45);
  
  //Color #4: black
  tactile(200, 760, 23);
  fill(black);
  circle(200, 760, 45);
  
  //Color #5: dark blue
  tactile(270, 760, 23);
  fill(darkblue);
  circle(270, 760, 45);
  
  //Color #6: darkest blue
  tactile(340, 760, 23);
  fill(darkestblue);
  circle(340, 760, 45);
  
//Color Button Section Ends here: =================================================================================
  
  
  
  //indicator
  fill(selectedColor);
  stroke(#5F5C5C);
  rect(450, 700, 100, 70);
  
  //slider
  strokeWeight(2);
  line(590, 725, 900, 725); //x1, y1, x2, y2
  circle(sliderX, 725, 30);
  
  //stamp tool
  square(950, 670, 120);
  
  //Buttons
  rect(1150, 670, 100, 30);
  rect(1150, 710, 100, 30);
  rect(1150, 750, 100, 30);
  
}



void mouseReleased() {
  //Button: White
  if (dist(200, 700, mouseX, mouseY) < 23) {
    selectedColor = white;
  }
  
  //Button: lightblue
  if (dist(270, 700, mouseX, mouseY) < 23) {
    selectedColor = lightblue;
  }
  
  //Button: mediumblue
  if (dist(340, 700, mouseX, mouseY) < 23) {
    selectedColor = mediumblue;
  }
  
  //Button: black
  if (dist(200, 760, mouseX, mouseY) < 23) {
    selectedColor = black;
  }
  
  //Button: darkblue
  if (dist(270, 760, mouseX, mouseY) < 23) {
    selectedColor = darkblue;
  }
  
  
  //Button: darkestblue
  if (dist(340, 760, mouseX, mouseY) < 23) {
    selectedColor = darkestblue;
  }
  
  
  

  
  
} //End of mouseRelease here: ===================================================================================================

void tactile (int x, int y, int r) {
    if (dist(x, y, mouseX, mouseY) < r) {
    stroke(white);
  } else {
    stroke(buttonSelection);
  }
  
} //End of Tactile here: ============================================================================================================


void mouseDragged() {
  
  
} //End of mouseDragged here: ===================================================================================================



void drawColors() {
  
}
