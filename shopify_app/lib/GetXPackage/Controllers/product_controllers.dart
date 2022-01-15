import 'package:get/get.dart';

import 'package:shopify_app/model/products_model.dart';
import 'package:shopify_app/services/remote_services.dart';

class ProductController extends GetxController {
//create isloding bool:
  var isLoading = true.obs;

  var productList = <Product>[].obs;

  //to get new products on initialization:
  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      //after we have fetched th products:
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
