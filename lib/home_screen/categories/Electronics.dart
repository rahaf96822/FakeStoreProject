import 'dart:math';

import 'package:ecommerce/api_manager/api_manager.dart';
import 'package:ecommerce/constant.dart';
import 'package:ecommerce/constants/strings.dart';
import 'file:///C:/Users/lenovo%20l340/AndroidStudioProjects/ecommerce/lib/home_screen/components/grid_view.dart';
import 'package:ecommerce/model/product.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
class ElectronicCategory extends StatefulWidget {
  @override
  _ElectronicCategoryState createState() => _ElectronicCategoryState();
}

class _ElectronicCategoryState extends State<ElectronicCategory> {
  Future<List<Product>> _products;
  @override
  void initState() {
    super.initState();

    _products = ApiManager().getProduct(Strings.electronicsCategoryName);
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
            return
              ProductGridView(
              products: snapshot.data,
            );
          }
          return Center(child: CircularProgressIndicator());
         //  return
         //  CircularStepProgressIndicator(
         //    totalSteps: 20,
         //    currentStep: 6,
         //    padding: pi / 15,
         //    selectedColor: Colors.cyan,
         //    unselectedColor: Colors.yellowAccent,
         //    selectedStepSize: 3.0,
         //    unselectedStepSize: 9.0,
         //    width: 25,
         //  );
        },
      ),
    );
  }
}
