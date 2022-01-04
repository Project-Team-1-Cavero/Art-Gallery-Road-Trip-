import 'package:artgallery/logic/authi.dart';
import 'package:artgallery/screens/home/homepage.dart';
import 'package:flutter/material.dart';

class splashScreen extends StatefulWidget {
  splashScreen({Key? key}) : super(key: key);

  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height:  MediaQuery.of(context).size.height,
        width:  MediaQuery.of(context).size.width,
        child: Center(
          child: MaterialButton(
            child: Text("Sign in"),
            onPressed: () async {
              dynamic result = await firebaseAuthService().signIN();
              setState(() {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (Context) => homePage())
                  );
              });
            },
            ),
        ),
      )
    );
  }
}