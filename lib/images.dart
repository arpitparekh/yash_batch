import 'package:flutter/material.dart';
import 'package:user_profile_avatar/user_profile_avatar.dart';

void main() {
  runApp(ImageWidgets());
}

class ImageWidgets extends StatelessWidget {
  const ImageWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
          
            children: [
              Center(
                child: Image.network(
                  "https://img.bleacherreport.net/img/images/photos/003/024/286/7a4331bc9347e25b9c9a3078593fbf20_crop_north.jpg?1408421212&w=3072&h=2048",
                  height: 200,
                  width: 200,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Brock Lesner gave 17 Suplexes to John Cena to show him he is the worst of all the time in history of not just wwe in wwf also and in the whole universe and every parrellel universe known and unknown to mankind!"),
              Image.asset(
                "assets/images/worst_cena.jpg", // Correct the extension
                height: 300,
                width: 300,
                
              ),
              UserProfileAvatar(
                avatarUrl: 'https://picsum.photos/id/237/5000/5000',
                onAvatarTap: () {
                  print('Aur ek Suplex Dedo');
                },
                avatarSplashColor: Colors.purple,
                radius: 100,
                isActivityIndicatorSmall: false,
                avatarBorderData: AvatarBorderData(
                  borderColor: Colors.white,
                  borderWidth: 5.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
