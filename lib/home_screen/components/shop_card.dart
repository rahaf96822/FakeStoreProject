import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
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
    var size = MediaQuery.of(context).size;
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

          return
        }
        return Center(child: CircularStepProgressIndicator(
          totalSteps: 20,
          currentStep: 6,
          //padding: math.pi / 15,
          selectedColor: Colors.cyan,
          unselectedColor: Colors.yellowAccent,
          selectedStepSize: 3.0,
          unselectedStepSize: 9.0,
          width: 100,
        ));
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