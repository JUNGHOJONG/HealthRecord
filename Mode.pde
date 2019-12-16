class Mode {

  PFont myFont;
  PImage myImage;
  PImage Id;
  PImage Password;
  PImage running;

  Mode() {

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
    //textFont(myFont, 18);
    textFont(myFont, 60);
    text("REGURAL MODE", width/2, height/2.4); 

    fill(0, 200);
    stroke(219, 123, 44);
    rect(width/2, height/1.69, width/2.8, height/8);//
    fill(219, 123, 44);
    //textFont(myFont, 18);
    textFont(myFont, 60);
    text("RANK MODE", width/2, height/1.69); 
    
    fill(0, 200);
    stroke(205, 50, 214);
    rect(width/2, height/1.3, width/2.8, height/8);//
    fill(205, 50, 214);
    textFont(myFont, 18);
    textFont(myFont, 60);
    text("Guide Video", width/2, height/1.3);
 
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

    choiceMode();
  }
  void choiceMode() {
    if (skeletonDepth.handclose && !skeletonDepth.handopen) { 

      float xpos = skeletonDepth.xpos;
      float ypos = skeletonDepth.ypos;
      float xpos1 = map(xpos, 0, 514, width/3.42, width/1.41);//600
      float ypos1 = map(ypos, 0, 424, height/11.02, height/1.12);

      if ((xpos1<width/1.47 && xpos1>width/3.1) && (ypos1>height/2.83 && ypos1<height/2.11)) {//login range)
        scene_number=2;
        ranknumber=0;
      } else if ((xpos1<width/1.47 && xpos1>width/3.1) && (ypos1>height/1.9 && ypos1<height/1.54)) {
        scene_number=2;
        ranknumber=1;
      } else if ((xpos1<width/1.47 && xpos1>width/3.1) && (ypos1>height/1.43 && ypos1<height/1.21)) {
        scene_number=3;
      } else if ((xpos1>width/2.15 && xpos1<width/1.89) && (ypos1>height/7.34 && ypos1<height/4.03) ) {
        qrtime=millis();
        qrcheck=true;
        sndQr.append("totalexerTime_" + totalexerTime );
        qr.SendQr();
      }
      skeletonDepth.handclose=false;
    }
  }
}
