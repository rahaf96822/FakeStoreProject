import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ScreenProduct extends StatefulWidget {
  @override
  _ScreenProductState createState() => _ScreenProductState();
}

class _ScreenProductState extends State<ScreenProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[400],
        elevation: 5.0,
        shadowColor: Colors.blue[200],
        title: Text('My Cart', style: TextStyle(fontSize: 20 , color: Colors.white , fontWeight: FontWeight.bold),),
        leading: Icon(Icons.arrow_back , color: Colors.white,),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10 ),
        child: Expanded(
          child: GridView.builder(
            itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 0.75
              ),
              itemBuilder: (context , index) => ItemCard()
          ),
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          // height: 180,
          // width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image.asset('images/happiness (1).jpg'),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Text("information for product" , style: TextStyle(color: Colors.black26),
        ),),
        
        Text('price' , style: TextStyle(fontWeight: FontWeight.bold),)
      ],
    );
  }
}
