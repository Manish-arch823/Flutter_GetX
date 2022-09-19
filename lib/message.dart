import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          "hello": 'Hello',
        },
        'hi_IN': {
          "hello": "hindi",
        },
        'fr_FR': {
          "hello": "Bonjour",
        }
      };
}

class messageController extends GetxController {
  void changeController(param1, param2) {
    var locale = Locale(param1, param2);
    Get.updateLocale(locale);
  }
}

class Message_Display extends StatefulWidget {
  const Message_Display({Key? key}) : super(key: key);

  @override
  State<Message_Display> createState() => _Message_DisplayState();
}

class _Message_DisplayState extends State<Message_Display> {
  messageController mymessageController = Get.put(messageController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        translations: Messages(),
        locale: Locale('en', 'US'),
        fallbackLocale: Locale('en', 'US'),
        title: "Internationalization",
        home: Scaffold(
          appBar: AppBar(title: Text("Internationallization")),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'hello'.tr,
                  style: TextStyle(fontSize: 25, color: Colors.green),
                ),
                RaisedButton(
                    child: Text("Hindi".tr),
                    onPressed: () {
                      // myController.changeLanguage('')
                      mymessageController.changeController('hi', 'IN');
                    }),
                RaisedButton(
                    child: Text("Franch".tr),
                    onPressed: () {
                      // myController.changeLanguage('')
                      mymessageController.changeController('fr', 'FR');
                    }),
                RaisedButton(
                    child: Text("English".tr),
                    onPressed: () {
                      // myController.changeLanguage('')
                      mymessageController.changeController('en', 'US');
                    })
              ],
            ),
          ),
        ));
  }
}
