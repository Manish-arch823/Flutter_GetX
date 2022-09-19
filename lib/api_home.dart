import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_learning/Control/controller.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'Control/controller_binding.dart';

class Api_Home extends StatelessWidget {
  const Api_Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialBinding: ControllerBindings(), home: api_data());
  }
}

class api_data extends StatelessWidget {
  api_data({Key? key}) : super(key: key);
  // final _controller = Get.find<Controller_api>();
  final _controller = Get.put(Controller_api());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return _controller.isloading.value
          ? CircularProgressIndicator()
          : Scaffold(
              body: Center(
                  child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("AlubmID : ${_controller.photoList[0].albumId} "),
                Text("ID: ${_controller.photoList[0].id}"),
                Text("title: ${_controller.photoList[0].title} "),
                Image.network("${_controller.photoList[0].thumbnailUrl}")
              ],
            )));
    });
  }
}
