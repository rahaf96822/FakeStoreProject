
import 'package:ecommerce/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'logIn.dart';

class MyActivities extends StatefulWidget {
@override
_MyActivitiesState createState() => _MyActivitiesState();
}

class _MyActivitiesState extends State<MyActivities> {
var now = DateTime.now();
// var berlinWallFell = DateTime.utc(1989, 11, 9);
// var moonLanding = DateTime.parse("1969-07-20 20:18:04Z");
@override
Widget build(BuildContext context) {

  return Scaffold(
    appBar: AppBar(
        backgroundColor: FirstColor,
        shadowColor: Colors.purple[200],
        leading: IconButton(icon: Icon(Icons.arrow_back_rounded),
      // onPressed: ()  {Get.to(Login());},
    ),
        title: Text('My Activities',style: TextStyle(fontSize: 18),),
    ),
    body: Padding(
      padding: const EdgeInsets.all(15.0),
        child: Column(children: [
      // Card(name: 'buy 3 products', Ico:Icons.add_to_photos,),
            Card(name: 'Change Password', Ico:Icons.input,),
            Card(name: 'buy 1 products', Ico:Icons.add_to_photos,),
            Card(name: 'buy 2 products', Ico:Icons.add_to_photos,),
            ],),
      ),
    );
    }
    }

class Card extends StatelessWidget {
    var now = DateTime.now();
    String name;
    IconData Ico;

  Card({Key key, @required this.name, @required this.Ico,}) : super(key: key);
@override
Widget build(BuildContext context) {
    return ListTile(
        leading:Icon(Ico , color: SecondColor,),
        title: Text(name),
        subtitle: Text('$now',style: TextStyle(fontSize: 12,color:Colors.grey),),
        );
  }
  }