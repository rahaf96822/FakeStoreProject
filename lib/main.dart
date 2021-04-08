import 'package:ecommerce/constant.dart';
import 'package:ecommerce/model/cart.dart';
import 'package:ecommerce/routs.dart';
import 'package:ecommerce/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/welcome_screen.dart';
import 'package:get/get.dart';
import 'package:ecommerce/translation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: WelcomeScreen(),
//   ));
// }
void main() async{
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider(
        create:(ctx)=>Cart(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            textTheme: TextTheme(
                bodyText1: TextStyle(color: kTextColor),
                bodyText2: TextStyle(color: kTextColor)
            )
        ),
        initialRoute: SplashScreen.routeName,
        //home:WelcomeScreen() ,
        routes: routes,
        translations: Translation(),
        locale: Locale('en'),
        fallbackLocale: Locale('en'),
      ),
    );
  }
}

