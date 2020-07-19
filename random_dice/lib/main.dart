// chapter 5 making sounds when different flat button clicks
// Piano app
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Xylcphone"),
        backgroundColor: Colors.red,
      ),
      body: XylcphonePage(),
    ));
  }
}

class XylcphonePage extends StatelessWidget {
  void playAudio(int fileNumber) {
    final assetsAudioPlayer = AssetsAudioPlayer();
    assetsAudioPlayer.open(
      Audio("assets/note$fileNumber.wav"),
    );
  }

  Expanded getWidget(Color color, int fileNumber) {
    return Expanded(
      child: FlatButton(
          color: color,
          child: null,
          onPressed: () {
            playAudio(fileNumber);
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        getWidget(Colors.red, 1),
        getWidget(Colors.green, 2),
        getWidget(Colors.blue, 3),
        getWidget(Colors.orange, 4),
        getWidget(Colors.teal, 5),
        getWidget(Colors.black, 6),
        getWidget(Colors.yellow, 7),
      ],
    );
  }
}
