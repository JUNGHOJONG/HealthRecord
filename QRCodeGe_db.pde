class QRCodeGe_db {

  QRCodeGe_db() {
  }
  String timeStamp() {
    return year()+nf(month(), 2)+nf(day(), 2)+nf(hour(), 2)+nf(minute(), 2)+nf(second(), 2);
  }
  void SendQr() {

    try {
      QRCode_db = zxing4p.generateQRCode("https://www.youtube.com/watch?v=SA1mLjTxgjU&t=9s", height/2, height/2);
      QRCode_db.save(dataPath("")+"/qrcode_tmp.gif");
      QRCode_db = loadImage("qrcode_tmp.gif");
    } 
    catch (Exception e) {  
      println("Exception: "+e);
      QRCode_db = null;
    }
  }
}
