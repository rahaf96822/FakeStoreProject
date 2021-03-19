import 'package:ecommerce/constant.dart';
import 'package:ecommerce/screen_login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: FirstColor,
          shadowColor: Colors.purple[200],
          leading: Icon(Icons.arrow_back_rounded),
          title: Text(
            'Change Password',
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
                  obscureText: true,
                  style:
                  TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Old Password',
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: SecondColor,
                      ),
                      suffixIcon: Icon(
                        Icons.remove_red_eye_outlined,
                        color: SecondColor,
                        size: 16,
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
                      labelText: 'New Password',
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: SecondColor,
                      ),
                      suffixIcon: Icon(
                        Icons.remove_red_eye_outlined,
                        color: SecondColor,
                        size: 16,
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
                      labelText: 'Confirm Password',
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: SecondColor,
                      ),
                      suffixIcon: Icon(
                        Icons.remove_red_eye_outlined,
                        color: SecondColor,
                        size: 16,
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
                child: RoundedButton(
                  //size: size.width*0.6,
                  text: "Change Password",
                  color: SecondColor,
                  textColor: Colors.white,
                  press: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
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
