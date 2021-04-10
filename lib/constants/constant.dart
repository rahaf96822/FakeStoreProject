
import 'package:flutter/material.dart';
import 'package:get/get.dart';
Color kPrimaryColor  = Color(0xFF6F35A5);
Color SecondColor = Colors.purple[700];
Color kPrimaryLightColor  = Colors.deepPurple[100];

const kTextColor = Color(0xFF754545); //grey[600]
const kAnimationDuration = Duration(milliseconds: 200);
final RegExp emailValidationRegExp =
RegExp(r"^[a-zA-Z0-9,]+@[a-zA-Z0-9]+\.[a-zA-Z]+") ;
 String kEmailNullError = "Please enter your email".tr ;
 String kInvalidEmailError = "Please enter valid email".tr ;
 String kPassNullError = "Please enter your password".tr ;
 String kShortPassError = "Password is too short".tr ;
 String kMatchPassError = "Passwords don't match".tr ;
 String kNameNullError = "Please enter your name".tr ;
 String kPhoneNumberNullError = "Please enter your phone number".tr ;
 String kAddressNullError = "Please enter your address".tr ;