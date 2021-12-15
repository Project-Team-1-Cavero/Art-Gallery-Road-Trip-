import 'package:artgallery/screens/gallery_page/gallery_page_subsetions/middel_gallery_page.dart';
import 'package:artgallery/screens/gallery_page/gallery_page_subsetions/navigation_gallery_page.dart';
import 'package:artgallery/screens/gallery_page/gallery_page_widgets/art_card.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'gallery_page_subsetions/upper_gallery_page.dart';

class galleryPage extends StatefulWidget {
  galleryPage({Key? key}) : super(key: key);

  @override
  _galleryPageState createState() => _galleryPageState();
}

class _galleryPageState extends State<galleryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: HexColor("#385051")), 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height /5,
              decoration: BoxDecoration(color: HexColor("#385051")),
              child: galleryHeader(),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.67,
              child: gallerList(),
            ),
            galleryNavigation()

          ],
        ),
      ),
    );
  }
}