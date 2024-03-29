import 'package:get/get.dart';

import 'package:shoppy_girl/model/products_model.dart';
import 'package:shoppy_girl/services/remote_services.dart';

class ProductController extends GetxController {
//create isloding bool:
  var isLoading = true.obs;

  var productList = <Product>[].obs;

  var cartList = [].obs;

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
      //after we have fetched the products:
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
