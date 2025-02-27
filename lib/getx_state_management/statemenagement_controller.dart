import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:yash_batch/getx_state_management/motive.dart';

class StatemanagementController extends GetxController{
  var counter = 0.obs;
  RxList<Motive> motives = <Motive>[].obs;
  String url = "https://gomezmig03.github.io/MotivationalAPI/en.json";

  void incrementCounter(){
    counter.value++;
  }

  void callApi(){
    http.get(Uri.parse(url)).then((response) {
      if (response.statusCode == 200) {
        // print(json.decode(response.body));

        List<dynamic> jsonList = json.decode(response.body);

        motives.value = jsonList.map((json) => Motive.fromJson(json)).toList();

      } else {

      }
    }).then((data) => {
      // print("Data : ${data}")
    }).catchError((error) {
      print('Error getting data: $error');
    });
  }

}