import 'package:artgallery/screens/home/homepage.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'imagerecog.dart';

class cameraPage extends StatefulWidget {
  List<CameraDescription> cameras;

  cameraPage(this.cameras);

  @override
  _cameraPageState createState() => _cameraPageState();
}

class _cameraPageState extends State<cameraPage> {
  late CameraController controler;
  XFile? picturefile;

  @override
  void initState() {
    super.initState();
    controler = CameraController(widget.cameras[0], ResolutionPreset.max);

    controler.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
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
                  child: CameraPreview(controler),
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
                            controler.dispose();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => homePage()));
                          },
                          child: Text(
                            "<",
                            style: TextStyle(fontSize: 60),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Positioned(
                left: MediaQuery.of(context).size.width / 2.5,
                top: MediaQuery.of(context).size.height / 1.33,
                child: Container(
                  height: MediaQuery.of(context).size.height / 11,
                  width: MediaQuery.of(context).size.width / 5,
                  decoration: BoxDecoration(color: HexColor("A1813D")),
                  child: IconButton(
                      splashColor: Colors.white,
                      splashRadius: 20,
                      iconSize: 45,
                      onPressed: getImage,
                      icon: Icon(Icons.camera_alt)),
                ))
          ],
        ),
      ),
    );
  }

  void getImage() async {
    picturefile = await controler.takePicture();
    var outputs = findArtwork(picturefile);
    print("image recog outputs:"); //${outputs}"); //![0]["label"]
  }
}
