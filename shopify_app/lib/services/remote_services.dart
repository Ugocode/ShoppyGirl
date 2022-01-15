import 'package:http/http.dart' as http;
import 'package:shopify_app/model/products_model.dart';

class RemoteServices {
  static var httpClient = http.Client();

  //fetch data from the api
  static Future<List<Product>?> fetchProducts() async {
    String url =
        "http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline";
    var response = await httpClient.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonString = response.body;
//now return the product to the model:
      return productFromJson(jsonString);
    } else {
      //show error message
    }
    return null;
  }
}

//http://makeup-api.herokuapp.com/api/v1/products.json


//http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline