import 'package:flutter/material.dart';

void main() {
  runApp(CreateForm());
}

class CreateForm extends StatefulWidget {
  CreateForm({super.key});

  @override
  State<CreateForm> createState() => _CreateFormState();
}

class _CreateFormState extends State<CreateForm> {
  String? groupValue = "";
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  List<bool> hBool = [false, false, false, false];
  List<String> hobbies = ["Acting", 'Stardom', 'Knowledge', 'Reading'];

  String? selectedHobby = "";

  String result = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("Create Form of Dumbest Actor SRK"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "Gender (SRK gender not included)",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Row(children: [
                    RadioMenuButton(
                        value: "Male",
                        groupValue: groupValue,
                        onChanged: (value) {
                          setState(() {
                            groupValue = value;
                          });
                        },
                        child: Text("Male")),
                    RadioMenuButton(
                        value: "Female",
                        groupValue: groupValue,
                        onChanged: (value) {
                          setState(() {
                            groupValue = value;
                          });
                        },
                        child: Text("Female")),
                  ]),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "Hobbies (SRK Hobbies not included)",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: hBool[0],
                            onChanged: (value) {
                              setState(() {
                                hBool[0] = !hBool[0];
                              });
                            },
                          ),
                          Text(hobbies[0]),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: hBool[1],
                            onChanged: (value) {
                              setState(() {
                                hBool[1] = !hBool[1];
                              });
                            },
                          ),
                          Text(hobbies[1]),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: hBool[2],
                            onChanged: (value) {
                              setState(() {
                                hBool[2] = !hBool[2];
                              });
                            },
                          ),
                          Text(hobbies[2]),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: hBool[3],
                            onChanged: (value) {
                              setState(() {
                                hBool[3] = !hBool[3];
                              });
                            },
                          ),
                          Text(hobbies[3]),
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          String email= emailController.text;
                          String password = passwordController.text;
                          String? gender = groupValue;

                          String hobb = "";
                          for(int i=0; i<hBool.length; i++){
                            if(hBool[i]){
                              hobb = hobb +  hobbies[i];
                            }
                          }

                          result = email +"\n"+ password +"\n"+ gender! +"\n"+ hobb;
                        });

                      },
                      child: Text("Submit"),
                    ),
                  ),
                  Center(
                    child: Text(result),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
