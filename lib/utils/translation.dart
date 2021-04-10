import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ecommerce/utils/langs/ar.dart';
import 'package:ecommerce/utils/langs/en.dart';

class Translation extends Translations{
  @override
  Map<String , Map<String , String>> get keys => {
    'ar' : ar,
    'en' : en
  };
}