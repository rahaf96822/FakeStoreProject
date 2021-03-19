import 'package:ecommerce/PinPut.dart';
import 'package:ecommerce/constant.dart';
import 'package:ecommerce/screen_login//login_screen.dart';
import 'package:flutter/material.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:ecommerce/screen_login//welcome_screen.dart';
import 'package:ecommerce/screen_login//home_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = 'register_screen';

  @override
  RegisterScreenState createState() {
    return RegisterScreenState();
  }
}

class RegisterScreenState extends State<RegisterScreen> {
  String email;
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
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget> [
          SizedBox(height: size.height*0.03,),
          Text(
            "SIGN UP",
            style: TextStyle(color: Colors.black ,fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height*0.03,),
          Image.asset(
            "images/welcome4.png",
            height: size.height * 0.40,

          ),
          SizedBox(height: size.height*0.03,),
          Form(
              onChanged: _onFormChange,
              onWillPop: _onWillPop,
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      initialValue: ' ',
                      style:
                      TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
                      onSaved: (value) {
                        myData.add(value);
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                          prefixIcon: Icon(
                            Icons.person,
                            color: SecondColor,
                          ),
                          labelStyle: TextStyle(fontSize: 15)),
                      autofocus: true,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      style:
                      TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
                      onSaved: (value) {
                        myData.add(value);
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Phone',
                          prefixIcon: Icon(
                            Icons.phone,
                            color: SecondColor,
                          ),
                          labelStyle: TextStyle(fontSize: 15)),
                      autofocus: true,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        return validatePhone(value);
                      },
                    ),
                  ),
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
                        email = value;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email Address',
                          prefixIcon: Icon(
                            Icons.email,
                            color: SecondColor,
                          ),
                          labelStyle: TextStyle(fontSize: 15)),
                      validator: (value) {
                        return validateEmail(value);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: true,
                      onSaved: (value) {
                        myData.add(value);
                      },
                      style:
                      TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: SecondColor,
                          ),
                          labelStyle: TextStyle(fontSize: 15)),
                      validator: (value) {
                        return validatePassword(value);
                      },
                      controller: _pass,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onSaved: (value) {
                        myData.add(value);
                      },
                      onChanged: (value) {
                        password = value;
                      },
                      obscureText: true,
                      style:
                      TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Confirm Password',
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.deepPurple,
                          ),
                          labelStyle: TextStyle(fontSize: 15)),
                      validator: (value) {
                        if (value != _pass.text) {
                          return "the password isn't matching";
                        } else
                          return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RoundedButton(
                      text: "SIGN IN",
                      color: SecondColor,
                      textColor: Colors.white,
                      press: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Pin_Put()));
                        /*if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          _formKey.currentState.reset();
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('Processing Data')));
                        }*/
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Center(
                      child: InkWell(
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Have an account?",
                                style: TextStyle(
                                  fontFamily: 'SFUIDisplay',
                                  color: Colors.black,
                                  fontSize: 15,
                                )),
                            TextSpan(
                                text: " sign in",
                                style: TextStyle(
                                  fontFamily: 'SFUIDisplay',
                                  color: Colors.blueAccent,
                                  fontSize: 15,
                                ))
                          ]),
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
        ],
          ),
    ),
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