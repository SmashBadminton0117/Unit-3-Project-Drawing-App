// March 6th, 2025
// Lawrence Mo
// Title: Drawing APP
// Block 2-4

//color integers
color backgroundblue  = #70B3ED;
color lightblue       = #82B3F3;
color mediumblue      = #5A8AD8;
color darkblue        = #2C6CB5;
color darkestblue     = #305896;
color black           = #000000;
color greyblue        = #7A9FED;

//button shadow
color buttonSelection = #5F5C5C;

//slider
float sliderX;
float selectedWeight;

//button selected color
color selectedColor;

//stamp icon
PImage pikachu;
boolean pikachuOn; //true or false

//stampTool Size
float stampSize = 100;
boolean shouldDraw = true;

void setup() {
  //paper size
  size(1400, 800);
  background(255);

  //stamp icon (true or false)
  pikachu = loadImage("pikachu.png");
  pikachuOn = false;

  //slider
  sliderX = 745;

  //current tool indication
  selectedWeight = 3.5;

  //current color indication
  selectedColor = black;
} //Setup ends here: ==============================================================================


void draw() {

  //Toolbox structure
  fill(backgroundblue);
  noStroke();
  rect(0, 650, 1400, 150); //x, y, w, h

  //Indication line
  stroke(0);
  strokeWeight(3);
  line(0, 650, 1400, 650);

  //Design of the toolbox
  noStroke();
  fill(lerpColor(mediumblue, color(0, 0, 0, 0), 0.9));
  stroke(255, 100);
  circle(200, 700, 61);
  circle(270, 700, 61);
  circle(340, 700, 61);
  circle(200, 760, 61);
  circle(270, 760, 61);
  circle(340, 760, 61);

  //
  fill(lerpColor(darkblue, color(0, 0, 0, 0), 0.9));
  stroke(255, 100);
  rect(430, 680, 140, 110);

  fill(lerpColor(darkblue, color(0, 0, 0, 0), 0.9));
  stroke(255, 100);
  rect(580, 675, 330, 100);

  //Color Button Section: ===================================================================================

  //Color #1: white
  tactile(200, 700, 23);
  fill(greyblue);
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

  //rect indicator
  fill(255);
  stroke(0);
  strokeWeight(2);
  rect(450, 700, 100, 70);

  //line indicator
  fill(selectedColor);
  stroke(selectedColor);
  strokeWeight(selectedWeight);
  line(455, 735, 545, 735);

  //Hover effect
  sliderHover();
  strokeWeight(3);
  line(590, 725, 900, 725); //x1, y1, x2, y2
  fill(0);
  circle(sliderX, 725, 30);


  pikachuOnOff();

  //stamp tool
  tactile(950, 670, 120, 120);
  stroke(3);
  rect(950, 670, 120, 120);
  //stamp tool image placements
  image(pikachu, 955, 675, 110, 110);

  //Buttons
  fill(255);
  strokeWeight(2);

  //button #1
  tactile(1150, 670, 100, 30);
  rect(1150, 670, 100, 30);

  //button #2
  tactile(1150, 710, 100, 30);
  rect(1150, 710, 100, 30);

  //button #3
  tactile(1150, 750, 100, 30);
  rect(1150, 750, 100, 30);

  fill(0);
  textSize(18);
  textAlign(CENTER, CENTER);
  text("New", 1200, 685);
  text("Save", 1200, 725);
  text("Load", 1200, 765);
} //Draw ends here: ====================================================================================================


void sliderHover() {
  if (dist(sliderX, 725, mouseX, mouseY) < 19) {
    stroke(#FFFFFF);
  } else {
    stroke(buttonSelection);
  }
} //End of sliderHover here: =================================================================================================



void mouseReleased() {
  //pikachu button
  if (mouseX > 950 && mouseX < 1070 && mouseY > 670 && mouseY < 790) {
    pikachuOn = !pikachuOn;
  }

  //The position of the buttons
  //rect(1150, 670, 100, 30);
  //rect(1150, 710, 100, 30);
  //rect(1150, 750, 100, 30);

  //pos == x, x + w, y, y + h

  //"NEW BUTTON"
  if (mouseX > 1150 && mouseX < 1250 && mouseY > 670 && mouseY < 700) {
    fill(255);
    noStroke();
    rect(0, 0, 1400, 648);
  }

  //"SAVE BUTTON"
  if (mouseX > 1150 && mouseX < 1250 && mouseY > 710 && mouseY < 740) {
    selectOutput("Choose a name for your image file", "saveImage");
  }

  //"LOAD BUTTON"
  if (mouseX > 1150 && mouseX < 1250 && mouseY > 750 && mouseY < 780) {
    shouldDraw = false;
    selectInput("Pick an image to load", "openImage");
  }



  //Slider
  controlSlider();

  //Button: White
  if (dist(200, 700, mouseX, mouseY) < 23) {
    selectedColor = greyblue;
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


void saveImage(File f) {
  if (f != null) {
    PImage canvas = get(1, 1, width, 648);
    canvas.save(f.getAbsolutePath()+".png");
  }
}


void openImage(File f) {
  if (f != null) {
    shouldDraw = false;
    int n = 0;
    while (n < 20) {
      PImage pic = loadImage(f.getPath());
      image(pic, 0, 0);
      n = n + 1;
    }
  }
  shouldDraw = true;
}


void tactile (int x, int y, int r) {
  if (dist(x, y, mouseX, mouseY) < r) {
    stroke(#FFFFFF);
  } else {
    stroke(buttonSelection);
  }
} //End of Tactile (int x, int y, int r) here: ===================================================================================


void tactile (int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    fill(darkestblue);
  } else {
    fill(255);
  }
  rect(x, y, w, h);
} //End of tactile (int x, int y, int w, int h) here: ============================================================================


void mouseDragged() {
  if (shouldDraw) {
    if (mouseY < 650 && mouseY > 0) {
      if (pikachuOn == false) {
        stroke(selectedColor);
        strokeWeight(selectedWeight);
        line(pmouseX, pmouseY, mouseX, mouseY);
      } else {
        image(pikachu, mouseX - stampSize/2, mouseY - stampSize/2, stampSize, stampSize);
      }
    }
  }
  // Slider
  controlSlider();
} //End of mouseDragged here: =======================================================================================================

void pikachuOnOff() {
  if (pikachuOn) {
    stroke(0);
    strokeWeight(5);
  } else {
    stroke(0);
    strokeWeight(2);
  }
} //End of PikachuOnOff here: =========================================================================================================


void controlSlider() {
  //Slider
  if (mouseX > 590 && mouseX < 900 && mouseY > 700 && mouseY < 750) {
    sliderX = mouseX;
  }
  selectedWeight = map(sliderX, 590, 900, 1, 7);
  stampSize = map(sliderX, 590, 900, 50, 200);
} //End of controlSlider: =============================================================================================================
