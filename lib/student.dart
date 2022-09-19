import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Student {
  var name = "Manish".obs;
  var age = 25.obs;
}

class Student_2_Constrater {
  var name;
  var age;
  Student_2_Constrater({this.name, this.age});
}

class StudentMainClass extends StatelessWidget {
  var students = Student();
  StudentMainClass({Key? key}) : super(key: key);
  final Student_Constrater = Student_2_Constrater(name: "manish", age: 25).obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(() => Text(
              "Name is ${students.name.value} and construct ${Student_Constrater.value.name}",
            )),
        SizedBox(height: 20),
        RaisedButton(onPressed: () {
          students.name.value = students.name.value.toUpperCase();
          Student_Constrater.update((Student_Constrater) {
            Student_Constrater!.name =
                Student_Constrater.name.toString().toUpperCase();
          });
        })
      ],
    );
  }
}
