import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/constant.dart';
import 'package:ecommerce/log%20in/form_error.dart';
import 'package:ecommerce/sign_up/signup_screen.dart';
//import 'package:ecommerce/signup_screen.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static  String routeName = '/forget_password';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0 ,
        brightness: Brightness.light,

      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
            child: Column(
              children: <Widget>[
                SizedBox(height: SizeConfig.screenHeight*0.04,),
                Text("Forgot Password" ,
                  style:
                  TextStyle(
                    color: Colors.black ,
                    fontWeight: FontWeight.bold ,
                    fontSize: getProportionateScreenWidth(28)),
                ),
                Text("Please enter your email and we will send \nyou a link to return your account" ,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight*0.1,),
                ForgotPassForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  List<String> errors = [];
  final _formKey = GlobalKey<FormState>();
  String email;
  List myData = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                style:
                TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
                onSaved: (value) {
                  myData.add(value);
                },
                onChanged: (value) {
                  //email = value;
                  if (value.isNotEmpty && errors.contains(kEmailNullError)) {
                    setState(() {
                      errors.remove(kEmailNullError);
                    });
                  } else if (emailValidationRegExp.hasMatch(value) &&
                      errors.contains(kInvalidEmailError)) {
                    setState(() {
                      errors.remove(kInvalidEmailError);
                    });
                  }
                  return null;
                },
                validator: (value){
                  if (value.isEmpty && !errors.contains(kEmailNullError)) {
                    setState(() {
                      errors.add(kEmailNullError);
                    });
                  } else if (!emailValidationRegExp.hasMatch(value) &&
                      !errors.contains(kInvalidEmailError)) {
                    setState(() {
                      errors.add(kInvalidEmailError);
                    });
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your email",
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
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(30),),
            FormError(errors: errors),
            SizedBox(height: SizeConfig.screenHeight*0.1,),
            DefaultButton(
              //size: size.width*0.6,
              text: "Continue",
              press: () {
                if (_formKey.currentState.validate()) {
                  //do some things
                }
              },
            ),
            SizedBox(height: SizeConfig.screenHeight*0.1,),
            Center(
                child: GestureDetector(
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Don't have an account?",
                          style: TextStyle(
                            fontFamily: 'SFUIDisplay',
                            color: Colors.black,
                            fontSize: 15,
                          )),
                      TextSpan(
                          text: " sign up",
                          style: TextStyle(
                            fontFamily: 'SFUIDisplay',
                            color: kPrimaryColor,
                            fontSize: 15,
                          ),
                        recognizer: new TapGestureRecognizer()..onTap = ()=> Navigator.pushNamed(context, SignUpScreen.routeName),
                      )
                    ]),
                  ),
                  onTap: () {
                    //print('hello');
                   // Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}