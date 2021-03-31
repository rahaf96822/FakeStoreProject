import 'package:ecommerce/model/product.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final Function press;
  const ItemCard({
    Key key,
    this.product,
    this.press
  }) : super(key: key);
  //const ItemCard({Key :key}) : super(key: key)
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            height: 180,
            width: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                  image: NetworkImage(product.image),
                  fit: BoxFit.cover
              ),
            ),

          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Text(product.title, maxLines: 2,style: TextStyle(color: Colors.black26),
            ),),

          Text(product.price.toString()+'\$' , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.black),)
        ],
      ),
    );
  }
}
