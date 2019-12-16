class skeleton_depth {
  boolean handopen;
  boolean handclose;
  float xpos;
  float ypos;
  boolean result;
  int totalCount;

  skeleton_depth() {
    xpos = 0.0;
    ypos = 0.0;
    handopen = true;
    handclose = true;
    result= true;
    totalCount=0;
  }

  void recog() {

    //get the skeletons as an Arraylist of KSkeletons
    ArrayList<KSkeleton> skeletonArray =  kinect.getSkeletonDepthMap();

    //individual joints
    for (int i = 0; i < skeletonArray.size(); i++) {
      KSkeleton skeleton = (KSkeleton) skeletonArray.get(i);
      //if the skeleton is being tracked compute the skleton joints
      if (skeleton.isTracked()) {
        KJoint[] joints = skeleton.getJoints();

        color col  = skeleton.getIndexColor();
        fill(col);
        stroke(col);
        if (kindofexer==1) {//////////////DUMBLE(o)
          pushMatrix();
          translate(joints[9].getX(), joints[9].getY(), joints[9].getZ());
          float a = abs(dist(joints[10].getX(), joints[10].getY(), joints[10].getZ(), joints[8].getX(), joints[8].getY(), joints[8].getZ()));
          float b = abs(dist(joints[8].getX(), joints[8].getY(), joints[8].getZ(), joints[9].getX(), joints[9].getY(), joints[9].getZ()));
          float c = abs(dist(joints[9].getX(), joints[9].getY(), joints[9].getZ(), joints[10].getX(), joints[10].getY(), joints[10].getZ()));
          float cosa = (b*b+c*c-a*a)/(2*b*c);
          int degree = int(degrees(acos(cosa)));
          //println("degree = " +degree);
          popMatrix();
          textSize(32);

          if ( ranknumber == 0 ) {
            if (result==true) {
              if (degree<40) {
                result=false;
              }
            }
            if (result==false) {
              if (degree>160) {
                totalCount++;
                dumbleCount= totalCount;
                result=true;
              }
            }
          } else if ( ranknumber == 1) {
            if (result==true) {
              if (degree<40) {
                result=false;
              }
            }
            if (result==false) {
              if (degree>160) {
                if ( rank_exerTime !=0 ) {
                  totalCount++;
                }
                dumbleCount= totalCount;
                result=true;
              }
            }
          }

          dumbleDegree=degree;
        } else if (kindofexer==2) {/////////SQUAT()     15 13 12(hip)

          pushMatrix();///////////////change
          translate(joints[5].getX(), joints[5].getY(), joints[5].getZ());
          float a2 = abs(dist(joints[12].getX(), joints[12].getY(), joints[12].getZ(), joints[15].getX(), joints[15].getY(), joints[15].getZ()));
          float b2 = abs(dist(joints[15].getX(), joints[15].getY(), joints[15].getZ(), joints[13].getX(), joints[13].getY(), joints[13].getZ()));
          float c2 = abs(dist(joints[13].getX(), joints[13].getY(), joints[13].getZ(), joints[12].getX(), joints[12].getY(), joints[12].getZ()));
          float cosa2 = (b2*b2+c2*c2-a2*a2)/(2*b2*c2);
          int degree2 = int(degrees(acos(cosa2)));
          popMatrix();
         
          if (result==true) {/////////////////////////////need to change(angle)
            if (degree2<115) {
              result=false;
            }
          }
          if (result==false) {
            if (degree2>170) {
              totalCount++;
              squatCount= totalCount;
              result=true;
            }
          }
          squatDegree=degree2;
        } else if (kindofexer==3) {
          pushMatrix();///////////////Shoulder left(o) 
          //////////////////////////////////////////////neck spine y == shoulder y
          translate(joints[4].getX(), joints[4].getY(), joints[4].getZ());
          float a3 = abs(dist(joints[20].getX(), joints[20].getY(), joints[20].getZ(), joints[5].getX(), joints[5].getY(), joints[5].getZ()));
          float b3 = abs(dist(joints[5].getX(), joints[5].getY(), joints[5].getZ(), joints[4].getX(), joints[20].getY(), joints[4].getZ()));
          float c3 = abs(dist(joints[4].getX(), joints[20].getY(), joints[4].getZ(), joints[20].getX(), joints[20].getY(), joints[20].getZ()));
          float cosa3 = (b3*b3+c3*c3-a3*a3)/(2*b3*c3);
          int degree3 = int(degrees(acos(cosa3)));
          popMatrix();
      
          if (result==true) {/////////////////////////////need to change(angle)
            if (degree3<120) {
              result=false;
            }
          }
          if (result==false) {
            if (degree3>165) {
              totalCount++;
              shoulderCount= totalCount;
              result=true;
            }
          }
          shoulderDegree=degree3;
        } else if (kindofexer==4) {/////////SQUAT()     15 13 12(hip)

          pushMatrix();///////////////change
          translate(joints[5].getX(), joints[5].getY(), joints[5].getZ());
          float a4 = abs(dist(joints[12].getX(), joints[12].getY(), joints[12].getZ(), joints[15].getX(), joints[15].getY(), joints[15].getZ()));
          float b4 = abs(dist(joints[15].getX(), joints[15].getY(), joints[15].getZ(), joints[13].getX(), joints[13].getY(), joints[13].getZ()));
          float c4 = abs(dist(joints[13].getX(), joints[13].getY(), joints[13].getZ(), joints[12].getX(), joints[12].getY(), joints[12].getZ()));
          float cosa4 = (b4*b4+c4*c4-a4*a4)/(2*b4*c4);
          int degree4 = int(degrees(acos(cosa4)));
          popMatrix();
         
          if (result==true) {/////////////////////////////need to change(angle)
            if (degree4<115) {
              result=false;
            }
          }
          if (result==false) {
            if (degree4>170) {
              totalCount++;
              result=true;
            }
          }
        }
        drawHandState(joints[KinectPV2.JointType_HandRight]);
      }
    }
  }
  void drawBody(KJoint[] joints) {
    
    drawBone(joints, KinectPV2.JointType_Head, KinectPV2.JointType_Neck);
    drawBone(joints, KinectPV2.JointType_Neck, KinectPV2.JointType_SpineShoulder);
    drawBone(joints, KinectPV2.JointType_SpineShoulder, KinectPV2.JointType_SpineMid);
    drawBone(joints, KinectPV2.JointType_SpineMid, KinectPV2.JointType_SpineBase);
    drawBone(joints, KinectPV2.JointType_SpineShoulder, KinectPV2.JointType_ShoulderRight);
    drawBone(joints, KinectPV2.JointType_SpineShoulder, KinectPV2.JointType_ShoulderLeft);
    drawBone(joints, KinectPV2.JointType_SpineBase, KinectPV2.JointType_HipRight);
    drawBone(joints, KinectPV2.JointType_SpineBase, KinectPV2.JointType_HipLeft);

    // Right Arm
    drawBone(joints, KinectPV2.JointType_ShoulderRight, KinectPV2.JointType_ElbowRight);
    drawBone(joints, KinectPV2.JointType_ElbowRight, KinectPV2.JointType_WristRight);
    drawBone(joints, KinectPV2.JointType_WristRight, KinectPV2.JointType_HandRight);
    drawBone(joints, KinectPV2.JointType_HandRight, KinectPV2.JointType_HandTipRight);
    drawBone(joints, KinectPV2.JointType_WristRight, KinectPV2.JointType_ThumbRight);

    // Left Arm
    drawBone(joints, KinectPV2.JointType_ShoulderLeft, KinectPV2.JointType_ElbowLeft);
    drawBone(joints, KinectPV2.JointType_ElbowLeft, KinectPV2.JointType_WristLeft);
    drawBone(joints, KinectPV2.JointType_WristLeft, KinectPV2.JointType_HandLeft);
    drawBone(joints, KinectPV2.JointType_HandLeft, KinectPV2.JointType_HandTipLeft);
    drawBone(joints, KinectPV2.JointType_WristLeft, KinectPV2.JointType_ThumbLeft);

    // Right Leg
    drawBone(joints, KinectPV2.JointType_HipRight, KinectPV2.JointType_KneeRight);
    drawBone(joints, KinectPV2.JointType_KneeRight, KinectPV2.JointType_AnkleRight);
    drawBone(joints, KinectPV2.JointType_AnkleRight, KinectPV2.JointType_FootRight);

    // Left Leg
    drawBone(joints, KinectPV2.JointType_HipLeft, KinectPV2.JointType_KneeLeft);
    drawBone(joints, KinectPV2.JointType_KneeLeft, KinectPV2.JointType_AnkleLeft);
    drawBone(joints, KinectPV2.JointType_AnkleLeft, KinectPV2.JointType_FootLeft);

    //Single joints
    drawJoint(joints, KinectPV2.JointType_HandTipLeft);
    drawJoint(joints, KinectPV2.JointType_HandTipRight);
    drawJoint(joints, KinectPV2.JointType_FootLeft);
    drawJoint(joints, KinectPV2.JointType_FootRight);

    drawJoint(joints, KinectPV2.JointType_ThumbLeft);
    drawJoint(joints, KinectPV2.JointType_ThumbRight);

    drawJoint(joints, KinectPV2.JointType_Head);
  }

  //draw a single joint
  void drawJoint(KJoint[] joints, int jointType) {
    pushMatrix();
    translate(joints[jointType].getX(), joints[jointType].getY(), joints[jointType].getZ());
    ellipse(0, 0, 25, 25);
    popMatrix();
  }

  //draw a bone from two joints
  void drawBone(KJoint[] joints, int jointType1, int jointType2) {
    pushMatrix();
    translate(joints[jointType1].getX(), joints[jointType1].getY(), joints[jointType1].getZ());
    ellipse(0, 0, 25, 25);
    popMatrix();
    line(joints[jointType1].getX(), joints[jointType1].getY(), joints[jointType1].getZ(), joints[jointType2].getX(), joints[jointType2].getY(), joints[jointType2].getZ());
  }

  //draw a ellipse depending on the hand state
  void drawHandState(KJoint joint) {
    noStroke();
    xpos = joint.getX();
    ypos = joint.getY();
    handState(joint.getState());
    pushMatrix();
    float xpos1 = map(xpos, 0, 514, width/3.42, width/1.41);
    float ypos1 = map(ypos, 0, 424, height/11.02, height/1.12);
    //float ypos1 = map(ypos, 0, 424, 0, height);
    translate(xpos1, ypos1, joint.getZ());
    ellipse(0, 0, height/17, height/17);
    popMatrix();
  }

  /*
Different hand state
   KinectPV2.HandState_Open
   KinectPV2.HandState_Closed
   KinectPV2.HandState_Lasso
   KinectPV2.HandState_NotTracked
   */

  //Depending on the hand state change the color
  void handState(int handState) {
    switch(handState) {

    case KinectPV2.HandState_Open:
      handopen = true;
      handclose= true;

      fill(0, 255, 0);
      break;
    case KinectPV2.HandState_Closed:
      if (handopen && handclose) {
        handopen =false;
        handclose = true;
      }
      //handclose = false;
      fill(255, 0, 0);
      break;
    case KinectPV2.HandState_Lasso:
      fill(0, 0, 255);
      break;
    case KinectPV2.HandState_NotTracked:
      fill(100, 100, 100);
      break;
    }
  }
}
