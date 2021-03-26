import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/log%20in/form_error.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce/constant.dart';
import 'package:ecommerce/size_config.dart';

class CompleteProfileScreen extends StatelessWidget {
  static String routeNamed = "/complete_profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0 ,
        brightness: Brightness.light,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight*0.02,),
              Text("Complete Profile" ,
              style: TextStyle(
                  color: Colors.black ,
                  fontWeight: FontWeight.bold ,
                  fontSize: getProportionateScreenWidth(28)
              ),
              ),
              Text(
                "Complete your details or continue \nwith social media" ,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight*0.05,),
              CompleteProfileForm(),
              SizedBox(height: getProportionateScreenHeight(30)),
              Text("By continuing your confirm that you agree \nwith our term and condition" ,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String firstName;
  String lastName;
  String phoneNumber;
  String address;

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
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            buildFirstNameFormField(),
            SizedBox(height: getProportionateScreenHeight(20)),
            buildLastNameFormField(),
            SizedBox(height: getProportionateScreenHeight(20)),
            buildPhoneNumberFormField(),
            SizedBox(height: getProportionateScreenHeight(20)),
            buildAddressFormField(),
            FormError(errors: errors),
            SizedBox(height: getProportionateScreenHeight(30)),
            DefaultButton(
              text: "Continue",
              color: kPrimaryColor,
              press: () {
                if (_formKey.currentState.validate()) {
                  Navigator.pushNamed(context, CompleteProfileScreen.routeNamed);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNameNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNameNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
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
          Icons.person,
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
  TextFormField buildLastNameFormField() {
    return TextFormField(
      onSaved: (newValue) => lastName = newValue,
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your last name",
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
          Icons.person,
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
  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",

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
          Icons.phone_android,
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
  TextFormField buildAddressFormField() {
    return TextFormField(
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Enter your address",

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
          Icons.location_on,
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
