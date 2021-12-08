// // ignore_for_file: file_names, prefer_const_constructors, deprecated_member_use, duplicate_ignore

// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'dart:async';
// import 'package:tflite/tflite.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   PickedFile? _image; //put image here
//   List<dynamic>? _outputs;

//   // ignore: annotate_overrides
//   void initState() {
//     super.initState();

//     loadModel();
//   }

// //Load the Tflite model
//   loadModel() async {
//     await Tflite.loadModel(
//       model: "assets/model/model_unquant.tflite",
//       labels: "assets/model/labels.txt",
//     );
//   }

//   classifyImage(image) async {
//     var output = await Tflite.runModelOnImage(
//       path: image.path,
//       numResults: 2,
//       threshold: 0.5,
//       imageMean: 127.5,
//       imageStd: 127.5,
//     );
//     setState(() {
//       _outputs = output;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return;
//   }
//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     appBar: AppBar(
//   //       title: const Text('Image Classification'),
//   //       backgroundColor: Colors.grey,
//   //     ),
//   //     body: _loading
//   //         ? Container(
//   //             alignment: Alignment.center,
//   //             child: const CircularProgressIndicator(),
//   //           )
//   //         : SizedBox(
//   //             width: MediaQuery.of(context).size.width,
//   //             child: Column(
//   //               crossAxisAlignment: CrossAxisAlignment.center,
//   //               mainAxisAlignment: MainAxisAlignment.center,
//   //               children: [
//   //                 _image == null ? Container() : Image.file(File(_image!.path)),
//   //                 const SizedBox(
//   //                   height: 20,
//   //                 ),
//   //                 _outputs != null
//   //                     ? Text(
//   //                         '${_outputs![0]["label"]}',
//   //                         style: TextStyle(
//   //                           color: Colors.black,
//   //                           fontSize: 20.0,
//   //                           background: Paint()..color = Colors.white,
//   //                         ),
//   //                       )
//   //                     : Container()
//   //               ],
//   //             ),
//   //           ),
//   //     floatingActionButton: FloatingActionButton(
//   //       onPressed: pickImage,
//   //       backgroundColor: Colors.grey,
//   //       child: Icon(Icons.image),
//   //     ),
//   //   );
//   // }
// }
