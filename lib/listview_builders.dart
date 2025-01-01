import 'package:flutter/material.dart';

void main() {
  runApp(MyListView());
}

class MyListView extends StatelessWidget {

  const MyListView({super.key});

  
  @override
  Widget build(BuildContext context) {

    var list = ["Amir Khan","Ajay Devgan","the great Khan fuddu(Shah rukh khan) father of druggist","Salman Khan","SaifAli Khan the great","always the drugist aryan khan"];
    var images = [
        "https://in.bmscdn.com/iedb/artist/images/website/poster/large/aamir-khan-42-20-12-2017-04-51-55.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5A-2DVFWigJR8IDKycpwKnfn2KYBe_hdMtA&s",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRl5dEW9LoxfnJDo0Bc5e5tP11VwXk4Y-djSEXWMb0xB6QFIorah0qq-PeNDSwFMCFX_i4&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTN9NShuPDUQANXTUDJ90ikqaN-1x_YtbKcJQ&s",
      "https://swarajya.gumlet.io/swarajya/2023-06/3d6f574b-ba37-4d95-9980-df26bcce895a/IMG_8973.jpeg?w=610&q=50&compress=true&format=auto",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFlvBnjHMhv6oaCKR9-nSSTPr9jDKBthEMKQ&s"
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Worst Actor Panel list"),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Column(
                  children: [
                    index ==2 || index==5 ? Image.network(images[index],height: 500,width: 500,fit: BoxFit.fill,) :
                    Image.network(images[index],height: 300,width: 300,),
                    Text(list[index],
                    style: TextStyle(
                      fontSize: 30
                    ),)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
