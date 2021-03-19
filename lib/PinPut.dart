import 'package:ecommerce/constant.dart';
import 'package:ecommerce/screen_login/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pin_put/pin_put.dart';


class PinPutTest extends StatefulWidget {
  @override
  PinPutTestState createState() => PinPutTestState();
}

class PinPutTestState extends State<PinPutTest> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.purple[400]),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(20.0),
                  padding: const EdgeInsets.all(20.0),
                  child: PinPut(
                    fieldsCount: 5,
                    onSubmit: (String pin) {
                      setState(() {
                        _showSnackBar(pin, context);

                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                      });
                    },
                    focusNode: _pinPutFocusNode,
                    controller: _pinPutController,
                    submittedFieldDecoration: _pinPutDecoration.copyWith(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    selectedFieldDecoration: _pinPutDecoration,
                    followingFieldDecoration: _pinPutDecoration.copyWith(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: Colors.purple[400].withOpacity(.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showSnackBar(String pin, BuildContext context) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 3),
      content: Container(
        height: 80.0,
        child: Center(
          child: Text(
            'Pin Submitted. Value: $pin',
            style: const TextStyle(fontSize: 25.0),
          ),
        ),
      ),
      backgroundColor: Colors.lightBlue[300],
    );
    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}


class Pin_Put extends StatefulWidget {
  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Pin_Put> {

  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.lightBlue[400]),
      borderRadius: BorderRadius.circular(15.0),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: FirstColor,
        elevation: 5.0,
        shadowColor: Colors.purple[200],
        title: Text('Confirmation Code', style: TextStyle(fontSize: 20 , color: Colors.white , fontWeight: FontWeight.bold),),
        leading: Icon(Icons.arrow_back , color: Colors.white,),
      ),

      body: SingleChildScrollView(
        child: Center(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: Get.height*0.3)),
                Text("We sent you a verification code" , style: TextStyle(fontSize: 30 , color: Colors.black , fontWeight: FontWeight.bold),),
                Padding(padding: EdgeInsets.all(10.0)),
                Text('14326' , style: TextStyle(fontSize: 25 , color: Colors.black , fontWeight: FontWeight.bold),),
                Padding(padding: EdgeInsets.all(10.0)),
                RichText(text : TextSpan(text:"You didn't receive the code?" ,
                style: TextStyle(fontSize: 16 , color: Colors.black),
                children: <TextSpan>[
                  TextSpan(text: " Try new Code", style: TextStyle(fontSize:16 , color: Colors.lightBlue[400]))
                ]

                )),
                PinPutTest()
                // Container(
                //   //color: Colors.white,
                //   margin: const EdgeInsets.all(20.0),
                //   padding: const EdgeInsets.all(20.0),
                //   child: PinPut(
                //     fieldsCount: 5,
                //     //onSubmit: (String pin) => _showSnackBar(pin, context),
                //     focusNode: _pinPutFocusNode,
                //     controller: _pinPutController,
                //     submittedFieldDecoration: _pinPutDecoration.copyWith(
                //       borderRadius: BorderRadius.circular(20.0),
                //     ),
                //     selectedFieldDecoration: _pinPutDecoration,
                //     followingFieldDecoration: _pinPutDecoration.copyWith(
                //       borderRadius: BorderRadius.circular(5.0),
                //       border: Border.all(
                //         color: Colors.lightBlue[400].withOpacity(.5),
                //       ),
                //     ),
                //     animationCurve: Curves.decelerate,
                //   ),
                // ),
              ],
            ),

    ),
      ));
  }


}

