import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:yash_batch/firebase/realtime_database/user.dart';
import '../../firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirebaseCrud()
    );
  }
}

class FirebaseCrud extends StatefulWidget {
  const FirebaseCrud({super.key});

  @override
  State<FirebaseCrud> createState() => _FirebaseCrudState();
}

class _FirebaseCrudState extends State<FirebaseCrud> {

  late TextEditingController nameController;
  late TextEditingController phoneNumberController;

  List<UserData> userDataList = [];

  void readData() async{
    DatabaseReference ref = FirebaseDatabase.instance.ref("users");
    ref.onValue.listen((snapshot) {

      userDataList.clear();

      for(var child in snapshot.snapshot.children) {

        Map<Object?, Object?> data = child.value as Map<Object?, Object?>;

        UserData user = UserData(
          key : child.key,
          name : data["name"] as String ,
          phone_number : data["phone_number"] as String ,
        );
        userDataList.add(user);
      }
    });

    setState(() {

    });

  }

  @override
  void initState() {

    nameController =   TextEditingController();
    phoneNumberController = TextEditingController();
    readData();

  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase CRUD'),
      ),
      body: Column(
        children: [
          TextField(
            controller: nameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Name',

            ),
          ),
          TextField(
            controller: phoneNumberController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Phone Number',

            ),

          ),
          TextButton(onPressed: () {

            DatabaseReference ref = FirebaseDatabase.instance.ref("users");

            DateTime dt = DateTime.now();
            ref.child(dt.microsecondsSinceEpoch.toString()).set(
              {
                'name': nameController.text,
                'phone_number': phoneNumberController.text,
              }
            );

          }, child: Text("Submit")),
          ListView.builder(
            shrinkWrap: true,
            itemCount: userDataList.length,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text(userDataList[index].name!),
                  Text(userDataList[index].phone_number!),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          DatabaseReference ref = FirebaseDatabase.instance.ref("users");
                          ref.child(userDataList[index].key!).remove();
                          readData();
                        },
                        icon: Icon(Icons.delete),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.edit),
                      )
                    ],
                  )

                ],
              );
          },)

        ],
      )
    );
  }
}
