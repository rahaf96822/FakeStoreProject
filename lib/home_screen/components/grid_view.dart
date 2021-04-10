import 'package:ecommerce/home_screen/components/item_card.dart';
import 'package:ecommerce/home_screen/components/product_details.dart';
import 'package:ecommerce/model/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductGridView extends StatefulWidget {
  final List<Product> products;

  ProductGridView({this.products});

  @override
  _ProductGridViewState createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductGridView> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: GridView.builder(
        itemCount: widget.products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.70
        ),

          itemBuilder: (context , index) =>ItemCard(
              product: widget.products[index],
              press: ()=> Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) => ProductDetails(product: widget.products[index],)),
              ))
      ),
    );
  }
}