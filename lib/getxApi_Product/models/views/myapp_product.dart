import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/route_manager.dart';
import 'package:getx_learning/getxApi_Product/commonModel/AppString.dart';
import 'package:getx_learning/getxApi_Product/models/views/product_list_view.dart';

import '../../commonModel/Appcolor.dart';

class Myapp_product extends StatefulWidget {
  const Myapp_product({Key? key}) : super(key: key);

  @override
  State<Myapp_product> createState() => _Myapp_productState();
}

class _Myapp_productState extends State<Myapp_product> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: AppString.fetchApiData,
        theme: ThemeData(
          primarySwatch: Appcolor.purpleColor,
        ),
        home: ProductListView());
  }
}
