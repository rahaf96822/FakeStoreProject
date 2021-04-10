import 'file:///C:/Users/lenovo%20l340/AndroidStudioProjects/ecommerce/lib/constants/constant.dart';
import 'package:ecommerce/model/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/model/cart.dart';

class ProductDetails extends StatefulWidget {
  final Product product;
  const ProductDetails({Key key,this.product}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool _isFavorited = true;
  int _counter=1;
  List myCartList = [];
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: kPrimaryColor,
        //    elevation: 5.0,
        //   shadowColor: Colors.purple[200],
        //   title: Text('', style: TextStyle(fontSize: 20 , color: Colors.white , fontWeight: FontWeight.bold),),
        //   leading: Icon(Icons.arrow_back , color: Colors.white,),
        // ),
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height *0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.product.image),
                  fit: BoxFit.contain
                )
              ),
            ),
            Positioned(
              left: 20,
              top: 10 + MediaQuery.of(context).padding.top,
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: ClipOval(
                  child: Container(
                    height: 42,  width: 41,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          offset: Offset(0,4),
                          blurRadius: 8
                        )
                      ]
                    ),
                    child: Center(
                      child: Icon(Icons.arrow_back , color: Colors.black,),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple.withOpacity(0.2),
                      offset: Offset(0,-4),
                      blurRadius: 8
                    )
                  ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 30,
                        right: 30
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(widget.product.title,
                            style: GoogleFonts.ptSans(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                            ) ,),
                          ),
                          InkWell(
                            onTap: (){
                              setState(() {
                                if (_isFavorited) {
                                  _isFavorited = false;
                                } else {
                                  _isFavorited = true;
                                }
                              });
                            },
                            child: (_isFavorited ? Icon(Icons.favorite_outline , color: Colors.red, size: 30,)
                                : Icon(Icons.favorite , color: Colors.red, size: 30,))
                            //Icon(Icons.favorite_outline , color: Colors.black,),
                          )
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                          top:20,
                          left: 30,
                          right: 30
                        ),
                      child: Row(
                        children: [
                          Text(widget.product.price.toString()+'\$',
                          style: GoogleFonts.ptSans(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey
                          ),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                        left: 30,
                        right: 30,
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 4 , horizontal: 8),
                        decoration: BoxDecoration(
                          //color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Text(widget.product.description,
                        style: GoogleFonts.ptSans(
                          color: Colors.black,
                          fontSize: 16
                        ),),
                      ),
                    ),
                    Expanded(
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: (){
                                setState(() {
                                  return _counter--;
                                });
                              },
                              child: Container(
                                height: 40, width: 49,
                                decoration: BoxDecoration(
                                  color: kPrimaryLightColor,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Center(
                                  child: Text('-',
                                  style:  GoogleFonts.ptSans(
                                      fontSize: 24,
                                      color: Colors.white,
                                    fontWeight: FontWeight.bold
                                  ),),
                                ),
                              ),
                            ),
                            Container(
                              height: 49,
                              width: 100,
                              child: Center(
                                child: Text('$_counter',
                                style: GoogleFonts.ptSans(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  return _counter++;
                                });
                              },
                              child: Container(
                                height: 40, width: 49,
                                decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Center(
                                  child: Text('+',
                                    style:  GoogleFonts.ptSans(
                                        fontSize: 24,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                      //fontWeight: FontWeight.bold
                                    ),),
                                ),
                              ),
                            )
                          ],
                        )
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(vertical: 20 ,horizontal: 30),
                      decoration: BoxDecoration(
                        //color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepPurple.withOpacity(0.07),
                            offset: Offset(0, -3),
                            blurRadius: 12
                          )
                        ]
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Total" ,
                              style: GoogleFonts.ptSans(
                                  fontSize: 14,
                                  color: Colors.black
                                  //fontWeight: FontWeight.bold
                              ),),
                              Text((widget.product.price * _counter).toString()+'\$',
                              style: GoogleFonts.ptSans(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                color: Colors.black
                              ),)
                            ],
                          )
                          ),
                          Material(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(10),
                            child: InkWell(
                              onTap: (){
                                cart.addItem(widget.product.image, widget.product.price,
                                    widget.product.title, widget.product.id.toString());
                              },
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text("Add to Cart" ,
                                  style: GoogleFonts.ptSans(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  ),),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
