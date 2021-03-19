import 'package:ecommerce/screen_login//login_screen.dart';
import 'package:ecommerce/screen_login//signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/constant.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        children: <Widget>[
          SizedBox(height: size.height*0.03,),
          Text(
            "WELCOME TO RFR",
            style: TextStyle(color: Colors.black ,fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height*0.03,),
          Image.asset(
            "images/welcome5.png",
            height: size.height * 0.45,

          ),
          SizedBox(height: size.height*0.05,),
          RoundedButton(
            text: "SIGN IN",
            color: SecondColor,
            textColor: Colors.white,
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
            } ,
          ),
          RoundedButton(
            text: "SIGN UP",
            color: ThirdColor,
            textColor: Colors.black,
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
            } ,
          ),
        ],
      ),
    );
  }
}
class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.textColor = Colors.white, this.size, this.color,
  }) : super(key: key);
  final Size size;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width*0.6,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: color,
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child
  }) :super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "images/main_top.png",
              width: size.width*0.3,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "images/main_bottom.png",
              width: size.width*0.2,
            ),
          ),
          child,
        ],
      ),
    );
  }
}