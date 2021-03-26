
import 'package:flutter/material.dart';

Color kPrimaryColor  = Color(0xFF6F35A5);
Color SecondColor = Colors.purple[700];
Color kPrimaryLightColor  = Colors.deepPurple[100];

const kTextColor = Color(0xFF754545); //grey[600]
const kAnimationDuration = Duration(milliseconds: 200);
final RegExp emailValidationRegExp =
RegExp(r"^[a-zA-Z0-9,]+@[a-zA-Z0-9]+\.[a-zA-Z]+") ;
const String kEmailNullError = "Please enter your email" ;
const String kInvalidEmailError = "Please enter valid email" ;
const String kPassNullError = "Please enter your password" ;
const String kShortPassError = "Password is too short" ;
const String kMatchPassError = "Passwords don't match" ;
const String kNameNullError = "Please enter your name" ;
const String kPhoneNumberNullError = "Please enter your phone number" ;
const String kAddressNullError = "Please enter your address" ;