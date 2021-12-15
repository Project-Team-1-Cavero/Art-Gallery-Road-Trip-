import 'dart:io';
import 'package:artgallery/screens/home/homepage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScannerPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => QrScanPageState();
}

class QrScanPageState extends State<QrScannerPage>{
  final qrKey = GlobalKey(debugLabel: 'QR');

  Barcode? qrcode;                     // resultaat van het scannen
  QRViewController? controller;

  @override
  void dispose(){
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

void onQRViewCreated(QRViewController controller){
    setState(() => this.controller = controller);
    controller.scannedDataStream.listen((qrcode) => setState(() {
      this.qrcode = qrcode;
    }));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: HexColor("#385051")),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 1.25,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.yellow),
                  child: buildQrView(context),
                  
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 11,
                        width: MediaQuery.of(context).size.width / 25,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 11,
                        width: MediaQuery.of(context).size.width / 5,
                        decoration: BoxDecoration(color: HexColor("A1813D")),
                        child: MaterialButton(
                          onPressed: () {
                            //controler.dispose();
                            Navigator.push(context, MaterialPageRoute(builder: (context) => homePage()));
                          },
                          child: Text("<", style: TextStyle(fontSize: 60),),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            
          ],
        ),
      ),
    );
  }
  Widget buildOptionButtons() =>Row(
   mainAxisSize: MainAxisSize.max,
   mainAxisAlignment: MainAxisAlignment.center,
   crossAxisAlignment: CrossAxisAlignment.center,
   children: [
     
     IconButton(icon: const Icon(Icons.flash_off),       // knop voor de zaklamp
     onPressed: () async {
       await controller?.toggleFlash();                   // aan en uit zetten van zaklamp
       setState(() {
       });
     },),
   ],);
  Widget buildQrView(BuildContext context) => QRView( 
    key: qrKey,
    onQRViewCreated: onQRViewCreated,
    overlay: QrScannerOverlayShape(
      cutOutSize: MediaQuery.of(context).size.width * 0.8,
      borderWidth: 10,
      borderColor: Theme.of(context).accentColor,
    ),
    );
}
 /* @override
  Widget builder(BuildContext context) => SafeArea(
    child: Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          buildQrView(context),
          Positioned(bottom: 10, 
          child: buildResult()),
          Positioned(top: 10, 
          child: buildOptionButtons()),
        ],
      ),
    ),
  );*/

 /*Widget buildOptionButtons() =>Row(
   mainAxisSize: MainAxisSize.max,
   mainAxisAlignment: MainAxisAlignment.center,
   crossAxisAlignment: CrossAxisAlignment.center,
   children: [
     
     IconButton(icon: const Icon(Icons.flash_off),       // knop voor de zaklamp
     onPressed: () async {
       await controller?.toggleFlash();                   // aan en uit zetten van zaklamp
       setState(() {
       });
     },),
   ],);*/

 /*Widget buildResult()=> Text(
  qrcode != null ? '${qrcode!.code}' :'scan a code!',        // resultaat van het scannen(welke text)
   //maxLines: 3,
 );*/

  /*Widget buildQrView(BuildContext context) => QRView( 
    key: qrKey,
    onQRViewCreated: onQRViewCreated,
    overlay: QrScannerOverlayShape(
      cutOutSize: MediaQuery.of(context).size.width * 0.8,
      borderWidth: 10,
      borderColor: Theme.of(context).accentColor,
    ),
    );

  void onQRViewCreated(QRViewController controller){
    setState(() => this.controller = controller);
    controller.scannedDataStream.listen((qrcode) => setState(() {
      this.qrcode = qrcode;
    }));
  }

}*/


