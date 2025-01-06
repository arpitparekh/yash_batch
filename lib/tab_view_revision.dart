import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyTabView(),
    );
  }
}

class MyTabView extends StatelessWidget {
  const MyTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Maha Gandu Shah Rukh"),
          bottom:const TabBar(
            tabs:[
              Tab(
                text: 'Gandu',
                icon: Icon(Icons.person),
              ),
              Tab(
                text: 'Shah',
                icon: Icon(Icons.temple_hindu),
              ),
              Tab(
                text: 'Rukh',
                icon: Icon(Icons.wind_power),
              ),
            ]
          ),
        ),
          body: const TabBarView(children: [
            Center(child:Text("Gandu")),
            Center(child:Text("Sandas Shah")),
            Center(child:Text("Rukh")),
          ],

          )
      ),
    );
  }
}
