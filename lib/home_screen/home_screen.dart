import 'package:ecommerce/constant.dart';
import 'package:ecommerce/home_screen/components/body.dart';
import 'package:ecommerce/home_screen/components/categories.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home_screen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0; // when I press on menu this value will change because I am gonna toggle this value
  double yOffset = 0; // I get some offset from x--axis as well as y-axis
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: AnimatedContainer(
        //color: Colors.white,
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(scaleFactor)..rotateY(isDrawerOpen?0.5:0),
        // this take up as matrix for dot translation values
        // how I want my container to be shifted translation .. moving from one place to another
        duration: Duration(milliseconds: 250),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(isDrawerOpen?40:0.0),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200],
                ),
                margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(3) ,
                    vertical: getProportionateScreenHeight(1),
                ),
                child: Row(
                  children: [
                     isDrawerOpen?IconButton(
                    icon: Icon(Icons.arrow_back_ios_rounded , size: 20,color: kPrimaryColor,),
                    onPressed: () {
                      setState(() {
                        xOffset =0;
                        yOffset =0;
                        scaleFactor =1;
                        isDrawerOpen =false;
                      });
                    },
                  ): IconButton(
                      icon: Icon(Icons.menu , color: kPrimaryColor,),
                      onPressed: () {
                        setState(() {
                          xOffset = 230;
                          yOffset = 150;
                          scaleFactor = 0.6;
                          //wherever what I want to do .. when this button will be clicked the xOffset will be 230 ...
                          // the screen will convert itself to 60% of the original value
                          isDrawerOpen = true;
                        });
                      }),
                    SizedBox(width: getProportionateScreenWidth(10),),
                    Text("Product by categories",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                    ),
                  ],
                ),
              ),
              //Categories(),
              Body()
            ],
          ),
        ),
      ),
    );
  }
}
