import 'package:camera/camera.dart';                            //We hebben deze nodig om de camera dunctie te gebruiken van de Camera plugin
import 'package:flutter/material.dart';
import 'camrapage.dart';


class burronscreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(child: const Text("Go to the camera"), // We maken een knop widget die je zal leiden naar de camera
        onPressed: () async {                                  // async betekent dat we teggen flutter zeggen, dat deze functie lang zal duren
          await availableCameras().then(                       // await betekent dat flutter moet wachten op deze functie | availableCameras haalt van alle camera de beschrijving op
            (value) => Navigator.push(                         // value zal een lijst zijn met alle camera's : Navigator zegt dat we een andere widget hier willen laten zien.
              context, MaterialPageRoute(                      // We geven in deze functie aan dat het een matrial type widget is
                builder: (context) => camerascreen(value)      // We maken hier de camera widget pagina aan, met de lijst van alle camera's
              )
            )
          );
        },
      ),
      
    );
  }
}