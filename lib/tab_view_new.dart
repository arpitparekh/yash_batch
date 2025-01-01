import 'package:flutter/material.dart';

void main() {
  runApp(MyTabView());
}

class MyTabView extends StatelessWidget {
  const MyTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyTabs(),
    );
  }
}

class MyTabs extends StatelessWidget {
  const MyTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[200],
          title: Text("Tab View"),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.red,
            dividerColor: Colors.red,
            onTap: (value) {
              print(value);
            },
            tabs: [
            Tab(

              icon: Icon(Icons.add_alarm_rounded),
              text: "Alarm",
            ),
            Tab(
              icon: Icon(Icons.add_chart_rounded),
              text: "Chart",
            ),
            Tab(
              icon: Icon(Icons.search),
              text: "Search",
            ),
            Tab(
              icon: Icon(Icons.factory),
              text: "Factory",
            )
          ],
          ),
        ),
        body: TabBarView(children: [
          Center(
            child: Text("Page 1"),
          ),
          Center(
            child: Text("Page 2"),
          ),
          Center(
            child: Text("Page 3"),
          ),
          Center(
            child: Text("Page 4"),
          )
        ],

        ),

      ),
    );
  }
}
