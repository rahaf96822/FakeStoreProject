import 'file:///C:/Users/lenovo%20l340/AndroidStudioProjects/ecommerce/lib/settings/ChangePassword.dart';
import 'package:ecommerce/MyActivities.dart';
import 'package:ecommerce/MyPurchases.dart';
import 'package:ecommerce/My_Cart.dart';
import 'package:ecommerce/settings/page_settings.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce/constant.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  /*List<String> tabTextList;
  List<Tab> _tabs = List<Tab>();
  List<Tab> getTabs(){
    _tabs.clear();
    for (int i=0 ; i<tabTextList.length ; i++){
      _tabs.add(getTab(i));
    }
    return _tabs;
  }
  Tab getTab (int widgetNumber) {
    return Tab(
      text: "${tabTextList[widgetNumber]}",
    );
  }*/

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 4,
      //length: tabTextList.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: FirstColor,
          shadowColor: Colors.purple[200],
          title: Text("Product by categories" , style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold , fontSize: 24),),

          bottom: TabBar(
            //tabs: getTabs(
            isScrollable: true,
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            //labelPadding: EdgeInsets.all(1.5),
            tabs: <Widget>[
              Tab(text: "Electronics"),
              Tab(text: "Jewelery"),
              Tab(text: "Men clothing"),
              Tab(text: "Women clothing"),
            ],
          ),
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: size.height*0.3,
                color: SecondColor,
                child: Center(
                  child: Image.asset("images/welcome5.png"),
                ),
              ),
              ListTile(
                leading: Icon(Icons.settings,color: SecondColor),
                title: Text("Setting"),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageSettings()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.add_shopping_cart,color: SecondColor),
                title: Text("My Cart"),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Screen9()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.assignment_returned,color: SecondColor),
                title: Text("My Purchases"),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyPurchases()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.article,color: SecondColor),
                title: Text("My Activities"),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyActivities()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.warning_rounded,color: SecondColor,),
                title: Text("About"),
                onTap: null,
              ),
            ],
          ),
        ),

        /*Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.deepPurple[50],
            valueColor: AlwaysStoppedAnimation(Colors.deepPurple[700]),
          ),
        ),*/
      ),
    );
  }
}
/*class TopTabBar extends StatefulWidget {
  TopTabBar({Key key}) : super(key: key);
  @override
  _TopTabBarState createState() => _TopTabBarState();
}

class _TopTabBarState extends State<TopTabBar> {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[700],
        title: Text("Product by categories" , style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold , fontSize: 24),),

        bottom: TabBar(
          tabs: <Widget>[
            Tab(text: "Electronics"),
            Tab(text: "Jewelery"),
            Tab(text: "Men clothing"),
            Tab(text: "Women clothing"),

          ],
        ),
      ),
    );
  }
}*/
