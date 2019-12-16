import java.util.*;
import KinectPV2.KJoint;
import KinectPV2.*;
import com.cage.zxing4p3.*;

ZXING4P zxing4p;//////////qr

Start start;
Video_select video;
boolean dbCheck;
boolean sllCheck;
boolean sqtCheck;

Mode mode;
QRCodeGe qr;
QRCodeGe_db qrDb;
QRCodeGe_sll qrSll;
QRCodeGe_sqt qrSqt;

skeleton_depth skeletonDepth;
Exercise_select exer;
boolean Click;
boolean id_pass;
int scene_number;
boolean restTimecheck;
int kindofexer;
StringBuffer sndQr;
boolean qrcheck=false;
boolean wrong_login;//////////////////////////////////wrong login
boolean wrong_register;
String user;
String pass;
String dbHost;
String database;

int presentTime, totalTime, healthTime, exer_restTime, rank_exerTime, totalexerTime, startTime, qrtime, dbTime, sllTime, sqtTime;

int dumbleDegree;
int dumbleCount;
int dumbleSet;

int squatDegree;
int squatCount;
int squatSet;

int shoulderDegree;
int shoulderCount;
int shoulderSet;

//int lungeDegree;
//int lungeCount;

PFont clockFont;
PFont letterFont;
PFont recordFont;
PFont record2Font;

String table;

KinectPV2 kinect;

int ranknumber;

PImage  QRCode;
PImage  QRCode_db;
PImage  QRCode_sll;
PImage  QRCode_sqt;

PFont   font;

boolean generated = false;
boolean firstTime = true;

String  textToEncode = "";
boolean showCursor   = true;
int     lastTime     = 0;
String [] str = new String [3];//////////qr

void setup() {

  //size(displayWidth, displayHeight, P3D);
  fullScreen(P3D);
  start = new Start();
  video = new Video_select();
  mode = new Mode();
  qr= new QRCodeGe();
  qrDb = new QRCodeGe_db();
  qrSll = new QRCodeGe_sll();
  qrSqt = new QRCodeGe_sqt();

  dbCheck = false;
  sllCheck = false;
  sqtCheck = false;

  skeletonDepth= new skeleton_depth();
  exer = new Exercise_select();
  user = "smarthealth";
  pass = "smarthealth";
  dbHost = "smarthealth.cmyoepxrxtwp.us-east-2.rds.amazonaws.com";
  database = "smarthealth";
  restTimecheck = true;
  sndQr= new StringBuffer();

  kinect = new KinectPV2(this);
  kinect.enableDepthMaskImg(true); 
  kinect.enableSkeletonDepthMap(true);
  kinect.enableSkeleton3DMap(true);

  clockFont= createFont("ENOCRA", 72);
  letterFont = createFont("SegoeUISymbol-136.vlw", 136);
  recordFont = createFont("SegoeUISymbol-156.vlw", 156);
  record2Font = createFont("SegoeUISymbol-86.vlw", 86);
  scene_number = 0;
  kindofexer = 0;
  wrong_login = false;
  wrong_register = false;

  table = "mirror";

  kinect.init();

  Click= false;

  id_pass= true;

  dumbleDegree = 0;
  dumbleCount = 0;
  dumbleSet = 0;

  squatDegree = 0;
  squatCount = 0;
  squatSet = 0;

  shoulderDegree = 0;
  shoulderCount = 0;
  shoulderSet = 0;

  //lungeDegree= 0;
  //lungeCount= 0;
  rank_exerTime = 60;
  ranknumber = 0;

  // ZXING4P ENCODE/DECODER INSTANCE////////////qr
  zxing4p = new ZXING4P();

  // SHOW VERSION INFORMATION IN CONSOLE
  zxing4p.version();

  font = loadFont("ArialMT-18.vlw");
  textFont(font, 18);////////////////qr
}

