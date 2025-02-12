import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../firebase_options.dart';
import '../authentication/register.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyCrud()
    );
  }
}

class MyCrud extends StatefulWidget {
  const MyCrud({super.key});

  @override
  State<MyCrud> createState() => _MyCrudState();
}

class _MyCrudState extends State<MyCrud> {

  void readData(){
    DatabaseReference starCountRef =
    FirebaseDatabase.instance.ref('users');
    starCountRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;

    });
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {

    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nalla Shah rukh Khan"),
      ),
      body: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Enter Name"
            ),
          ),
          TextField(
            controller: phoneController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter Phone Number"
            ),
          ),
          TextButton(onPressed: () async{
            DatabaseReference ref = FirebaseDatabase.instance.ref("users");

            await ref.update({
              "name": nameController.text,
              "phone": phoneController.text,
            });

          }, child: Text("Save User")),
          // Displaying user data here
          ListView.builder(
            shrinkWrap: true,
            itemCount: 2,itemBuilder: (context, index) {

          },)

        ],
      ),
    );
  }
}


