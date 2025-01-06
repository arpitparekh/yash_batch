import 'package:flutter/material.dart';
import 'column_widget.dart';
import 'container_widget.dart';

void main() {
  runApp(Bollywood());
}

class Bollywood extends StatelessWidget {
  const Bollywood({super.key});

  @override
  Widget build(BuildContext context) {
    // context is the information of the screen
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          elevation: 10.0,
          isExtended: true,
          shape: CircleBorder(),
          backgroundColor: Colors.brown,
          onPressed: () {
            // show snakebar
            var snakebar = SnackBar(
              content: Text("sandas jese muh wala actor SRK"),
            );
            ScaffoldMessenger.of(context).showSnackBar(snakebar);
          },
        ),
        appBar: AppBar(
          title: Text('Shah rukh khan is sandash itself'),
        ),
        body: DefaultTabController(
          length: 3,
          child: TabBarView(
            children: [
              PageOne(),
              ContainerWidget(),
              RowWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 100),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
                labelText: "Enter Username",
                prefixIcon: Icon(
                  Icons.ac_unit,
                ),
                border: OutlineInputBorder()),
            keyboardType: TextInputType.text,
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Enter email",
              prefixIcon: Icon(
                Icons.email,
              ),
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Enter Password",
              prefixIcon: Icon(
                Icons.password,
              ),
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.text,
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () => {},
            child: Text(
              "Login",
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.brown)),
          )
        ],
      ),
    );
  }
}
