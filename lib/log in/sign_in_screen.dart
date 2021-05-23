import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/constants/constant.dart';
import 'package:ecommerce/forget_password/forget_password_screen.dart';
import 'package:ecommerce/home_screen/home_page.dart';
import 'package:ecommerce/log%20in/form_error.dart';
import 'package:ecommerce/sign_up/signup_screen.dart';
//import 'package:ecommerce/signup_screen.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'sign_in_success.dart';
import 'package:get/get.dart';
import 'package:ecommerce/home_screen/home_page.dart';

class SignInScreen extends StatefulWidget {
  static String routeName = '/sign_in';
  @override
  SignInScreenState createState() {
    return SignInScreenState();
  }
}

class SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Background(
            child: Body1(),
        ),
        ),
      ),
    );
  }
}
class Body1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                "SIGN IN".tr,
                style: TextStyle(
                    color: kPrimaryColor ,
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(35)
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.01),
              Image.asset(
                "assets/images/welcome4.png",
                height: getProportionateScreenHeight(250),
                width: getProportionateScreenWidth(230),
              ),
              SignForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              SizedBox(height: getProportionateScreenHeight(10)),
              Center(
                child: RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                            text: "Don't have an account?".tr,
                            style: TextStyle(
                              fontFamily: 'SFUIDisplay',
                              color: Colors.black,
                              fontSize: getProportionateScreenWidth(15),
                            )),
                        TextSpan(
                          text: "sign up".tr,
                          style: TextStyle(
                            fontFamily: 'SFUIDisplay',
                            color: kPrimaryColor,
                            fontSize: getProportionateScreenWidth(15),
                            //recognizer: new TapGestureRecognizer()..onTap = ()=>
                          ),
                          recognizer: new TapGestureRecognizer()..onTap = ()=> Navigator.pushNamed(context, SignUpScreen.routeName),
                        )
                      ]),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(30)),

            ],
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
    return SingleChildScrollView(
      child: Container(
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
      ),
    );
  }
}

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  bool _passwordVisible1 =  true;
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
  bool _formChanged = false;
  final List<String> errors = [];

  Future<bool> _onWillPop() {
    if (!_formChanged) return Future<bool>.value(true);
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
              "Are you sure you want to exit the form? Any changes will be lost.".tr),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancel".tr),
              onPressed: () => Navigator.of(context).pop(false),
              textColor: Colors.black,
            ),
            FlatButton(
              child: Text("Confirm".tr),
              textColor: kPrimaryColor,
              onPressed: () => Navigator.pop(context, true),
            ),
          ],
        ) ??
            false;
      },
    );
  }
  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  void _onFormChange() {
    if (_formChanged) return;
    setState(() {
      _formChanged = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: _onFormChange,
      onWillPop: _onWillPop,
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text("Remember me".tr),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Forgot your password?".tr,
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontFamily: 'SFUIDisplay',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,),
                ),
              ),
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "SIGN IN".tr,
            color: kPrimaryColor,
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                // if all are valid then go to success screen
                //KeyboardUtil.hideKeyboard(context);
                Navigator.pushNamed(context, HomePage.routeName);
              }
            },
          ),
          SizedBox(height: getProportionateScreenHeight(15)),

        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: _passwordVisible1,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password".tr,
        hintText: "Enter your password".tr,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(
            horizontal: 42,
            vertical: 20
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kTextColor),
          borderRadius: BorderRadius.circular(28),
          gapPadding: 10,
        ),
        prefixIcon: Icon(
          Icons.lock_outline,
          color: kPrimaryColor,
        ),
        suffixIcon: IconButton(
          icon :Icon(_passwordVisible1 ? Icons.visibility_off : Icons.visibility , color: SecondColor,size: 16,),

          onPressed: (){
            setState(() {
              _passwordVisible1 =!_passwordVisible1;
            });
          },

        ),
        labelStyle: TextStyle(fontSize: 15),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kTextColor),
          borderRadius: BorderRadius.circular(28),
          gapPadding: 10,
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidationRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidationRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email Address".tr,
        hintText: "Enter your email".tr,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 42,
          vertical: 20
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kTextColor),
          borderRadius: BorderRadius.circular(28),
          gapPadding: 10,
        ),
        prefixIcon: Icon(
          Icons.email,
          color: kPrimaryColor,
        ),
        labelStyle: TextStyle(fontSize: 15),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kTextColor),
          borderRadius: BorderRadius.circular(28),
          gapPadding: 10,
        ),
      ),
    );
  }
}
