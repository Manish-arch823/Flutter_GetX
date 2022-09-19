import 'package:get/instance_manager.dart';
import 'package:getx_learning/Control/controller.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<Controller_api>(Controller_api());
  }
}
