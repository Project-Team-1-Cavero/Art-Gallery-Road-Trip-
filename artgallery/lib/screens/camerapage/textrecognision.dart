import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class TextRegonizion
{
  static Future<String> regonizion(String imageFile) async
  {
    String tekst = "";

    try
    {

      final inputImage = InputImage.fromFilePath(imageFile);
      final textDetector = GoogleMlKit.vision.textDetectorV2();
      final RecognisedText recognisedText = await textDetector.processImage(inputImage);

      

      //Eerste regel pakken van de gelezen tekst
      TextBlock block = recognisedText.blocks[0];
      TextLine line = block.lines[0];
      for (TextElement word in line.elements)
      {
        tekst += word.text + " ";
      }
      
    }
    catch (error)
    {
      print(error.toString());
    }

    return tekst;

    
    
  }

}