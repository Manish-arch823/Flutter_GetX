import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_learning/student.dart';

import 'Control/increment.dart';
import 'api_home.dart';
import 'getxApi_Product/models/views/myapp_product.dart';
import 'message.dart';
import 'page_1.dart';
import 'reactive_state_mana_.dart';

void main() {
  runApp(
      // Home_page()
      // MyApp());
      // Api_Home());
      Myapp_product());
  // const Message_Display());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // StudentMainClass
      getPages: [
        GetPage(name: '/', page: () => Home_page()),
        GetPage(name: '/first_Page/:id', page: (() => page_1())),
        GetPage(name: '/Second_Page/:id', page: (() => page_2())),
        GetPage(name: '/three_Page', page: (() => page_3())),
        GetPage(name: '/StudentMainClass', page: (() => StudentMainClass())),
        GetPage(name: '/Api_Home', page: (() => Api_Home())),
        GetPage(
            name: '/ReactiveStateManagement',
            page: (() => ReactiveStateManagement())),
        GetPage(name: '/Message_Display', page: (() => Message_Display()))
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          // Decrement()
          //  Incremant(),
          Home_page(),
    );
  }
}

class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () async {
                  Get.toNamed('/first_Page/123', arguments: "Page no 1");
                },
                child: const Text("Page One")),
            TextButton(
                onPressed: () async {
                  Get.toNamed("/Second_Page/id=5566", arguments: "Page no 2");
                },
                child: const Text("Page Two")),
            TextButton(
                onPressed: () async {
                  Get.toNamed("/three_Page");
                },
                child: const Text("Page Three")),
            TextButton(
                onPressed: () async {
                  Get.toNamed("/ReactiveStateManagement");
                },
                child: const Text("ReactiveStateManagement Example")),
            TextButton(
                onPressed: () async {
                  Get.toNamed("/StudentMainClass");
                },
                child: const Text("StudentMainClass Example")),
            TextButton(
                onPressed: () async {
                  Get.toNamed("/Message_Display");
                },
                child: const Text("Message_Display Example")),
            // TextButton(
            //     onPressed: () async {
            //       Get.toNamed("/Api_Home");
            //     },
            //     child: const Text("Api_Home Example"))
          ],
        ),
      ),
    );
  }
}
