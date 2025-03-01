import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:yash_batch/api_crud_getx/product.dart';

class MyApiController extends GetxController {
  final url = "https://66e8fa6087e417609447a69f.mockapi.io/v1/product";
  RxList<Product> products = <Product>[].obs;

  void getAllProduct() {
    http.get(Uri.parse(url)).then((response) {
      if (response.statusCode == 200) {
        List<dynamic> jsonList = json.decode(response.body);
        products.value =
            jsonList.map((json) => Product.fromJson(json)).toList();
      }
    });
  }

  void addProduct(String name, int quantity, int price) {
    http.post(
      Uri.parse(url),
      body: jsonEncode({"name": name, "quantity": quantity, "price": price}),
      headers: {
        "Content-Type": "application/json", // Specify JSON format
      },
    ).then((response) => {
          if (response.statusCode == 201) {getAllProduct()}
        });
  }
}
