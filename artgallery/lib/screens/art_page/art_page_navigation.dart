import 'package:artgallery/screens/gallery_page/gallery_page_subsetions/middel_gallery_page.dart';
import 'package:artgallery/screens/gallery_page/main_gallery_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class artPageNavigation extends StatefulWidget {
  QueryDocumentSnapshot<Object?> artpice;

  artPageNavigation(this.artpice);

  @override
  _artPageNavigationState createState() => _artPageNavigationState();
}

class _artPageNavigationState extends State<artPageNavigation> {
  //Like and dislike data on device
  bool isliked = false;
  bool isDisliked = false;
  int likeplus = 0;
  int dislikeplus = 0;

  String likecolor = "#4A4949";
  String dislikeColor = "#4A4949";

  //Staring up get data
  @override
  @override
  void initState() {
    super.initState();
    getData();
  }

  //Getting the data from the device
  getData() async {
    SharedPreferences deviceData = await SharedPreferences.getInstance();
    var islikedRaw = deviceData.getBool(widget.artpice["Name"] + "IsLiked");
    var isDislikedRaw =
        deviceData.getBool(widget.artpice["Name"] + "IsDisliked");

    if (islikedRaw == null) {
      isliked = false;
      likecolor = "#4A4949";
    } else if (islikedRaw == false) {
      isliked = false;
      likecolor = "#4A4949";
    } else {
      isliked = true;
      likecolor = "A1813D";
    }

    if (isDislikedRaw == null) {
      isDisliked = false;
      dislikeColor = "#4A4949";
    } else if (isDislikedRaw == false) {
      isDisliked = false;
      dislikeColor = "#4A4949";
    } else {
      isDisliked = true;
      dislikeColor = "A1813D";
    }
    setState(() {});
  }

  //Store the data from the device
  storeData(String type) async {
    SharedPreferences deviceData = await SharedPreferences.getInstance();

    if (type == "Like") {
      deviceData.setBool(widget.artpice["Name"] + "IsLiked", isliked);
    } else {
      deviceData.setBool(widget.artpice["Name"] + "IsDisliked", isDisliked);
    }
  }

  likePiece(String type) async {
    if (type == "Like") {
      if (isliked == false && isDisliked == false) {
        QuerySnapshot snapshot = await FirebaseFirestore.instance
            .collection("ArtPieces")
            .where("Name", isEqualTo: widget.artpice["Name"])
            .where("Year", isEqualTo: widget.artpice["Year"])
            .get();

        print(snapshot.docs.length);
        if (snapshot.docs.isNotEmpty) {
          snapshot.docs.forEach((element) {
            element.reference.update({"Likes": FieldValue.increment(1)});
            isliked = true;
            likecolor = "A1813D";
            storeData("Like");
          });
        } else {
          print("Did not work");
        }
        setState(() {
          likeplus++;
        });
      } else if (isliked == true && isDisliked == false) {
        QuerySnapshot snapshot = await FirebaseFirestore.instance
            .collection("ArtPieces")
            .where("Name", isEqualTo: widget.artpice["Name"])
            .where("Year", isEqualTo: widget.artpice["Year"])
            .get();

        print(snapshot.docs.length);
        if (snapshot.docs.isNotEmpty) {
          snapshot.docs.forEach((element) {
            element.reference.update({"Likes": FieldValue.increment(-1)});
            isliked = false;
            likecolor = "#4A4949";
            storeData("Like");
          });
        } else {
          print("Did not work");
        }
        setState(() {
          likeplus--;
        });
      }
    } else if (type == "Dislike") {
      if (isliked == false && isDisliked == false) {
        QuerySnapshot snapshot = await FirebaseFirestore.instance
            .collection("ArtPieces")
            .where("Name", isEqualTo: widget.artpice["Name"])
            .where("Year", isEqualTo: widget.artpice["Year"])
            .get();

        print(snapshot.docs.length);
        if (snapshot.docs.isNotEmpty) {
          snapshot.docs.forEach((element) {
            element.reference.update({"Dislikes": FieldValue.increment(1)});
            isDisliked = true;
            dislikeColor = "A1813D";
            storeData("Dislike");
          });
        } else {
          print("Did not work");
        }
        setState(() {
          dislikeplus++;
        });
      } else if (isliked == false && isDisliked == true) {
        QuerySnapshot snapshot = await FirebaseFirestore.instance
            .collection("ArtPieces")
            .where("Name", isEqualTo: widget.artpice["Name"])
            .where("Year", isEqualTo: widget.artpice["Year"])
            .get();

        print(snapshot.docs.length);
        if (snapshot.docs.isNotEmpty) {
          snapshot.docs.forEach((element) {
            element.reference.update({"Dislikes": FieldValue.increment(-1)});
            isDisliked = false;
            dislikeColor = "#4A4949";
            storeData("Dislike");
          });
        } else {
          print("Did not work");
        }
        setState(() {
          dislikeplus--;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 8,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 11,
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(color: HexColor("#A1813D")),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => galleryPage()));
                  },
                  child: const Text(
                    "Galerij",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 6,
              ),

              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 7,
                    height: MediaQuery.of(context).size.height / 15,
                    child: IconButton(
                      onPressed: () async {
                        likePiece("Like");
                      },
                      icon: Icon(
                        Icons.thumb_up,
                        size: 45,
                        color: HexColor(likecolor),
                      ),
                    ),
                  ),
                  Text(
                    "${(widget.artpice["Likes"] + likeplus).toString()}",
                    style: TextStyle(fontSize: 25, color: HexColor("#A1813D")),
                  )
                ],
              ),

              //left second padding
              Container(
                width: MediaQuery.of(context).size.width / 15,
                height: MediaQuery.of(context).size.height / 15,
              ),

              //column for dislike
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 7,
                    height: MediaQuery.of(context).size.height / 15,
                    child: IconButton(
                      onPressed: () {
                        likePiece("Dislike");
                      },
                      icon: Icon(
                        Icons.thumb_down,
                        size: 45,
                        color: HexColor(dislikeColor),
                      ),
                    ),
                  ),
                  Text(
                    "${(widget.artpice["Dislikes"] + dislikeplus).toString()}",
                    style: TextStyle(fontSize: 25, color: HexColor("#A1813D")),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
