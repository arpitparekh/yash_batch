import 'package:flutter/material.dart';

void main(){
  runApp(RowWidget());
}

class RowWidget extends StatelessWidget {
  const RowWidget({super.key});

  @override
  Widget build(BuildContext context) {

    print(MediaQuery.sizeOf(context).width);
    print(MediaQuery.sizeOf(context).height);

    double width = 100;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
        child: SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: width,
                  height: MediaQuery.sizeOf(context).height/7,
                  color: Colors.red,
                ),
                Container(
                  width: width,
                  height: MediaQuery.sizeOf(context).height/7,
                  color: Colors.black,
                ),
                Container(
                  width: width,
                  height: MediaQuery.sizeOf(context).height/7,
                  color: Colors.green,
                ),
                Container(
                  width: width,
                  height: MediaQuery.sizeOf(context).height/7,
                  color: Colors.amber,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

