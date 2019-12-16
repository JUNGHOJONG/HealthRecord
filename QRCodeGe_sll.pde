class QRCodeGe_sll {

  QRCodeGe_sll() {
  }
  String timeStamp() {
    return year()+nf(month(), 2)+nf(day(), 2)+nf(hour(), 2)+nf(minute(), 2)+nf(second(), 2);
  }
  void SendQr() {

    try {
      QRCode_sll = zxing4p.generateQRCode("https://www.youtube.com/watch?v=mOp2D0cvUxM", height/2, height/2);
      QRCode_sll.save(dataPath("")+"/qrcode_tmp.gif");
      QRCode_sll = loadImage("qrcode_tmp.gif");
    } 
    catch (Exception e) {  
      println("Exception: "+e);
      QRCode_sll = null;
    }
  }
}
