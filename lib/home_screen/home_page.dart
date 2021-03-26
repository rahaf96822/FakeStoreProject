import 'package:ecommerce/home_screen/components/categories.dart';
import 'package:ecommerce/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'drawer_screen.dart';
import 'package:ecommerce/home_screen/drawer_screen.dart';

class HomePage extends StatefulWidget {
  static String routeName = "/home_page";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: [
              DrawerScreen(),
              HomeScreen(),
            ],
          ),

        ],
      ),
    );
  }
}



/*class HomeScreen extends StatefulWidget {
  static String routeName = "/home_screen" ;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 4,
      //length: tabTextList.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[700],
          title: Text("Product by categories" , style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold , fontSize: 24),),

          bottom: TabBar(
            isScrollable: true,
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            unselectedLabelColor: Colors.white70,
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
                color: Colors.deepPurple[50],
                child: Center(
                  child: Image.asset("assets/images/welcome_girl.png"),
                ),
              ),
              ListTile(
                leading: Icon(Icons.settings,color: Colors.deepPurple[700]),
                title: Text("Setting"),
                onTap: null,
              ),
              ListTile(
                leading: Icon(Icons.add_shopping_cart,color: Colors.deepPurple[700]),
                title: Text("My Cart"),
                onTap: null,
              ),
              ListTile(
                leading: Icon(Icons.assignment_returned,color: Colors.deepPurple[700]),
                title: Text("My Purchases"),
                onTap: null,
              ),
              ListTile(
                leading: Icon(Icons.article,color: Colors.deepPurple[700]),
                title: Text("My Activities"),
                onTap: null,
              ),
              ListTile(
                leading: Icon(Icons.warning_rounded,color: Colors.deepPurple[700],),
                title: Text("About"),
                onTap: null,
              ),
            ],
          ),
        ),

        Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.deepPurple[50],
            valueColor: AlwaysStoppedAnimation(Colors.deepPurple[700]),
          ),
        ),
      ),
    );
  }
}*/