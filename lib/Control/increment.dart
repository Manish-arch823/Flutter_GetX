import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Getx type of controller in Reactive state management in getx ccontroller

class IncremantController extends GetxController {
  var count = 0.obs;
  void increment() {
    count++;
  }
}

class Incremant extends StatefulWidget {
  const Incremant({Key? key}) : super(key: key);

  @override
  State<Incremant> createState() => _IncremantState();
}

class _IncremantState extends State<Incremant> {
  IncremantController incremantController = Get.put(IncremantController());
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GetX<IncremantController>(
          init: IncremantController(),
          builder: (controller) {
            return Center(
                child: Text(
                    "The value is ${controller.count}and ${incremantController.count}"));
          },
        ),
        const SizedBox(
          height: 20.0,
        ),
        RaisedButton(onPressed: () {
          Get.find<IncremantController>().increment();
          incremantController.count();
        })
      ],
    );
  }
}

// Simple State Management
class DecremantController extends GetxController {
  var count = 0.obs;
  void decrement() {
    count--;
    update(['txtCount']);
  }

  @override
  void onInit() {
    print("Init Called");

    // 1. ever(count, (_) => print(count));
    // Called every time when the value of cont  varialbe changes

    // 2. everAll([count], (_) => print(count));
    // Called every time when the value of any varialbe from list changes

    // 3. once(count,(_)=>print(count));
    // Called only once when the   varialbe value changes

    // 4. debounce(count,()=>print("when the user stop typing for 1 sex the value of count ", time : Duration(seconds:1)))
    // called every timer the user stops ttyping for 1 second
    interval(count, (_) => print("Ignore all changes"),
        time: Duration(seconds: 3));
  }

  @override
  void onClose() {
    print("On Close Called");
    super.onClose();
  }
}

class Decrement extends StatefulWidget {
  const Decrement({Key? key}) : super(key: key);

  @override
  State<Decrement> createState() => _DecrementState();
}

class _DecrementState extends State<Decrement> {
  DecremantController decremantController = Get.put(DecremantController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<DecremantController>(
            init: DecremantController(),
            builder: (controller) {
              return Text(
                "The value is ${controller.count}and ${decremantController.count}",
                style: TextStyle(color: Colors.green),
              );
            }),
        SizedBox(
          height: 16,
        ),
        GetBuilder<DecremantController>(
            id: 'txtCount',
            // init: DecremantController(),
            builder: (controller) {
              return Text(
                "The value is and ${decremantController.count}",
                style: TextStyle(color: Colors.red),
              );
            }),
        SizedBox(
          height: 16,
        ),
        RaisedButton(onPressed: () {
          decremantController.decrement();
          Get.find<DecremantController>().decrement();
        })
      ],
    );
  }
}
