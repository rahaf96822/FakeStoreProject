import 'package:ecommerce/constant.dart';
import 'package:ecommerce/settings/ChangePassword.dart';
import 'package:flutter/material.dart';

class PageSettings extends StatefulWidget {
  @override
  _PageSettingsState createState() => _PageSettingsState();
}

class _PageSettingsState extends State<PageSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: FirstColor,
        elevation: 5.0,
        shadowColor: Colors.purple[200],
        title: Text('My Cart', style: TextStyle(fontSize: 20 , color: Colors.white , fontWeight: FontWeight.bold),),
        leading: Icon(Icons.arrow_back , color: Colors.white,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 30.0,),
            Text('General Settings' , style: TextStyle(color: SecondColor, fontWeight: FontWeight.bold , fontSize: 30.0) , textDirection: TextDirection.ltr, textAlign: TextAlign.start,),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  leading: Icon(Icons.change_history),
                  title: Text('Change Password' , style: TextStyle(fontSize: 18),),
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_forward_ios , color: Colors.purple[400],),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePassword()));
                    },
                  ),
                ),
                Divider(color: FirstColor,),
                ListTile(
                  leading: Icon(Icons.change_history),
                  title: Text('Change Language' , style: TextStyle(fontSize: 18),),
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_forward_ios , color: Colors.purple[400],),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePassword()));
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
