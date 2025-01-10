import "package:flutter/material.dart";
// "https://api.dictionaryapi.dev/api/v2/entries/en/fart"
import 'package:http/http.dart' as http;

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dictionary App',
      debugShowCheckedModeBanner: false,
      home: ApiPage(),
    );
  }
}

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {

  TextEditingController controller=TextEditingController();
  String data = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gutter is better then SRK"),
        centerTitle: true,
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Enter a word',
                  border: OutlineInputBorder(
        
                  )
                ),
              ),
            ),
            ElevatedButton(onPressed: () {
              fetchData();
            }, child: Text("SRK is cow's dung")),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(data,textAlign: TextAlign.center,),
            )
          ],
        ),
      )
    );
  }

  void fetchData() {

    final String url = "https://api.dictionaryapi.dev/api/v2/entries/en/${controller.text}";
    http.get(Uri.parse(url)).then((response) {
      setState(() {

        data = response.body;
      });
    });

  }
}


