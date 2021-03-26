import 'dart:convert';
import 'package:http/http.dart';
import 'package:ecommerce/model/product.dart';
class HttpService {
  final String productUrl = 'https://fakestoreapi.com/products';

  Future<List<Product>> getProduct() async {
    Response res = await get(productUrl);

    if(res.statusCode == 200)
      {
        List<dynamic> body = jsonDecode(res.body);

        List<Product> products=
            body.map((dynamic item) => Product.fromJson(item)).toList();

        return products;
      }else{
      throw "Can't get products.";
    }
  }
}