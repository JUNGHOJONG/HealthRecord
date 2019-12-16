class QRCodeGe {

  QRCodeGe() {
  }
  String timeStamp() {
    return year()+nf(month(), 2)+nf(day(), 2)+nf(hour(), 2)+nf(minute(), 2)+nf(second(), 2);
  }
  void SendQr() {

    try {
      QRCode = zxing4p.generateQRCode(sndQr.toString(), height/2, height/2);
      QRCode.save(dataPath("")+"/qrcode_tmp.gif");
      QRCode = loadImage("qrcode_tmp.gif");
    } 
    catch (Exception e) {  
      println("Exception: "+e);
      QRCode = null;
    }
  }
}
