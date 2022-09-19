import 'package:get/state_manager.dart';

import '../../api_Model/api_model.dart';
import '../models/product_models.dart';

class ProductControler extends GetxController {
  var isLoading = true.obs;
  var productList = <ProductModel>[].obs;
  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await ApiServiceproduct.fetchProducts();
      if (products != null) {
        productList.assignAll(products);
      }
    } finally {
      isLoading(false);
    }
  }
}
