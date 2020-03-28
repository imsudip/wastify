import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wastify/screens/staff.dart';
import 'package:wastify/screens/user.dart';
import 'package:wastify/style.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isStaff = false;
  String staffid = "";

  String userid="";

  String dustbinid="";
  void onsubmit() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    if (isStaff)
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => StaffPage(
                staffId: staffid,
              )));
    else
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => UserPage(userid: userid,dustbinid: dustbinid,)));
  }

  Widget _buildTextField(String t) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(CupertinoIcons.person),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        labelText: t,
        labelStyle: TextStyle(color: CupertinoColors.systemGrey),
      ),
      keyboardType: TextInputType.text,
      style: TextStyle(
        fontSize: 20,
      ),
      cursorColor: CupertinoColors.activeBlue,
      validator: (String value) {
        if (value.isEmpty) {
          return t + ' is required';
        }

        if (value.length < 5 || value.length > 12) {
          return t + ' must be betweem 5 and 12 characters';
        }

        return null;
      },
      onChanged: (v) {
        if (t == "Staff Id") {
          setState(() {
           // print("puts");
            staffid = v;
          });
        }
        else if(t=="UserName"){
          setState(() {
            //print("putu");
            userid = v;
          });
        }
        else if(t=="Dustbin id"){
          setState(() {
            //print("putd");
            dustbinid = v;
          });
        }
      },
    );
  }

  Widget _buildPasswordField(String t) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(CupertinoIcons.person),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        labelText: t,
        labelStyle: TextStyle(color: CupertinoColors.systemGrey),
      ),
      keyboardType: TextInputType.text,
      obscureText: true,
      style: TextStyle(
        fontSize: 20,
      ),
      cursorColor: CupertinoColors.activeBlue,
      validator: (String value) {
        if (value.isEmpty) {
          return t + ' is required';
        }

        if (value.length < 5 || value.length > 12) {
          return t + ' must be betweem 5 and 12 characters';
        }

        return null;
      },
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Container(
                  margin: EdgeInsets.all(13),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Login",
                    style: heading,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Consumer", style: normal),
                  Switch(
                      inactiveThumbColor: Colors.green,
                      inactiveTrackColor: Colors.green.withOpacity(0.5),
                      value: isStaff,
                      onChanged: (b) {
                        setState(() {
                          isStaff = b;
                        });
                      }),
                  Text("Staff", style: normal),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Form(
                  //autovalidate: true,
                  key: _formKey,

                  child: Column(
                    children: <Widget>[
                      isStaff
                          ? _buildTextField("Staff Id")
                          : _buildTextField("UserName"),
                      SizedBox(height: 20),
                      isStaff ? Container() : _buildTextField("Dustbin id"),
                      isStaff ? Container() : SizedBox(height: 20),
                      _buildPasswordField("Password"),
                      SizedBox(height: 20),
                      CupertinoButton(
                          // padding: EdgeInsets.symmetric(horizontal: 30),
                          color: CupertinoColors.activeGreen,
                          borderRadius: BorderRadius.circular(25),
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            onsubmit();
                          }),
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
}
