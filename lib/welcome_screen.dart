import 'file:///C:/Users/lenovo%20l340/AndroidStudioProjects/ecommerce/lib/constants/constant.dart';
import 'package:ecommerce/sign_up/signup_screen.dart';
//import 'package:finalfinal/signup_screen.dart';
import 'package:ecommerce/size_config.dart';
import 'components/default_button.dart';
import 'package:flutter/material.dart';
import 'log in/sign_in_screen.dart';
import 'splash/components/splash_content.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  //static String routeName = "/welcome_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body1(),
    );
  }
}

class Body1 extends StatefulWidget {
  @override
  _Body1State createState() => _Body1State();
}

class _Body1State extends State<Body1> {
  int currentPage = 0;
  List<Map<String , String>> splashData = [
    {
      "text": "Welcome to RFR, Let's shop!",
      "image": "assets/images/welome_girl.png"
    },
    {
      "text": "We help people conect with store",
      "image": "assets/images/welome_girl.png"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/welcome5.png"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Background(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  } ,
                  itemCount: splashData.length,
                  itemBuilder: (context , index) =>SplashContent(
                    image: splashData[index]["image"],
                    text: splashData[index]["text"],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal:  getProportionateScreenWidth(20)),
                  child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          splashData.length,
                          (index) => buildDot(index: index)
                      ),
                    ),
                    Spacer(flex: 1,),
                    DefaultButton(
                      text: "SIGN IN".tr,
                      color: kPrimaryColor,
                      press: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                    ),
                    SizedBox(height: getProportionateScreenHeight(15),),
                    DefaultButton(
                      color: kPrimaryLightColor,
                      text: "SIGN UP".tr,
                      press: () {
                        Navigator.pushNamed(context, SignUpScreen.routeName);
                      },
                    ),
                    Spacer(flex: 2,),
                  ],
                ),
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
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
              "assets/images/main_top.png",
              width: size.width*0.3,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_bottom.png",
              width: size.width*0.2,
            ),
          ),
          child,
        ],
      ),
    );
  }
}


