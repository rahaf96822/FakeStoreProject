import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/home_screen/home_page.dart';
import 'package:ecommerce/log%20in/form_error.dart';
import 'package:ecommerce/constant.dart';
import 'package:ecommerce/size_config.dart';
import 'complete_profile.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static String routeName = '/sign_up';

  @override
  SignUpScreenState createState() {
    return SignUpScreenState();
  }
}

class SignUpScreenState extends State<SignUpScreen> {
  /*String email;
  String password;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  bool _formChanged = false;
  FocusNode focusNode;

  List myData = [];
  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  String validatePassword(String value) {
    /// Password (Hard) Regex
    /// Allowing all character except 'whitespace'
    /// Must contains at least: 1 uppercase letter, 1 lowecase letter, 1 number, & 1 special character (symbol)
    /// Minimum character: 8
    bool isHardPassword = value.isPasswordHard();
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!isHardPassword)
        return 'Enter a hard password';
      else
        return null;
    }
  }

  String validateEmail(String value) {
    bool isEmail = value.isEmail();
    print(value);
    print(isEmail);
    if (value.isEmpty) {
      return 'Email is required';
    } else {
      if (!isEmail)
        return 'Enter valid Email';
      else
        return null;
    }
  }

  String validatePhone(String value) {
    /// Phone Number regex
    /// Must started by either, "0", "+", "+XX <X between 2 to 4 digit>", "(+XX <X between 2 to 3 digit>)"
    /// Can add whitespace separating digit with "+" or "(+XX)"
    /// Example: 05555555555, +555 5555555555, (+123) 5555555555, (555) 5555555555, +5555 5555555555
    bool isPhone = value.isPhone();
    if (value.isEmpty) {
      return 'Phone number is required';
    } else {
      if (!isPhone)
        return 'Enter valid Phone number';
      else
        return null;
    }
  }

  Future<bool> _onWillPop() {
    if (!_formChanged) return Future<bool>.value(true);
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
              "Are you sure you want to abandon the form? Any changes will be lost."),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancel"),
              onPressed: () => Navigator.of(context).pop(false),
              textColor: Colors.black,
            ),
            FlatButton(
              child: Text("Abandon"),
              textColor: Colors.red,
              onPressed: () => Navigator.pop(context, true),
            ),
          ],
        ) ??
            false;
      },
    );
  }

  void _onFormChange() {
    if (_formChanged) return;
    setState(() {
      _formChanged = true;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Background(
            child: BodyS(),
          ),
    ),
    ),
      );
  }
}

class BodyS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget> [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "SIGN UP",
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
                SizedBox(height: SizeConfig.screenHeight * 0.04), //8 of total height
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                //row for social media
                Text(
                  "By continuing your confirm that you agree \nwith our term and condition",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
              ],
            ),
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

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String confirm_password;
  bool _formChanged = false;
  final List<String> errors = [];

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

  // void _onFormChange() {
  //   if (_formChanged) return;
  //   setState(() {
  //     _formChanged = true;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
        child: Column(
          children: [
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenHeight(20)),
            buildPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(20)),
            buildConfirmPasswordFormField(),
            FormError(errors: errors),
            SizedBox(height: getProportionateScreenHeight(30)),
            DefaultButton(
              text: "Continue",
              color: kPrimaryColor,
              press: () {
                if (_formKey.currentState.validate()) {
                  //Go to complete profile page
                  //_formKey.currentState.save();
                  // if all are valid then go to success screen
                  //KeyboardUtil.hideKeyboard(context);
                  Navigator.pushNamed(context, CompleteProfileScreen.routeNamed);
                }
              },
            ),
          ],
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
    );
  }
  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
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
        labelText: "Password",
        hintText: "Enter your password",
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
        labelStyle: TextStyle(fontSize: 15),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kTextColor),
          borderRadius: BorderRadius.circular(28),
          gapPadding: 10,
        ),
      ),
    );
  }
  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => confirm_password = newValue,
      onChanged: (value) {
        if (password == confirm_password) {
          removeError(error: kMatchPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          return "";
        } else if (password != value) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
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
