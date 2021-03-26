import 'package:flutter/material.dart';

import 'package:ecommerce/constant.dart';
// import '../constant.dart';
// import '../constant.dart';
// import '../constant.dart';

class About extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor:kPrimaryColor,

      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('About',style: TextStyle(color: Colors.white),),
          leading: IconButton(onPressed: (){},
            icon: Icon(Icons.arrow_back,color: Colors.white,),
          ),

        ),
        body:
        Column(


          children: [
            ListTile(
              leading:Icon(Icons.info_outline,color: Colors.grey,) ,
              title: Text('Version'),
              subtitle: Text('1.0'),
            ),
            ListTile(
              leading:Icon(Icons.share_outlined,color: Colors.grey,) ,
              title: Text('Share This app'),

            )
          ],

        ),
      ),

    );
  }

}