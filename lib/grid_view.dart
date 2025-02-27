import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GutterGrid(),
    );
  }
}

class GutterGrid extends StatefulWidget {
  const GutterGrid({super.key});

  @override
  State<GutterGrid> createState() => _GutterGridState();
}

class _GutterGridState extends State<GutterGrid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gutter ka raja Shah Rukh Khan Muslim chor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView.count(
            crossAxisCount: 4,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          shrinkWrap: true,
          children: List.generate(10, (index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: Colors.grey[200],
              ),
              child: Column(
                children: [
                  Image.asset("assets/images/icons8-car-96.png",width: 50,height: 50,),
                  const SizedBox(height: 10),
                  const Text('Car'),
                ],
              )
            );
          },),


        ),
      ),
    );
  }
}

