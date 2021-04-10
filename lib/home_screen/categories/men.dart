import 'package:ecommerce/api_manager/api_manager.dart';
import 'package:ecommerce/constants/strings.dart';
import 'file:///C:/Users/lenovo%20l340/AndroidStudioProjects/ecommerce/lib/home_screen/components/grid_view.dart';
import 'package:ecommerce/model/product.dart';

import 'package:flutter/material.dart';



class MenCategory extends StatefulWidget {
  @override
  _MenCategoryState createState() => _MenCategoryState();
}

class _MenCategoryState extends State<MenCategory> {
  Future<List<Product>> _products;
  @override
  void initState() {
    super.initState();

    _products = ApiManager().getProduct(Strings.menCategoryName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _products,
        builder: (ctx, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          } else if (snapshot.hasData) {
            return ProductGridView(
              products: snapshot.data,
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}