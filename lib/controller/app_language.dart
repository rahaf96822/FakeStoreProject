import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ecommerce/utils/local_storage/local_storage.dart';


class AppLanguage extends GetxController{
  var appLocale = 'en';
   @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    LocalStorage localStorage = LocalStorage();
   appLocale = await localStorage.languageSelected == null ?
   'en' : await localStorage.languageSelected;
    update();
   Get.updateLocale(Locale(appLocale));

  }

  void changeLanguage(String type) async{
     LocalStorage localStorage = LocalStorage();

     if(appLocale == type){
       return;}
     if(type == 'ar'){
       appLocale = 'ar';
       localStorage.saveLanguageToDisk('ar');
     }
     else{
       appLocale = 'en';
       localStorage.saveLanguageToDisk('en');
     }
     update();
  }
}