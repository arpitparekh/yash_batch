import 'package:flutter/material.dart';

void main() {
  runApp(ContainerWidget());
}

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({super.key});

  // container widget is box widget
  // styling // size
  // decoration
  // alignment
  // we can put other widget into it

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
        child: Center(
          child: Container(
            height: 200,
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(30, 0, 50, 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.red,
                  Colors.white,
                  Colors.blueAccent
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 5.0,
                )
              ],
              color: Colors.red,
              border: Border.all(
                  color: Colors.blueAccent,
                  width: 10,
                  style: BorderStyle.solid),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                "Hello World",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
