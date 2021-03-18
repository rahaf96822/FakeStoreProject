import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPurchases extends StatelessWidget {
  var now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[200],
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            onPressed: () {},
          ),
          title: Text(
            'My Purchases',
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
                    color: Colors.purple[200],
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
                    color: Colors.purple[200],
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
                    color: Colors.purple[200],
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
          backgroundColor: Colors.purple[200],
          onPressed: () {},
          child: new Icon(IconData(
            60269,
          )),
        ));
  }
}
