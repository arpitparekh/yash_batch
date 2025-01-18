import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller = TextEditingController();
  String result = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Shah Rukh Khan is the worst Gutter Artist"),
            backgroundColor: Colors.lightBlue,
          ),
          body: Column(
            children: [
              TextField(
                controller: controller,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = controller.text;
                    });
                  },
                  child: Text("True Gutter Dukkar Artist SRK")),
              Text(result),
            ],
          ),
        ));
  }
}
