import 'package:ecommerce/constant.dart';
import 'package:ecommerce/home_screen/components/categories.dart';
import 'package:ecommerce/home_screen/components/shop_card.dart';
import 'package:ecommerce/model/product.dart';

import 'package:flutter/material.dart';


class Body extends StatelessWidget {
  // final HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        //Padding(padding: EdgeInsets.only(top:20.0)),
        Categories(),
        // Expanded(
        //   child: GridView.builder(
        //     itemCount: products.length,
        //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //         crossAxisCount:1,
        //         mainAxisSpacing: 20,
        //         childAspectRatio: 1.65
        //       ),
        //       itemBuilder: (context , index) => ShopCard()),
        // )
       ShopCard()
      ],
    );
  }
}



