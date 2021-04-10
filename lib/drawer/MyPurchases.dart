import 'file:///C:/Users/lenovo%20l340/AndroidStudioProjects/ecommerce/lib/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPurchases extends StatelessWidget {
  var now = DateTime.now();

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
            'My Purchases'.tr,
            style: TextStyle(fontSize: 18),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Card(
                child: ListTile(
                  leading: Icon(
                    IconData(62538, fontFamily: 'MaterialIcons'),
                    color: SecondColor,
                  ),
                  title: Text("Total:   100\$"),
                  subtitle: Text(
                    '$now',
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(
                    IconData(
                      62538,
                      fontFamily: 'MaterialIcons',
                    ),
                    color: SecondColor,
                  ),
                  title: Text('Total:   100\$'),
                  subtitle: Text(
                    '$now',
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(
                    IconData(62538, fontFamily: 'MaterialIcons'),
                    color: SecondColor,
                  ),
                  title: Text('Total:   100\$'),
                  subtitle: Text(
                    '$now',
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          backgroundColor: kPrimaryColor,
          onPressed: () {},
          child: new Icon(IconData(
            60269,
          )),
        ));
  }
}
