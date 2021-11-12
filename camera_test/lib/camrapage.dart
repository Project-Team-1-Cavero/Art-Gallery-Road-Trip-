import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class camerascreen extends StatefulWidget {
  final List<CameraDescription> cameras;                          //Hier wordt de lijst met alle camera opgeslagen
  
  const camerascreen(this.cameras);                               //Een constructor met als input de lijst met de camera's

  @override
  _camerascreenState createState() => _camerascreenState();       
}

class _camerascreenState extends State<camerascreen> {
  late CameraController controler;                               //Hier word de camera opgeslagen die we willen besturen, met de type object CameraController
  XFile? picurefile;                                             //Hier word de foto opgeslagen 

  @override
  void initState()                                               //We overide de flutter functie initState
  {
    super.initState();                                           //We roepen eerst de orginele op
    controler = CameraController(                                //We maken de controller aan met de eerste camera, en de kwaliteit op max
      widget.cameras[0],
      ResolutionPreset.max
    );

    controler.initialize().then((_) {                            //We starten hier de camera op
      if (!mounted)                                              //Als het niet gelukt is dan sturen we niks terug
      {
        return;
      }
      setState(() {});

    });
  }

  @override
  void dispose()                                                //We overide de dispose functie, zodat hij ook de camera stopt
  {
    controler.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    if (!controler.value.isInitialized)                        //Eerst contolleren we als de camera controler werkt, zo niet dan zie je alleen een laad scherm
    {
      return const SizedBox(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SizedBox(
              height: 400,
              width: 400,
              child: CameraPreview(controler),                //Dit is de widget dat je camera laat zien
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),               
          child: ElevatedButton(                              //deze knop maakt een foto          
            child: const Text("Take pic"),          
            onPressed: () async {
              picurefile = await controler.takePicture();     //Deze functie zegt tegen de controller maak een foto
              setState(() {});
            },
          ),
        ),
        if (picurefile != null)                               //Het laat alleen de volgde widget zien, als picturefile niet null is
          Image.network(                                      //We moeten deze functie gebruiken op de web om te zorgen dat we de afbeelding kunnen gebruiken
            picurefile!.path,                                 //We geven de locatie van de afbeelding in de browser
            height: 200,
          )

      ],
    );
  }
}