import 'package:flutter/material.dart';

void main() {
  runApp(ChorGutterActor());
}

class ChorGutterActor extends StatelessWidget {
  const ChorGutterActor({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chord Gutter Actor',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Truth of Bollywood'),
        ),
        body: Stack(children: [
          Center(
            child: Image(
                image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRl5dEW9LoxfnJDo0Bc5e5tP11VwXk4Y-djSEXWMb0xB6QFIorah0qq-PeNDSwFMCFX_i4&usqp=CAU")),
          ),
          Center(child: Text("Srk is Chor Gutter Actor",style:TextStyle(
            color:Colors.red,
            fontSize: 18.0,

            fontWeight: FontWeight.bold,
          )))
        ]),
      ),
    );
  }
}
