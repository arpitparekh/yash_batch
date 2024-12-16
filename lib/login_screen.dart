import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(LoginPage());
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Login Page",
              style: GoogleFonts.openSans(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
            backgroundColor: Colors.brown,
          ),
          body: Container(
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
          ),
        ));
  }
}
