import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce/constant.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);
  final String text,image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          "RFR",
          style: TextStyle(
              color: kPrimaryColor ,
              fontWeight: FontWeight.bold,
              fontSize: getProportionateScreenWidth(35)
          ),
        ),
        Text(text,
          textAlign:TextAlign.center,
        ),
        Spacer(flex: 2,),
        Image.asset(
          image,
          height: getProportionateScreenHeight(250),
          width: getProportionateScreenWidth(230),
        ),
      ],
    );
  }
}