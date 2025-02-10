import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPageNew extends StatefulWidget {
  const LoginPageNew({super.key});

  @override
  State<LoginPageNew> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPageNew> {


  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
        ),
        body: Column(children: [
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                try {
                  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text
                  );

                  const snackBar = SnackBar(
                    content: Text('Login Successfull'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);

                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    const snackBar = SnackBar(
                      content: Text('User Not Found'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else if (e.code == 'wrong-password') {
                    const snackBar = SnackBar(
                      content: Text('Wrong password'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                }
              },
              child: Text(
                "Login",
              ))
        ]));
  }
}
