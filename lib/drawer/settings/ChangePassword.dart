import 'package:ecommerce/components/default_button.dart';
import 'file:///C:/Users/lenovo%20l340/AndroidStudioProjects/ecommerce/lib/constants/constant.dart';
import 'package:ecommerce/log%20in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool _passwordVisible1 =  true;
  bool _passwordVisible2 = true;
  bool _passwordVisible3 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          shadowColor: Colors.purple[200],
          leading: IconButton(
            icon: Icon(Icons.arrow_back , color: Colors.white,),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Change Password'.tr,
            style: TextStyle(fontSize: 18),
          ),
        ),
        body: SingleChildScrollView(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: _passwordVisible1,
                  style:
                  TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Old Password'.tr,
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: SecondColor,
                      ),
                      // suffixIcon: Icon(
                      //   Icons.remove_red_eye_outlined,
                      //   color: SecondColor,
                      //   size: 16,
                      // ),
                      suffixIcon: IconButton(
                          icon :Icon(_passwordVisible1 ? Icons.visibility_off : Icons.visibility , color: SecondColor,size: 16,),

                        onPressed: (){
                            setState(() {
                              _passwordVisible1 =!_passwordVisible1;
                            });
                        },

                      ),
                      labelStyle: TextStyle(fontSize: 15)),
                ),
              ),
              // SizedBox(
              //   height: 20,
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 20, right: 20),
              //   child: Container(
              //     height: 35,
              //     child: TextField(
              //         decoration: InputDecoration(
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.all(Radius.circular(5)),
              //       ),
              //      suffixIcon: Icon(
              //         Icons.remove_red_eye_outlined,
              //         size: 16,
              //       ),
              //       labelText: "New Password",
              //       labelStyle: TextStyle(fontSize: 14),
              //
              //     )),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: true,
                  style:
                  TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'New Password'.tr,
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: SecondColor,
                      ),
                      // suffixIcon: Icon(
                      //   Icons.remove_red_eye_outlined,
                      //   color: SecondColor,
                      //   size: 16,
                      // ),
                      suffixIcon: IconButton(
                        icon :Icon(_passwordVisible2 ? Icons.visibility_off : Icons.visibility , color: SecondColor,size: 16,),

                        onPressed: (){
                          setState(() {
                            _passwordVisible2 =!_passwordVisible2;
                          });
                        },

                      ),
                      labelStyle: TextStyle(fontSize: 15)),
                ),
              ),
              // SizedBox(
              //   height: 20,
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 20, right: 20),
              //   child: Container(
              //     height: 35,
              //     child: TextField(
              //         decoration: InputDecoration(
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.all(Radius.circular(5)),
              //       ),
              //       suffixIcon: Icon(
              //         Icons.remove_red_eye_outlined,
              //         size: 16,
              //
              //       ),
              //       labelText: "Confirm Password",
              //       labelStyle: TextStyle(fontSize: 14),
              //     )),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: true,
                  style:
                  TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirm Password'.tr,
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: SecondColor,
                      ),
                      // suffixIcon: Icon(
                      //   Icons.remove_red_eye_outlined,
                      //   color: SecondColor,
                      //   size: 16,
                      // ),
                      suffixIcon: IconButton(
                        icon :Icon(_passwordVisible3 ? Icons.visibility_off : Icons.visibility , color: SecondColor,size: 16,),

                        onPressed: (){
                          setState(() {
                            _passwordVisible3 =!_passwordVisible3;
                          });
                        },

                      ),
                      labelStyle: TextStyle(fontSize: 15)),
                ),
              ),
              // SizedBox(
              //   height: 50,
              // ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 20),
              //   child: Container(
              //     width: double.infinity,
              //     child: RaisedButton(
              //       color: Colors.purple[100],
              //       onPressed: () {
              //         Get.to(ChangePassword());
              //       },
              //       child: Text(
              //         "Change Password",
              //         style: TextStyle(
              //             fontSize: 14,
              //             fontWeight: FontWeight.bold,
              //             color: Colors.black54),
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultButton(
                  //size: size.width*0.6,
                  text: "Change Password".tr,
                  press: () {
                    Navigator.pushNamed(context, SignInScreen.routeName);
                    /*if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            _formKey.currentState.reset();
                            Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text('Processing Data')));}*/

                  },
                ),
              ),
            ],
          ),
        ));
  }
}
