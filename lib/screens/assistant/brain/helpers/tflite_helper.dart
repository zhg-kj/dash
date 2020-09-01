import 'dart:async';
import 'package:tflite/tflite.dart';
import 'package:camera/camera.dart';

import 'package:dash/screens/assistant/brain/predictions.dart';
import 'package:dash/screens/assistant/brain/helpers/app_helper.dart';

class TFLiteHelper {
  static StreamController<List<Predictions>> tfLitePredictionsController =
      new StreamController.broadcast();
  static List<Predictions> _outputs = List();
  static var modelLoaded = false;

  static Future<String> loadModel() async {
    AppHelper.log("loadModel", "Loading model..");

    return Tflite.loadModel(
      model: "assets/tflite/model_unquant.tflite",
      labels: "assets/tflite/labels.txt",
    );
  }

  static classifyImage(CameraImage image) async {
    await Tflite.runModelOnFrame(
            bytesList: image.planes.map((plane) {
              return plane.bytes;
            }).toList(),
            numResults: 5)
        .then((value) {
      if (value.isNotEmpty) {
        AppHelper.log("classifyImage", "Results loaded. ${value.length}");

        //Clear previous results
        _outputs.clear();

        value.forEach((element) {
          _outputs.add(Predictions(
              element['confidence'], element['index'], element['label']));

          AppHelper.log("classifyImage",
              "${element['confidence']} , ${element['index']}, ${element['label']}");
        });
      }

      //Sort results according to most confidence
      _outputs.sort((a, b) => a.confidence.compareTo(b.confidence));

      //Send results
      tfLitePredictionsController.add(_outputs);
    });
  }

  static void disposeModel() {
    Tflite.close();
    tfLitePredictionsController.close();
  }
}
