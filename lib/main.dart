import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Xylophlutter App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: "Home Page"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final audioplayer = AudioPlayer();

  Future<void> _playSound(int soundNumber) async {
    final player = AudioPlayer();
    await player.play(AssetSource('sounds/note$soundNumber.wav'));
  }

  Expanded _buildTapWidget({required int soundNumber, required Color color}) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _playSound(soundNumber),
        child: Container(
          color: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildTapWidget(soundNumber: 1, color: Colors.yellow),
            _buildTapWidget(soundNumber: 2, color: Colors.blue),
            _buildTapWidget(soundNumber: 3, color: Colors.teal),
            _buildTapWidget(soundNumber: 4, color: Colors.orange),
            _buildTapWidget(soundNumber: 5, color: Colors.purple),
            _buildTapWidget(soundNumber: 6, color: Colors.green),
            _buildTapWidget(soundNumber: 7, color: Colors.red),
          ],
        ),
      ),
    );
  }
}
