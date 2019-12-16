class QRCodeGe_sqt {

  QRCodeGe_sqt() {
  }
  String timeStamp() {
    return year()+nf(month(), 2)+nf(day(), 2)+nf(hour(), 2)+nf(minute(), 2)+nf(second(), 2);
  }
  void SendQr() {

    try {
      QRCode_sqt = zxing4p.generateQRCode("https://www.youtube.com/watch?v=kiJ5ielW0_8", height/2, height/2);
      QRCode_sqt.save(dataPath("")+"/qrcode_tmp.gif");
      QRCode_sqt = loadImage("qrcode_tmp.gif");
    } 
    catch (Exception e) {  
      println("Exception: "+e);
      QRCode_sqt = null;
    }
  }
}
