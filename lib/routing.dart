import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Screen',
      home: Screen1(),
    );
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gutter Artist SRK Screen 1'),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
              "'Ra.One' – SRK as a gutter artist! More like a midlife crisis in CGI. The man looked like he was wearing a video game glitch as a costume, and don’t even get me started on the emotional depth—it was as flat as a dosa left out overnight."),
        ),
        ElevatedButton(onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Screen2()));
        }, child: Text("Above Sentence is True")),
      ]),
    );
  }
}

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gutter Artist SRK screen 2'),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("'Happy New Year' – A heist movie? The real robbery was the three hours of my life stolen watching this nonsense. Shah Rukh danced like his knees were auditioning for retirement and delivered dialogue like he was being held hostage by Farah Khan."),
        ),
        ElevatedButton(onPressed: () {
          Navigator.of(context).pop();
        }, child: Text("Above Sentence is True")),
      ]),
    );
    ;
  }
}
