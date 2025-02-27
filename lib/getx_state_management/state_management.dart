import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yash_batch/getx_state_management/statemenagement_controller.dart';

void main(){
  runApp(const LukkhaChorSRK());

}

class LukkhaChorSRK extends StatelessWidget {
  const LukkhaChorSRK({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Lukkha Chor Shah Rukh Khan worst actor',
      home: MyStateManagement(),
    );
  }
}

class MyStateManagement extends StatefulWidget {
  const MyStateManagement({super.key});

  @override
  State<MyStateManagement> createState() => _MyStateManagementState();
}

class _MyStateManagementState extends State<MyStateManagement> {

  final controller = Get.put(StatemanagementController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gutter jesi gandi shakal'),
      ),
      body: Column(
        children: [
          Center(child: Obx(()=> Text(controller.counter.toString()))),
          Obx(() => ListView.builder(
            itemCount: controller.motives.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Text(controller.motives[index].toString());
            },),)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.recycling),
        onPressed: () {
            controller.incrementCounter();
            controller.callApi();
      },),
    );
  }
}
