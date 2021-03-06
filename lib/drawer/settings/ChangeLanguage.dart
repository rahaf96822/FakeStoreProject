import 'file:///C:/Users/lenovo%20l340/AndroidStudioProjects/ecommerce/lib/constants/constant.dart';
//import 'package:ecommerce/screen_login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/app_language.dart';
class ChangeLanguage extends StatefulWidget {
  @override
  _ChangeLanguageState createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  String _selectedLangs = 'en';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        shadowColor: Colors.purple[200],
        leading:IconButton(
          icon: Icon(Icons.arrow_back , color: Colors.white,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Change Language'.tr,
          style: TextStyle(fontSize: 18),
        ),
      ),
      body:Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              // child: RoundedButton(
              //   text: "Arabic",
              //   color: SecondColor,
              //   textColor: Colors.white,
              //   press: () {
              //
              //   },
              // ),
              child: GetBuilder<AppLanguage>(
                init: AppLanguage(),
                builder: (controller){
                  return

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Language' ,style: TextStyle(fontSize: 20, color: Colors.black , fontWeight: FontWeight.bold),),
                        SizedBox(width: 20,),
                        DropdownButton(
                        items: [
                          DropdownMenuItem(child: Text('English') , value: 'en',),
                          DropdownMenuItem(child: Text('Arabic') , value: 'ar',),
                        ],
                        value: controller.appLocale,
                        onChanged: (value){
                          controller.changeLanguage(value);
                          Get.updateLocale(Locale(value));
                        },
                  ),
                      ],
                    );},
              ),
            ),
          ],
        ),
      ) ,
    );
  }
}
