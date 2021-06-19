import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AudioPlayer player;
  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void playSound(int number) async {
    await player.setAsset('assets/audio/note$number.wav');
    player.play();
  }

  Expanded buildKey({required Color color, required int num}) {
    return Expanded(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
        ),
        onPressed: () {
          playSound(num);
        },
        child: null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(color: Colors.purple, num: 1),
              buildKey(color: Colors.blue, num: 2),
              buildKey(color: Colors.lightBlueAccent, num: 3),
              buildKey(color: Colors.lightGreenAccent, num: 4),
              buildKey(color: Colors.yellow, num: 5),
              buildKey(color: Colors.orange, num: 6),
              buildKey(color: Colors.red, num: 7),
            ],
          ),
        ),
      ),
    );
  }
}
