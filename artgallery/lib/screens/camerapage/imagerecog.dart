import 'package:tflite/tflite.dart';

//List<dynamic>? _outputs;

findArtwork(image) {
  loadModel();
  return classifyImage(image);
}

loadModel() async {
  await Tflite.loadModel(
    model: "assets/model/model_unquant.tflite",
    labels: "assets/model/labels.txt",
  );
}

classifyImage(image) async {
  var output = await Tflite.runModelOnImage(
    path: image.path,
    numResults: 2,
    threshold: 0.5,
    imageMean: 127.5,
    imageStd: 127.5,
  );
  await Tflite.close();
  return output;
}
