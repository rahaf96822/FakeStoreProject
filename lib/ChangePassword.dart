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
          backgroundColor: Colors.purple[200],
          leading: Icon(Icons.arrow_back_rounded),
          title: Text(
            'Change Password',
            style: TextStyle(fontSize: 18),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 35,
                  child: TextField(
                      decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                       suffixIcon : Icon(
                      Icons.remove_red_eye_outlined,
                      size: 16,
                    ),
                    labelText: "Old Password",
                    labelStyle: TextStyle(fontSize: 14),
                  )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 35,
                  child: TextField(
                      decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                   suffixIcon: Icon(
                      Icons.remove_red_eye_outlined,
                      size: 16,
                    ),
                    labelText: "New Password",
                    labelStyle: TextStyle(fontSize: 14),

                  )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 35,
                  child: TextField(
                      decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    suffixIcon: Icon(
                      Icons.remove_red_eye_outlined,
                      size: 16,

                    ),
                    labelText: "Confirm Password",
                    labelStyle: TextStyle(fontSize: 14),
                  )),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.purple[100],
                    onPressed: () {
                      Get.to(ChangePassword());
                    },
                    child: Text(
                      "Change Password",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
