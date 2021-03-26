import 'package:ecommerce/components/default_button.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/constant.dart';
import 'package:ecommerce/size_config.dart';
import 'package:get/get.dart';
class LoginSuccessScreen extends StatelessWidget {
  static  String routeName = '/login_success';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0 ,
        brightness: Brightness.light,
        title: Text("Login Success".tr,
          style: TextStyle(color: kTextColor ,
              //fontWeight: FontWeight.bold,
              fontSize: getProportionateScreenWidth(15)),
        ),
        leading: Icon(Icons.arrow_back_ios_rounded ,
          color: Colors.black,),
      ),
      body: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight*0.04,),
          Image.asset("assets/images/check.png" ,
              height: SizeConfig.screenHeight*0.4 //40%
          ),
          SizedBox(height: SizeConfig.screenHeight*0.08,),
          Text(
              "Login Success".tr ,
              style:
              TextStyle(
                  fontFamily: 'SFUIDisplay',
                  fontSize: getProportionateScreenWidth(30),
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
          ),
          Spacer(),
          SizedBox(
            width: SizeConfig.screenHeight*0.6,
            child: DefaultButton(
              text: "Back To Home",
              press: () {} ,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}