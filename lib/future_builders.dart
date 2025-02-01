// future builders
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// future builder is a widget that renders are the future function completed
// futures functions are the functions that return an output after a certain time

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: ActorList());
  }
}

class ActorList extends StatefulWidget {
  const ActorList({super.key});

  @override
  State<ActorList> createState() => _ActorListState();
}

class _ActorListState extends State<ActorList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Fuddu Public of Bollywood'),
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {

            if(snapshot.hasData){
              return ListView.builder(
                padding: const EdgeInsets.all(10),
                itemBuilder: (BuildContext context, int index) {
                  return Text(snapshot.data?[index],textAlign: TextAlign.center,);
                },
                itemCount: snapshot.data?.length,
              );
            }else{
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: CircularProgressIndicator()),
                  SizedBox(width: 10,),
                  Text("Loading...")
                ]
              );
            }


          },
        ));
  }
}

Future<List> getData() async{
  List list = [
    "Amir Khan",
    "Ajay Devgan",
    "the great Khan fuddu(Shah rukh khan) father of druggist and the great tatti eater",
    "Salman Khan",
    "fuddu don SRK wala",
    "Nokar charkar SRK",
    "Mannat ka pochewala"
    "Greatest Akshay Kumar"
    "Saif Ali Khan the great",
    "always the druggist aryan khan(child of the great tatti eater)"
  ];

  await Future.delayed(Duration(seconds: 5));

  return Future.value(list);
}
