import 'package:artgallery/screens/art_page/art_page_widgets/route.dart'
    as routeWidget;
import 'package:flutter/material.dart';

class DialogHelper {
  static routeMessage(context, artpiece) => showDialog(
      //Maakt een pop-up aan met de lay-out van route.dart
      context: context,
      builder: (context) => routeWidget.Route(artpiece));
}
