import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FirebaseStorageService extends ChangeNotifier{
  FirebaseStorageService();



  //Afbeelding downloaden van de database
  static Future<dynamic> loadImage(BuildContext context, String image) async {
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }

  //De dynamic afbeelding veranderen naar een afbeelding widget
  static Future<Widget> getImage(BuildContext context, String imageName) async {
    Image image = Image(image: AssetImage("assets/loodslogo.png"));
    
    await FirebaseStorageService.loadImage(context, imageName).then((value) {
      image = Image.network(
        value.toString(),

      );
    }
    );

    return image;
    
  }

}