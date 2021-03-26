import 'package:ecommerce/constant.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories= ['Electronics' , 'Jewelery' , 'Men Clothing' , 'Women Clothing'];

  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical:getProportionateScreenHeight(10.0),
      ),
      child: SizedBox(
        height: getProportionateScreenHeight(50.0),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context , index) => buildCategoriItem(index)
        ),
      ),
    );
  }

  Widget buildCategoriItem(int index)
  {
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 20.0),
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(10.0),
          vertical: getProportionateScreenHeight(10.0),
        ),
        decoration: BoxDecoration(
            color:
            selectedIndex == index ? kPrimaryLightColor: Colors.transparent,
            borderRadius: BorderRadius.circular(
              getProportionateScreenHeight(15.0),
            )
        ),
        child: Text(
          categories[index],
          style: TextStyle(fontWeight: FontWeight.bold ,
              color: selectedIndex == index ? kPrimaryColor : Colors.black),
        ),

      ),
    );
  }
}
