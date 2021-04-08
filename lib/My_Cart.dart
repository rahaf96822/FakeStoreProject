import 'package:ecommerce/constant.dart';
import 'package:ecommerce/model/cart.dart';
import 'package:flutter/material.dart';
//import 'package:animated_button/animated_button.dart';
//import 'package:ecommerce/floatanimationbutton.dart';
import 'package:provider/provider.dart';

class Screen9 extends StatefulWidget {
  bool isChecked = false;
  @override
  _Screen9State createState() => _Screen9State();
}

class _Screen9State extends State<Screen9> {
  //bool _checked = false;
  //List<String> _values = ['One', 'Two', 'Three', 'Four'];
  //<String> _values = ['One', 'Two', 'Three', 'Four', 'Five'];
  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: Stack(
                overflow: Overflow.visible,
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                      child: Column(
                        children: [
                          Text('Success', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                          SizedBox(height: 5,),
                          Text('The products have been purchased successfully', style: TextStyle(fontSize: 18),),
                          SizedBox(height: 20,),
                          // RaisedButton(onPressed: () {
                          //   Navigator.of(context).pop();
                          // },
                          //   color: Colors.lightBlueAccent,
                          //   child: Text('Ok', style: TextStyle(color: Colors.white),),
                          // )
                          Align(
                            alignment: Alignment.bottomRight,
                            child: FlatButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              child: Text("OK" ,style: TextStyle(color: Colors.black),),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      top: -40,
                      child: CircleAvatar(
                        backgroundColor: Colors.lightBlueAccent,
                        radius: 40,
                        backgroundImage: AssetImage('images/check-circle.gif'),
                        //Icon(Icons.question_answer, color: Colors.white, size: 30,),
                      )
                  ),
                ],
              )
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 5.0,
        shadowColor: Colors.purple[200],
        title: Text('My Cart', style: TextStyle(fontSize: 20 , color: Colors.white , fontWeight: FontWeight.bold),),
        leading: IconButton(icon:Icon(Icons.arrow_back , color: Colors.white) ,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body:Consumer<Cart>(
        builder: (context , cart,child) =>ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (ctx, index){
              return Card(
                  elevation: 5.0,
                  shadowColor: Colors.purple[200],
                  margin: EdgeInsets.all(8),
                  //clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Dismissible(
                    key: Key('cart.items.values.toList()[index]'),


                    background: Container(
                      color: Colors.purple[100],
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Icon(Icons.delete, color: Colors.white),
                            Text('Move to trash',
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ),

                    confirmDismiss: (DismissDirection direction) async {
                      return await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Delete Confirmation"),
                            content: const Text(
                                "Are you sure you want to delete this item?"),
                            actions: <Widget>[
                              FlatButton(
                                  onPressed: () => Navigator.of(context).pop(true),
                                  child: const Text("Delete")),
                              FlatButton(
                                onPressed: () => Navigator.of(context).pop(false),
                                child: const Text("Cancel"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    onDismissed: (DismissDirection direction) {
                      if (direction == DismissDirection.startToEnd) {
                        print("Add to favorite");
                      } else {
                        print('Remove item');
                      }

                      setState(() {
                        cart.removeItem(cart.items.values.toList()[index].id.toString());
                        //_values.removeAt(index);
                      });
                    },
                    child: ListTile(
                      //leading: Icon(Icons.shop_rounded),
                        leading: CircleAvatar(
                          radius: 30.0,
                          backgroundImage:
                          NetworkImage(cart.items.values.toList()[index].photo ),
                          //backgroundColor: Colors.transparent,
                        ),
                        //Image(image: AssetImage('images/happiness (1).jpg'), width: 75, height: 75,),
                        trailing:IconButton(
                          onPressed: (){
                            setState(() {
                              widget.isChecked = !widget.isChecked;
                            });
                          },
                          icon: widget.isChecked
                          ? Icon(
                            Icons.check_box,
                            color: SecondColor,
                          )
                          : Icon(
                            Icons.check_box_outline_blank,
                            color: SecondColor,
                        ),
                        ),
                        // Checkbox(
                        //     value: _checked,
                        //     activeColor: Colors.purple[300],
                        //
                        //     checkColor: Colors.white,
                        //     onChanged: (bool _checked){
                        //       setState(() {
                        //         this._checked=_checked;
                        //       });}
                        // ),
                        title:Text( cart.items.values.toList()[index].price.toString()+'\$',style: TextStyle(fontSize: 18 , color: Colors.black , fontWeight: FontWeight.bold)),
                        subtitle: Text(cart.items.values.toList()[index].title , maxLines: 2,style: TextStyle(fontSize: 14 , color: Colors.grey[400]),)
                    ),
                  )
              );

            })
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: SecondColor,
        onPressed: _showMyDialog,
        tooltip: 'Buy',
        child: Icon(Icons.monetization_on_outlined, color: Colors.white,),
      ),
    );

  }}


