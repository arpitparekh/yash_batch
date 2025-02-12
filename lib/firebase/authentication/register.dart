import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yash_batch/firebase/authentication/login.dart';

import '../../firebase_options.dart';

late final FirebaseApp app;
late final FirebaseAuth auth;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  auth = FirebaseAuth.instanceFor(app: app);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home : RegisterPage()
    );
  }
}


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),
          ElevatedButton(onPressed: () async {

            try {
              final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: emailController.text,
                password: passwordController.text ,
              );
            } on FirebaseAuthException catch (e) {
              if (e.code == 'weak-password') {

                const snackBar = SnackBar(
                  content: Text('Weak Password'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);

              } else if (e.code == 'email-already-in-use') {
                const snackBar = SnackBar(
                  content: Text('Email Already IN Use'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            } catch (e) {
              print(e);
            }

            const snackBar = SnackBar(
              content: Text('Register Successfully'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);

            Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPageNew()));

          }, child: const Text("Register")),
          const Text("Already have an account? Login")
        ]
      ),
    );
  }
}

