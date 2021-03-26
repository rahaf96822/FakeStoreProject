import 'dart:ui';

import 'package:ecommerce/MyActivities.dart';
import 'package:ecommerce/MyPurchases.dart';
import 'package:ecommerce/My_Cart.dart';
import 'package:ecommerce/about.dart';
import 'package:ecommerce/constant.dart';
import 'package:ecommerce/settings/page_settings.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  static String routeName = "/drawer_screen";
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryLightColor,
      padding: EdgeInsets.only(bottom: getProportionateScreenHeight(50),left: getProportionateScreenWidth(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: getProportionateScreenHeight(40),),
          Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.settings,color: kPrimaryColor),
                title: Text("Setting",
                  style: TextStyle (
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    //fontsize
                  ),
                ),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageSettings()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.add_shopping_cart,color: kPrimaryColor),
                title: Text("My Cart",
                  style: TextStyle (
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    //fontsize
                  ),
                ),
                onTap:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Screen9()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.assignment_returned,color: kPrimaryColor),
                title: Text("My Purchases",
                  style: TextStyle (
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    //fontsize
                  ),
                ),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyPurchases()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.article,color: kPrimaryColor),
                title: Text("My Activities",
                  style: TextStyle (
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    //fontsize
                  ),
                ),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyActivities()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.warning_rounded,color: kPrimaryColor),
                title: Text("About",
                  style: TextStyle (
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    //fontsize
                  ),
                ),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => About()),
                  );
                },
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.logout ,
                color: kPrimaryColor,
              ),
              SizedBox(width: getProportionateScreenWidth(10),),
              Text("Log out" , 
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