void draw() {

  background(255);

  if (scene_number==0) {///////////////////////////////////////h///#1 scene(logIn)
    start.display();
    skeletonDepth.recog();
  } else if (scene_number==1) { //////////////////////////////////////////#2 scene(menu select)
    mode.display();
    skeletonDepth.recog();
  } else if (scene_number==2) {//////////////////////////////////////////#3 scene(exercise select)
    if (kindofexer!=0) {//////////////////////////////////////////#3-1 scene(exercise ing)

      tint(50, 220);
      image(mode.running, 0, 0, width, height);
      image(mode.myImage, 0, 0, width, height); 

      textSize(24);

      rectMode(CENTER);

      smooth();
      //stroke(50, 180, 214);
      stroke(0);
      strokeWeight(4);
      line(width/4-width/6, height/2, width/4+width/6, height/2);
      noStroke();
      fill(225);
      ellipse(width/4, height/2, width/3, width/3);
      noFill();
      stroke(0);
      strokeWeight(2);
      ellipse(width/4, height/2, width/3.1, width/3.1);
      fill(0); //******************************************************* set-----> change
      textFont(recordFont, 156);
      if ( kindofexer==1 ) {
        text(dumbleSet, width/4, height/2-height/5);//////////////////set
      } else if ( kindofexer==2 ) {
        text(squatSet, width/4, height/2-height/5);//////////////////set
      } else if ( kindofexer==3 ) {
        text(shoulderSet, width/4, height/2-height/5);//////////////////set
      } 
      textSize(72);
      text("set", width/4, height/2-height/15);//////////////////set


      fill(0); //********************************************************** count
      textFont(recordFont, 156);
      if ( kindofexer==1 ) {
        text(dumbleCount, width/4, height/2+height/10.5);//////////////////Count
      } else if ( kindofexer==2 ) {
        text(squatCount, width/4, height/2+height/10.5);//////////////////Count
      } else if ( kindofexer==3 ) {
        text(shoulderCount, width/4, height/2+height/10.5);//////////////////Count
      } 
      textSize(72);
      text("count", width/4, height/2+height/4.5);//////////////////Count

      smooth();
      stroke(0);
      strokeWeight(4);
      line((width/4)*3-width/6, height/2, (width/4)*3+width/6, height/2);
      noStroke();
      fill(225);
      ellipse((width/4)*3, height/2, width/3, width/3);
      noFill();
      stroke(0);
      strokeWeight(2);
      ellipse((width/4)*3, height/2, width/3.1, width/3.1);
      fill(0); //*************************************************************** sec
      textFont(recordFont, 156);
      if ( ranknumber == 0 ) {
        text(exer_restTime, (width/4)*3, height/2-height/5);////////////////// nomalMode_Time
      } else if ( ranknumber == 1 ) {
        if ( rank_exerTime >= 10 && rank_exerTime < 61 )
          fill(219, 123, 44);
        else 
        fill(225, 0, 0);
        text(rank_exerTime, (width/4)*3, height/2-height/5);//////////////////rankMode_Time
      }
      textSize(72);
      text("sec", (width/4)*3, height/2-height/15);//////////////////Time



      fill(0); //************************************************************** Angle
      textFont(recordFont, 156);
      textSize(156);
      if (kindofexer==1) { 
        text(dumbleDegree, (width/4)*3, height/2+height/10.5);//////////////////Angle
        textSize(72);
        text("radian", (width/4)*3, height/2+height/4.5);//////////////////Angle
      } else if (kindofexer==2) {
        text(squatDegree, (width/4)*3, height/2+height/10.5);//////////////////Angle
        textSize(72);
        text("radian", (width/4)*3, height/2+height/4.5);//////////////////Angle
      } else if (kindofexer==3) {
        text(shoulderDegree, (width/4)*3, height/2+height/10.5);//////////////////Angle
        textSize(72);
        text("radian", (width/4)*3, height/2+height/4.5);//////////////////Angle
      } 
      noFill();
      strokeWeight(1.5);
      smooth();
      stroke(219, 123, 44);

      fill(225);
      textFont(clockFont, 72);
      textSize(72);
      if (kindofexer==1) { 
        text("DUMBLE", width/9, height/15);//////////////////Angle
      } else if (kindofexer==2) {
        text("SQUAT", width/12, height/15);//////////////////Angle
      } else if (kindofexer==3) {
        text("SLL", width/12, height/15);//////////////////Angle
      } 
      noFill();
      strokeWeight(1.5);
      smooth();
      stroke(219, 123, 44);
   
   
      fill(0);//****************************************************************** Stop shape
      if (rank_exerTime<60) {
        stroke(225, 50);
      } else if ( !restTimecheck && ranknumber == 0 ) {
        stroke(225, 50);
      } else {
        stroke(225);
      }
      strokeWeight(3.5);
      ellipse(width/2, height/5, 120, 120);
      if (rank_exerTime<60) {
        fill(225, 50);
      } else if ( !restTimecheck && ranknumber == 0 ) {
        fill(225, 50);
      } else {
        fill(225);
      }
      textFont(letterFont, 35);
      textSize(35);///////////////////////////ratio fix!!!!
      text("STOP", width/2, height/5.1);

      fill(0); //********************************************** EXER or REST shape
      stroke(225);
      fill(225);
      noStroke();
      //strokeWeight(3.5);
      ellipse(width/2, height-height/5., 120, 120);
      //fill(225);
      stroke(0);
      noFill();
      ellipse(width/2, height-height/5., 110, 110);
      fill(0);
      textFont(letterFont, 35);
      textSize(35);///////////////////////////ratio fix!!!!
      if (!restTimecheck) {
        text("EXER", width/2, height-height/4.9);
        noStroke(); //******************************************************* play shape
       
        if (rank_exerTime<60) {
          fill(225, 50);
        } else {
          fill(225);
        }

        rectMode(CENTER);
        pushMatrix();
        translate( width/2, height/2 );
        beginShape();
        rect( width/46, 0, width/46, width/15 );
        rect( -width/46, 0, width/46, width/15 );
        popMatrix();
      } else {
        text("REST", width/2, height-height/4.9); //*******************************
        noStroke(); //******************************************************* play shape
        fill(225);
        pushMatrix();
        translate( width/2-height/19, height/2-height/16 );
        beginShape();
        vertex(0, 2);
        vertex(0, height/8);
        vertex(width/15, height/16);
        endShape(CLOSE);
        popMatrix();
      }


      noFill();//***************************************************** Back shape
      strokeWeight(2);
      if (rank_exerTime<60) {
        stroke(225, 50);
      } else if ( !restTimecheck && ranknumber == 0 ) {
        stroke(225, 50);
      } else {
        stroke(225);
      }
      ellipse(width/2.35, height/4.8, height/12, height/12);
      pushMatrix();
      translate(width/2.35, height/4.8);
      rotate(PI/2);
      line(0, +height/60, -height/60, -height/60);
      line(0, +height/60, height/60, -height/60);//**********************************
      popMatrix();

      textFont(clockFont, 72);
      textSize(72);
      fill(225);

      if ( totalexerTime%60>9 ) {
        text(totalexerTime/60+":"+totalexerTime%60, width-width/12, height/15);
      } else {
        text(totalexerTime/60+":0"+totalexerTime%60, width-width/12, height/15);
      }

      if (skeletonDepth.handclose && !skeletonDepth.handopen) { 
        float xpos = skeletonDepth.xpos;
        float ypos = skeletonDepth.ypos;
        float xpos1 = map(xpos, 0, 514, width/3.42, width/1.41);
        float ypos1 = map(ypos, 0, 424, height/11.02, height/1.12);

        if ( (xpos1<width/1.84 && xpos1>width/2.20) && (ypos1>height/2.4 && ypos1<height/1.77) && ranknumber == 0 ) {    //when normalmode(play button)
          restTimecheck=!restTimecheck;  //when restTimecheck = true -> rest(initial restTimecheck is restTime)

          if (restTimecheck) {

            if (kindofexer==1) dumbleSet++;
            else if (kindofexer==2) squatSet++;
            else if (kindofexer==3) shoulderSet++;

            if (kindofexer==1 && dumbleSet>0) sndQr.append("dum_normal_"+dumbleCount+ "_" + "\n");
            else if (kindofexer==2 && squatSet>0) sndQr.append("squ_normal_"+squatCount + "_" +"\n");
            else if (kindofexer==3 && shoulderSet>0) sndQr.append("sll_normal_"+shoulderCount + "_" +"\n");
          } else {

            dumbleCount = 0; 
            squatCount = 0;
            shoulderCount = 0;
            presentTime= millis();
          }
        } else if ( (xpos1<width/1.84 && xpos1>width/2.20) && (ypos1>height/2.4 && ypos1<height/1.77) && ranknumber == 1 && rank_exerTime == 60 ) { //when rankmode start(play button)
          restTimecheck=!restTimecheck;
          rank_exerTime = 60;
          presentTime= millis();
          dumbleCount = 0; 
          squatCount = 0;
          shoulderCount = 0;

          if (kindofexer==1) { // set count
            dumbleSet++;
          } else if (kindofexer==2) {
            squatSet++;
          } else if (kindofexer==3) {
            shoulderSet++;
          }
        } else if ( (xpos1<width/2.24 && xpos1>width/2.49) && (ypos1>height/6.07 && ypos1<height/4.15) && restTimecheck ) { // back(It doesn't work, when exerciseTime)
          kindofexer = 0;
        } else if ( (xpos1>width/2.15 && xpos1<width/1.89) && (ypos1>height/7.34 && ypos1<height/4.03) && restTimecheck ) { // home(It doesn't work, when exerciseTime)
          qrtime=millis();
          qrcheck=true;
          sndQr.append("totalexerTime_" + totalexerTime );
          qr.SendQr();
        }

        skeletonDepth.handclose=false;//////////////////////////////////////////need to select only one
      }

      exer_restTime =int((millis()-presentTime)/1000.0);

      if ( rank_exerTime<1 ) { // when rank_exerTime is 0, it act --> count extract and send to DB!!!!!                                                                                               //when rankmode finish
        restTimecheck=!restTimecheck;
        rank_exerTime = 60;
        if (kindofexer==1) sndQr.append("dum_rank_"+dumbleCount + "_" +"\n");
        else if (kindofexer==2) sndQr.append("squ_rank_"+squatCount + "_"+"\n");
        else if (kindofexer==3) sndQr.append("sll_rank_"+shoulderCount + "_" +"\n");
      } else {
        if ( !restTimecheck && ranknumber == 1 ) { // when you click play button, time go
          rank_exerTime = 60 - int((millis()-presentTime)/1000.0);
        } else if ( ranknumber == 1 ) { // count is 0 before you click paly button(rankMode)
          dumbleCount = 0; 
          squatCount = 0;
          shoulderCount = 0;
          skeletonDepth.totalCount=0;
        } else if ( restTimecheck && ranknumber == 0 ) { // when you rest, count is 0(nomalMode) 
          dumbleCount = 0; 
          squatCount = 0;
          shoulderCount = 0;
          skeletonDepth.totalCount=0;
        }
      }
    }
    if ( kindofexer==0 ) {//////////////////////////////////////////#3-2 scene(Exercise_select menu)

      dumbleCount=0;
      squatCount=0;
      shoulderCount=0;
      dumbleSet=0;
      squatSet=0;
      shoulderSet=0;
      skeletonDepth.totalCount=0;
      exer_restTime=0;
      exer.display();
    }
    skeletonDepth.recog();  //hand
  } else if (scene_number==3) {
    video.display();
    skeletonDepth.recog();
  }

  if (scene_number!=0) {///////////////////////////////////////h///#1 scene(logIn)
    textFont(clockFont, 72);
    textSize(72);
    fill(225);
    totalexerTime=int((millis()-startTime)/60000.0);

    if (totalexerTime%60>9) {
      text(totalexerTime/60+":"+totalexerTime%60, width-width/12, height/15);
    } else {
      text(totalexerTime/60+":0"+totalexerTime%60, width-width/12, height/15);
    }
  }

  if (dbCheck) {
    if (millis()-dbTime>10000) {
      dbCheck = false;
      scene_number=3;
    } else {
      set(width/2-height/4, height/2-height/4, QRCode_db);
    }
  } else if (sllCheck) {
    if (millis()-sllTime>10000) {
      sllCheck = false;
      scene_number=3;
    } else {
      set(width/2-height/4, height/2-height/4, QRCode_sll);
    }
  } else if (sqtCheck) {
    if (millis()-sqtTime>10000) {
      sqtCheck = false;
      scene_number=3;
    } else {
      set(width/2-height/4, height/2-height/4, QRCode_sqt);
    }
  }

  if (qrcheck) { // when I click "STOP", qr appear 10 sec
    if (millis()-qrtime>10000) {
      qrcheck=false;
      kindofexer=0;
      scene_number=0;
      sndQr.setLength(0); // initial
    } else {
      set(width/2-height/4, height/2-height/4, QRCode);
    }
  }
}
