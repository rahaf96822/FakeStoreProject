import 'package:flutter/material.dart';

import 'package:ecommerce/constant.dart';
import 'package:ecommerce/size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton ({
    Key key,
    this.text,
    this.press,
    this.color
  }) : super(key: key);
  final String text;
  final Function press;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(300),
      height: getProportionateScreenHeight(56),
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        //color: kPrimaryColor,
        color: color,
        textColor: Colors.white,
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white ,
            fontSize: getProportionateScreenWidth(18),
          ),
        ),
      ),
    );
  }
}