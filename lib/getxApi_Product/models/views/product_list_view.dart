// import 'dart:html';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_learning/getxApi_Product/commonModel/AppString.dart';

import '../../commonModel/Appcolor.dart';
import '../controllers/product_Controler.dart';
import 'package:http/http.dart' as http;

class ProductListView extends StatelessWidget {
  final ProductControler productControler = Get.put(ProductControler());
  ProductListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.productList),
      ),
      body: Obx(() {
        if (productControler.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: productControler.productList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 150,
                        height: 100,
                        margin: EdgeInsets.fromLTRB(16, 8, 8, 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            productControler.productList[index].imageLink!,
                            width: 150,
                            height: 100,
                            fit: BoxFit.fill,
                            color: Appcolor.purpleColor,
                            colorBlendMode: BlendMode.color,
                          ),
                        ),
                      ),
                      Flexible(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${productControler.productList[index].name}",
                            style:
                                TextStyle(fontSize: 14, color: Appcolor.grey),
                          ),
                          Text("${productControler.productList[index].brand}",
                              style: TextStyle(
                                  fontSize: 14, color: Appcolor.grey)),
                          Text(
                              "${productControler.productList[index].category}",
                              style: TextStyle(
                                  fontSize: 14, color: Appcolor.grey)),
                        ],
                      ))
                    ],
                  ),
                  Container(
                    color: Appcolor.grey200,
                    height: 2,
                  )
                ],
              );
            },
          );
        }
      }),
    );
  }
}
