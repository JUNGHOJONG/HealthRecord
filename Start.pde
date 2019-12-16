class Start {
  PFont myFont;
  PImage myImage;
  PImage running;

  Start() {

    myFont= loadFont("CalistoMT-48.vlw");
    myImage= loadImage("login1.JPG");
    running= loadImage("running1.jpg");
  }
  void display() {

    textAlign(CENTER, CENTER);
    textLeading(40);
    textFont(myFont, 28);
    /////////////////////////////////////////////////////////////////////////////////////////////////////////background

    rectMode(CORNER);

    tint(150, 200);
    image(running, 0, 0, width, height);

    image(myImage, 0, 0, width, height); 

    rectMode(CENTER);
    fill(0, 200);
    stroke(220, 180);
    strokeWeight(5);
    rect(width/2, height/2.4, width/2.8, height/8);//
    fill(240);
    textFont(myFont, 60);
    text("START", width/2, height/2.4); 

    choiceStart();
  }


  void choiceStart() {

    if (skeletonDepth.handclose && !skeletonDepth.handopen) { 

      float xpos = skeletonDepth.xpos;
      float ypos = skeletonDepth.ypos;
      float xpos1 = map(xpos, 0, 514, width/3.42, width/1.41);
      float ypos1 = map(ypos, 0, 424, height/11.02, height/1.12);

      if ((xpos1<width/1.47 && xpos1>width/3.1) && (ypos1>height/2.83 && ypos1<height/2.11)) {//Start range)
        scene_number=1;
        startTime=millis();
      }    
      skeletonDepth.handclose=false;
    }
  }
}
