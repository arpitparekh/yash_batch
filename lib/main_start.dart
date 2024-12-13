import "package:flutter/material.dart";

void main() {
  runApp(const WidgetIntro());
}

class WidgetIntro extends StatelessWidget {
  // parent widget
  const WidgetIntro({super.key});

  @override
  Widget build(BuildContext context) {
    // context have all the information of the screen
    // screen size // screen dimensions // theme related
    // build method return the child widget
    // ctl + alt + l for formatting
    // ctl + space for parameter
    // alt + enter // for error and warning
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
        color: Colors.lightBlue[200],
        child: const SafeArea(
          child: Text(
            "Welcome to the flutter application",
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(
              color: Colors.red,
              backgroundColor: Colors.amberAccent,
              fontSize: 30,
              height: 2,
              fontWeight: FontWeight.w600,
              wordSpacing: 8.0,
              decoration: TextDecoration.underline,
              decorationColor: Colors.purple,
              decorationThickness: 3.0,
            ),
          ),
        ),
      ),
    );
  }
}
