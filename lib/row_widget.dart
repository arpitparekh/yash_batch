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

    double width = MediaQuery.sizeOf(context).width/5;
    double height = 200;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
        child: SafeArea(
          child: Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: width,
                  height: height,
                  color: Colors.red,
                ),
                Container(
                  width: width,
                  height: height,
                  color: Colors.black,
                ),
                Container(
                  width: width,
                  height: height,
                  color: Colors.green,
                ),
                Container(
                  width: width,
                  height: height,
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

