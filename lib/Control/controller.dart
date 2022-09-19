import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_learning/model/album_model.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart' as http;
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/route_manager.dart';

class Controller_api extends GetxController {
  var photoList = <AlbumModel>[].obs;
  var isloading = true.obs;
  @override
  void onInit() {
    super.onInit();
    fetchAlbumdata();
  }

  Future<void> fetchAlbumdata() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos/50"));

    if (response.statusCode == 200) {
      AlbumModel _albumModel = AlbumModel.fromJson(jsonDecode(response.body));
      photoList.add(AlbumModel(
          title: _albumModel.title,
          url: _albumModel.url,
          thumbnailUrl: _albumModel.thumbnailUrl,
          id: _albumModel.id,
          albumId: _albumModel.albumId));
      isloading.value = false;
      update();
    } else {
      Get.snackbar("Error loading data",
          "Server responded ${response.statusCode}:${response.reasonPhrase.toString()}");
    }
  }
}
