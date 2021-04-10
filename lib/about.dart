import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/constant.dart';

class About extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar:  AppBar(
        backgroundColor: kPrimaryColor,
        shadowColor: Colors.purple[200],
        leading: IconButton(
          icon: Icon(Icons.arrow_back , color: Colors.white,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text('About'.tr,style: TextStyle(fontSize: 18),),
      ),
      body: Column(
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
    );
  }

}