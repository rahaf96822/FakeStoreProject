import 'package:ecommerce/home_screen/components/item_card.dart';
import 'package:ecommerce/home_screen/components/product_details.dart';
import 'package:flutter/material.dart';
//import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:ecommerce/http_service.dart';
import 'package:ecommerce/constant.dart';
import 'package:ecommerce/model/product.dart';
import 'dart:math';
class ShopCard extends StatefulWidget {
  @override
  _ShopCardState createState() => _ShopCardState();
}

class _ShopCardState extends State<ShopCard> {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    //var size = MediaQuery.of(context).size;
    // double defaultSize = SizeConfig.defaultSize;
    return FutureBuilder(
      future: httpService.getProduct(),
      builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot){
        if(snapshot.hasData){
          List<Product> products=snapshot.data;
          // return AspectRatio(
          //   aspectRatio: 1.65,
          //   child: Container(
          //     //color: kPrimaryLightColor,
          //     decoration: BoxDecoration(
          //         color: kPrimaryLightColor,
          //         borderRadius: BorderRadius.circular(50.0)
          //     ),
          //     child: Row(
          //       children: <Widget>[
          //         Expanded(
          //           child: Padding(
          //             padding: EdgeInsets.all(20.0),
          //             child: Column(
          //               children: <Widget>[
          //                 Spacer(),
          //                 Text(
          //                   products[0].title,
          //                   style: TextStyle(
          //                       fontSize: 22.0,
          //                       color: Colors.black
          //                   ),
          //                 ),
          //                 SizedBox(height: 5.0,),
          //                 Text(
          //                   products[0].description,
          //                   style: TextStyle(
          //                     color: Colors.black,
          //                   ),
          //                   maxLines: 2,
          //                   overflow: TextOverflow.ellipsis,
          //                 ),
          //                 // SizedBox(height: 10.0,),
          //                 Spacer(),
          //                 Text(
          //                   'Price:'+ products[0].price.toString() + '\$',
          //                   style: TextStyle(
          //                     fontSize: 16,
          //                     fontWeight: FontWeight.bold,
          //                     //color: Colors.
          //                   ),
          //                 ),
          //                 Spacer()
          //
          //               ],
          //             ),
          //           ),
          //         ),
          //         //SizedBox(width: 5.0,),
          //         // AspectRatio(
          //         //     aspectRatio: 0.17,
          //         //   child: Image.asset(
          //         //     products[0].image,
          //         //     fit: BoxFit.cover,
          //         //     alignment: Alignment.centerLeft,
          //         //     // fit : BoxFit.cover,
          //         //     // alignment: Alignment.centerLeft,
          //         //   ),
          //         // )
          //       ],
          //     ),
          //   ),
          // );

          // return Wrap(
          //   children: List.generate(products.length, (index) {
          //     return Card(
          //       elevation: 2,
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: <Widget>[
          //           Container(
          //             width: (size.width-16)/2 ,
          //             height: (size.width-16)/2,
          //             decoration: BoxDecoration(
          //               image: DecorationImage(
          //                   image: NetworkImage(products[0].image),
          //                   fit: BoxFit.cover
          //               ),
          //             ),
          //           ),
          //           SizedBox(height: 15,),
          //           Padding(
          //             padding: const EdgeInsets.only(left: 15),
          //             child: Text(
          //               products[0].title,
          //               style: TextStyle(
          //                   fontSize: 12.0,
          //                   color: Colors.black
          //               ),
          //               maxLines: 2,
          //                 overflow: TextOverflow.ellipsis
          //             ),
          //           ),
          //           SizedBox(height: 10,),
          //           Padding(
          //             padding: const EdgeInsets.only(left: 15),
          //             child: Text('Price:'+ products[0].price.toString() + '\$',
          //                 style: TextStyle(
          //                   fontSize: 16,
          //                   fontWeight: FontWeight.bold,
          //                   //color: Colors.
          //                 )),
          //           ),
          //         ],
          //       ),
          //     );
          //   }),
          // );

          return SizedBox(
            height: (MediaQuery.of(context).size.height)-148.8,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                itemCount: products.length,
                  gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.70
                  ),
                  itemBuilder: (context , index) =>ItemCard(
                    product: products[index],
                  press: ()=> Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductDetails(product: products[index],)),
                  ))
                  //   return Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: <Widget>[
                  //       Container(
                  //         padding: EdgeInsets.all(10),
                  //         height: 180,
                  //          width: 160,
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(16),
                  //           image: DecorationImage(
                  //               image: NetworkImage(products[0].image),
                  //               fit: BoxFit.cover
                  //           ),
                  //         ),
                  //
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.symmetric(vertical: 5.0),
                  //         child: Text(products[0].title, style: TextStyle(color: Colors.black26),
                  //         ),),
                  //
                  //       Text(products[0].price.toString() , style: TextStyle(fontWeight: FontWeight.bold),)
                  //     ],
                  //   );
                  // }
                  ),
            ),
          );
        }
        return Center(child: CircularProgressIndicator()
        // CircularStepProgressIndicator(
        //   totalSteps: 20,
        //   currentStep: 6,
        //   //padding: math.pi / 15,
        //   selectedColor: kPrimaryLightColor,
        //   unselectedColor: kPrimaryColor,
        //   selectedStepSize: 3.0,
        //   unselectedStepSize: 9.0,
        //   width: 100,
        // )
        );
      },
    );
    // child: AspectRatio(
    //     aspectRatio: 1.65,
    //   child: Container(
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(defaultSize*1.8)
    //     ),
    //     child: Row(
    //       children: <Widget>[
    //         AspectRatio(
    //             aspectRatio: 0.17,
    //           child: Image.asset(
    //
    //             // fit : BoxFit.cover,
    //             // alignment: Alignment.centerLeft,
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // ),
    // );
  }
}

