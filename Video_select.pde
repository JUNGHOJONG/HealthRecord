class Video_select {

  PFont myFont;
  PImage myImage;
  PImage Id;
  PImage Password;
  PImage running;

  Video_select() {

    myFont= loadFont("SegoeUISymbol-60.vlw");
    myImage= loadImage("login1.JPG");
    Id= loadImage("id.png");
    Password= loadImage("password.png");
    running= loadImage("running1.jpg");
  }
  void display() {

    textAlign(CENTER, CENTER);

    /////////////////////////////////////////////////////////////////////////////////////////////////////////background

    rectMode(CORNER);

    tint(150, 200);
    image(running, 0, 0, width, height);

    image(myImage, 0, 0, width, height); 


    rectMode(CENTER);
    fill(0, 200);
    stroke(45, 167, 196);
    rect(width/2, height/2.4, width/2.8, height/8);//
    fill(45, 167, 196);
    textFont(myFont, 60);
    text("DUMBBELL", width/2, height/2.4); 

    fill(0, 200);
    stroke(219, 123, 44);
    rect(width/2, height/1.69, width/2.8, height/8);//
    fill(219, 123, 44);
    textFont(myFont, 60);
    text("SQUAT", width/2, height/1.69); 

    fill(0, 200);
    stroke(205, 50, 214);
    rect(width/2, height/1.3, width/2.8, height/8);//
    fill(205, 50, 214);
    textFont(myFont, 18);
    textFont(myFont, 60);
    text("SLL", width/2, height/1.3);

    fill(0);
    stroke(225);
    strokeWeight(3.5);
    ellipse(width/2, height/5, 120, 120);
    fill(225);
    textFont(letterFont, 35);
    textSize(35);///////////////////////////ratio fix!!!!
    text("STOP", width/2, height/5.1);

    noStroke();
    fill(255, 120);

    noFill();
    strokeWeight(2);
    stroke(225, 200);

    ellipse(width/2.35, height/4.8, height/12, height/12);////////////////////////////

    pushMatrix();
    translate(width/2.35, height/4.8);
    rotate(PI/2);
    line(0, +height/60, -height/60, -height/60);
    line(0, +height/60, height/60, -height/60);
    popMatrix();

    choiceExer();
  }

  void choiceExer() {
    if (skeletonDepth.handclose && !skeletonDepth.handopen) { 
      float xpos = skeletonDepth.xpos;
      float ypos = skeletonDepth.ypos;
      float xpos1 = map(xpos, 0, 514, width/3.42, width/1.41);
      float ypos1 = map(ypos, 0, 424, height/11.02, height/1.12);

      if ((xpos1<width/1.47 && xpos1>width/3.1) && (ypos1>height/2.83 && ypos1<height/2.11)) { // DUMBBELL
        dbCheck = true;
        dbTime = millis();
        qrDb.SendQr();
      } else if ((xpos1<width/1.47 && xpos1>width/3.1) && (ypos1>height/1.9 && ypos1<height/1.54)) { // SQUAT
        sqtCheck = true;
        sqtTime = millis();
        qrSqt.SendQr();
      } else if ((xpos1<width/1.47 && xpos1>width/3.1) && (ypos1>height/1.43 && ypos1<height/1.21)) { // SLL
        sllCheck = true;
        sllTime = millis();
        qrSll.SendQr();
      } else if ((xpos1<width/2.24 && xpos1>width/2.49) && (ypos1>height/6.07 && ypos1<height/4.15) ) { // back
        scene_number = 1;
        kindofexer=0;
      } else if ((xpos1>width/2.15 && xpos1<width/1.89) && (ypos1>height/7.34 && ypos1<height/4.03) ) { // home
        qrtime=millis();
        qrcheck=true;
        sndQr.append("totalexerTime_" + totalexerTime );
        qr.SendQr();
      }
    }
  }
}
