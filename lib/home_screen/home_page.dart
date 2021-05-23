import 'dart:convert';
import 'package:ecommerce/drawer/favorite.dart';
import 'package:get/get.dart';
import 'package:ecommerce/drawer/MyActivities.dart';
import 'package:ecommerce/drawer/MyPurchases.dart';
import 'package:ecommerce/drawer/My_Cart.dart';
import 'package:ecommerce/drawer/about.dart';
import 'package:ecommerce/constants/constant.dart';
import 'package:ecommerce/home_screen/categories/Electronics.dart';
import 'package:ecommerce/home_screen/categories/Jewelery.dart';
import 'package:ecommerce/home_screen/categories/men.dart';
import 'package:ecommerce/home_screen/categories/woman.dart';

import 'package:ecommerce/drawer/settings/page_settings.dart';
import 'package:ecommerce/size_config.dart';
import 'package:ecommerce/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  static String routeName = "/home_page";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  int currentIndex = 0;
  TabController _tabController;
  int index = 0;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    fetchCategory();

    _tabController = TabController(length: 4, vsync: this);
  }

  List<String> choices = [];

  Future fetchCategory() async {
    List<String> finalCategoryList = [];
    http
        .get('https://fakestoreapi.com/products/categories')
        .then((http.Response response) async {
      var category = await jsonDecode(response.body);
      print(category);
      print(category.runtimeType);

      finalCategoryList = new List<String>.from(category);

      print(finalCategoryList);
      print(finalCategoryList.runtimeType);
      for (String item in finalCategoryList) {
        setState(() {
          choices.add(item);
          // isLoading = !isLoading;
        });
      }
      print(choices);
      setState(() => isLoading = false);
    });
  }




  @override
  Widget build(BuildContext context) {
    return
      isLoading
        ? Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        shadowColor: Colors.purple[200],
        elevation: 5.0,
        title:  Text("Product by categories".tr,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24),
        ),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    )
        :Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        actions: [
          IconButton(icon: Icon(Icons.add_shopping_cart,color: Colors.white),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Screen9()),
            );
          },)
        ],
        shadowColor: Colors.purple[200],
        elevation: 5.0,
        title:  Text("Product by categories".tr,
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
                  title: Text("Setting".tr ,style: TextStyle (
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
                  title: Text("My Cart".tr ,style: TextStyle (
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
                  leading: Icon(Icons.favorite,color: kPrimaryColor),
                  title: Text("Favorite".tr ,style: TextStyle (
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    //fontsize
                  ),),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Favorite()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.assignment_returned,color: kPrimaryColor),
                  title: Text("My Purchases".tr,style: TextStyle (
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
                  title: Text("My Activities".tr,style: TextStyle (
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
                  title: Text("About".tr,style: TextStyle (
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
              title: Text("Log out".tr,style: TextStyle(
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
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15 , left: 10),
            child: SizedBox(
              height: 30,
              child:  TabBar(
                isScrollable: true,
                unselectedLabelColor: Colors.black,
                labelColor: kPrimaryColor,
                tabs: choices
                    .map(
                      (e) => Tab(
                    child: Text(
                      e.tr,
                      style: TextStyle(
                        //fontFamily: 'kanit',
                         // color: kPrimaryColor,
                      fontSize: 16),
                    ),
                  ),
                )
                    .toList(),
                controller: _tabController,
                indicator: BoxDecoration(
                  color: kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(
                    getProportionateScreenHeight(20.0),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Expanded(
              child: TabBarView(
                  controller: _tabController,
                  children: [
                    ElectronicCategory(),
                    JeweleryCategory(),
                    MenCategory(),
                    WomenCategory()
                  ]
              )
          )
        ],
      )

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
                leading: Icon(Icons.drawer.settings,color: Colors.deepPurple[700]),
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