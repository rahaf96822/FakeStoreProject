import 'file:///C:/Users/lenovo%20l340/AndroidStudioProjects/ecommerce/lib/drawer/MyActivities.dart';
import 'file:///C:/Users/lenovo%20l340/AndroidStudioProjects/ecommerce/lib/constants/constant.dart';
import 'package:ecommerce/controller/app_language.dart';
import 'package:ecommerce/drawer/settings/ChangePassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/drawer/settings/ChangeLanguage.dart';
class PageSettings extends StatefulWidget {
  @override
  _PageSettingsState createState() => _PageSettingsState();
}

class _PageSettingsState extends State<PageSettings> {
  String _selectedLangs = 'en';
  // void _ChangeLang(BuildContext context)
  // {
  //   AlertDialog(
  //     content: Text(
  //         "Change Language"),
  //     actions: <Widget>[
  //       FlatButton(
  //         child: Text("English"),
  //         onPressed: () => Navigator.of(context).pop(false),
  //         textColor: Colors.black,
  //       ),
  //       FlatButton(
  //         child: Text("Arabic"),
  //         textColor: Colors.red,
  //         onPressed: () => Navigator.pop(context, true),
  //       ),
  //     ],
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 5.0,
        shadowColor: Colors.purple[200],
        title: Text('My Cart', style: TextStyle(fontSize: 20 , color: Colors.white , fontWeight: FontWeight.bold),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back , color: Colors.white,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 30.0,),
            Text('General Settings' , style: TextStyle(color: SecondColor, fontWeight: FontWeight.bold , fontSize: 30.0) , textDirection: TextDirection.ltr, textAlign: TextAlign.start,),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5.0,
                shadowColor: kPrimaryLightColor,
                margin: EdgeInsets.all(3),
                //clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  leading: Icon(Icons.lock , color: kPrimaryColor,),
                  title: Text('Change Password'.tr , style: TextStyle(fontSize: 18),),
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_forward_ios , color: kPrimaryColor,),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePassword()));
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8.0,),
            //Divider(color: kPrimaryColor,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5.0,
                shadowColor: kPrimaryLightColor,
                margin: EdgeInsets.all(3),
                //clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  leading: Icon(Icons.language , color: kPrimaryColor,),
                  title: Text('Change Language'.tr , style: TextStyle(fontSize: 18),),
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_forward_ios , color: kPrimaryColor,),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>ChangeLanguage()
                          // builder: (context)=>GetBuilder<AppLanguage>(
                          //   init: AppLanguage(),
                          //     builder: (controller){
                          //     return DropdownButton(
                          //         items: [
                          //           DropdownMenuItem(child: Text('en') , value: 'en',),
                          //           DropdownMenuItem(child: Text('ar') , value: 'ar',),
                          //         ],
                          //         value: controller.appLocale,
                          //         onChanged: (value){
                          //           controller.changeLanguage(value);
                          //           Get.updateLocale(Locale(value));
                          //         },
                          //     );
                          //     })
                      ));
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
