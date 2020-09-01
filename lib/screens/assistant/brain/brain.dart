import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:io' show Platform;

import 'package:dash/size_config.dart';
import 'package:dash/screens/assistant/brain/helpers/camera_helper.dart';
import 'package:dash/screens/assistant/brain/helpers/tflite_helper.dart';
import 'package:dash/screens/assistant/brain/helpers/app_helper.dart';
import 'package:dash/screens/assistant/brain/predictions.dart';

class Brain extends StatefulWidget {
  @override
  _Brain createState() => _Brain();
}

enum TtsState { playing, stopped, paused }

class _Brain extends State<Brain> {
  FlutterTts flutterTts;

  List<Predictions> outputs;
  List<String> warnings = [
    'Approaching red light, prepare to stop',
    'Approaching yellow light, prepare to stop',
    'Approaching green light',
  ];

  List<Color> colors = [
    Color(0xFFfc1803),
    Color(0xFFfcd703),
    Color(0xFF56fc03),
    Color(0xFF3ebbfe)
  ];

  String message = '';
  int lastLight = 3;

  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;

  @override
  initState() {
    super.initState();
    initTts();

    //Load TFLite Model
    TFLiteHelper.loadModel().then((value) {
      setState(() {
        TFLiteHelper.modelLoaded = true;
      });
    });

    //Initialize Camera
    CameraHelper.initializeCamera();

    //Subscribe to TFLite's Classify events
    TFLiteHelper.tfLitePredictionsController.stream.listen(
        (value) {
          //Set Results
          outputs = value;

          //Play appropriate audio
          for (int i = 0; i < value.length; i++) {
            if (value[i].confidence > 0.90) {
              setMessage(value[i].id);
              print(message);
            }
          }

          setState(() {
            //Set bit to false to allow detection again
            CameraHelper.isDetecting = false;
          });
        },
        onDone: () {},
        onError: (error) {
          AppHelper.log("listen", error);
        });
  }

  initTts() {
    flutterTts = FlutterTts();

    flutterTts.setLanguage('en-GB');
    flutterTts.setVolume(0.5);
    flutterTts.setSpeechRate(0.4);
    flutterTts.setPitch(0.9);

    if (Platform.isAndroid) {
      _getEngines();
    }

    flutterTts.setStartHandler(() {
      setState(() {
        print("Playing");
        ttsState = TtsState.playing;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        print("Complete");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setCancelHandler(() {
      setState(() {
        print("Cancel");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setErrorHandler((msg) {
      setState(() {
        print("error: $msg");
        ttsState = TtsState.stopped;
      });
    });
  }

  Future _speak() async {
    if (message != null) {
      if (message.isNotEmpty) {
        var result = await flutterTts.speak(message);
        if (result == 1) setState(() => ttsState = TtsState.playing);
      }
    }
  }

  /*Future _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }*/

  Future _getEngines() async {
    var engines = await flutterTts.getEngines;
    if (engines != null) {
      for (dynamic engine in engines) {
        print(engine);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: Theme.of(context).primaryColor),
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(15.625)),
        child: AnimatedContainer(
          curve: Curves.fastOutSlowIn,
          duration: Duration(milliseconds: 400),
          width: getProportionateScreenWidth(150),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [
              new BoxShadow(
                color: colors[lastLight],
                blurRadius: 25.0,
              )
            ],
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  void setMessage(int i) {
    if (lastLight != i) {
      message = 'Update.' + warnings[i];
      lastLight = i;
      _speak();
    } else {
      lastLight = i;
    }
  }
}
