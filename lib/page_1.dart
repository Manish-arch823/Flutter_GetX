import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class page_1 extends StatefulWidget {
  page_1({Key? key}) : super(key: key);

  @override
  State<page_1> createState() => _page_1State();
}

class _page_1State extends State<page_1> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
          backgroundColor: Colors.green,
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Center(child: Text("I am  page first ")),
            Center(child: Text("I am ${Get.parameters['id']} manish "))
          ])),
    );
  }
}

class page_2 extends StatefulWidget {
  page_2({Key? key}) : super(key: key);

  @override
  State<page_2> createState() => _page_2State();
}

class _page_2State extends State<page_2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Column(
        children: [
          const Center(
            child: Text("I am  page Seconds "),
          ),
          Center(child: Text("I am ${Get.parameters['id']}"))
        ],
      ),
    );
  }
}

class page_3 extends StatefulWidget {
  page_3({Key? key}) : super(key: key);

  @override
  State<page_3> createState() => _page_3State();
}

class _page_3State extends State<page_3> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Text("I am  page Three "),
      ),
    );
  }
}
