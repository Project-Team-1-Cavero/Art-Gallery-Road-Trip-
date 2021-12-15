import 'package:artgallery/screens/gallery_page/gallery_page_widgets/art_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class gallerList extends StatefulWidget {
  gallerList({Key? key}) : super(key: key);

  @override
  _gallerListState createState() => _gallerListState();
}

class _gallerListState extends State<gallerList> {

  //Art pieces data
  final Stream<QuerySnapshot> artPieces = FirebaseFirestore.instance.collection("ArtPieces").snapshots();



  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<QuerySnapshot>(stream: artPieces, builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) 
      {
        if (snapshot.hasError)
        {
          return Text("There was a erro");
        }

        if (snapshot.connectionState == ConnectionState.waiting)
        {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final data = snapshot.requireData;

        return ListView.builder(
          itemCount: data.size,
          itemBuilder: (BuildContext context, int index) {
            if (data.docs[index] != null)
            {

              var artpiece = data.docs[index];
              return artCard(artpiece);
            }

            return Text("Something went wrong");
          },
        );

      },)
    );
  }
}