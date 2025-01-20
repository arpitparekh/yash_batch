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

  double sliderValue = 0.0;

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
              Text("Gutter King"),
              Slider(value: sliderValue, onChanged: (value) {
                setState(() {
                  sliderValue = value;
                  result = controller.text+"\n"+sliderValue.toString();
                });
              },
                min: 0,
                max: 100,
                divisions: 10,
                label: sliderValue.toString(),

              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = controller.text+"\n"+sliderValue.toString();
                    });
                  },
                  child: Text("True Gutter Dukkar Artist SRK")),
              Text(result),
            ],
          ),
        ));
  }
}
