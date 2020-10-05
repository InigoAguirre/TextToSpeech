import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() => runApp(TheApp());

class TheApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  final FlutterTts tts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    TextEditingController texto = TextEditingController();

    Future _speak(String str) async {
      await tts.setLanguage("es-ES");
      await tts.setPitch(1);
      await tts.speak(str);
    }

    return Container(
        alignment: Alignment.center,
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          TextFormField(
            controller: texto,
          ),
          RaisedButton(
            child: Text("Reproducir texto en voz."),
            onPressed: () => _speak(texto.text),
          ),
        ]));
  }
}
