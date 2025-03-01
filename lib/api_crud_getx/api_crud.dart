import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'api_crud_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
        debugShowCheckedModeBanner: false, home: ApiCalling());
  }
}

class ApiCalling extends StatefulWidget {
  const ApiCalling({super.key});

  @override
  State<ApiCalling> createState() => _ApiCallingState();
}

class _ApiCallingState extends State<ApiCalling> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();
  TextEditingController quantitycontroller = TextEditingController();

  final controller = Get.put(MyApiController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('For the Worst Fan Api Calling'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Product Name',
                    border: OutlineInputBorder(),
                  ),
                  controller: namecontroller,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Product quantity',
                    border: OutlineInputBorder(),
                  ),
                  controller: quantitycontroller,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Product price',
                    border: OutlineInputBorder(),
                  ),
                  controller: pricecontroller,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                ElevatedButton(onPressed: () {
                  controller.addProduct(
                    namecontroller.text.toString(),
                    int.parse(quantitycontroller.text.toString()),
                    int.parse(pricecontroller.text.toString()),
                  );
                  namecontroller.clear();
                  pricecontroller.clear();
                  quantitycontroller.clear();
                }, child: const Text("Add Product")),
                const SizedBox(
                  height: 10.0,
                ),
                Text("Product List",textAlign: TextAlign.center,),
                Obx(
                  () => ListView.builder(
                    itemCount: controller.products.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Text(controller.products[index].toString()),
                          Divider(
                            color: Colors.black,)
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
