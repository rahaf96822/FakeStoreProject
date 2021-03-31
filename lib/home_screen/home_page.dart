import 'package:ecommerce/MyActivities.dart';
import 'package:ecommerce/MyPurchases.dart';
import 'package:ecommerce/My_Cart.dart';
import 'package:ecommerce/about.dart';
import 'package:ecommerce/constant.dart';
import 'package:ecommerce/home_screen/components/body.dart';
import 'package:ecommerce/home_screen/components/categories.dart';

import 'package:ecommerce/settings/page_settings.dart';
import 'package:ecommerce/size_config.dart';
import 'package:ecommerce/welcome_screen.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  static String routeName = "/home_page";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        shadowColor: Colors.purple[200],
        elevation: 5.0,
        title:  Text("Product by categories",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24),
        ),
      ),
      drawer: Drawer(

        child: Column(

          children: <Widget>[
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height *0.3,
              color: kPrimaryLightColor,
              child: Center(
                child: Image.asset("assets/images/welome_girl.png"),
              ),
            ),
            Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.settings,color: kPrimaryColor),
                  title: Text("Setting" ,style: TextStyle (
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    //fontsize
                  ),),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PageSettings()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.add_shopping_cart,color: kPrimaryColor),
                  title: Text("My Cart" ,style: TextStyle (
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    //fontsize
                  ),),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Screen9()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.assignment_returned,color: kPrimaryColor),
                  title: Text("My Purchases",style: TextStyle (
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    //fontsize
                  ),),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyPurchases()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.article,color: kPrimaryColor),
                  title: Text("My Activities",style: TextStyle (
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    //fontsize
                  ),),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyActivities()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.warning_rounded,color:kPrimaryColor,),
                  title: Text("About",style: TextStyle (
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    //fontsize
                  ),),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => About()),
                    );
                  },
                ),
              ],
            ),

            ListTile(
              leading: Icon(Icons.logout ,
                color: kPrimaryColor,
              ),
              title: Text("Log out",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Body(),
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