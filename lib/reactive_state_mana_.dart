import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReactiveStateManagement extends StatelessWidget {
  var count = 0.obs;
  void increment() {
    count++;
  }

  ReactiveStateManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => Center(
              child: Text(
                "Count value is $count",
                style: const TextStyle(fontSize: 25),
              ),
            )),
        const SizedBox(
          height: 16,
        ),
        RaisedButton(
            child: Text("Increment"),
            onPressed: () {
              // if (count != 0) {
              increment();
            }),
        RaisedButton(
            child: Text("Decrement"),
            onPressed: () {
              if (count == 0) {
                Get.snackbar("Decrement", "You cant  Count value is 0");
              } else {
                count--;
              }
            }),
      ],
    );
  }
}
