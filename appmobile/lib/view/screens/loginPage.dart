// ignore_for_file: use_key_in_widget_constructors, file_names, prefer_const_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures

import 'package:appmobile/models/user.dart';
import 'package:flutter/material.dart';
import 'package:appmobile/view/screens/addKid1.dart';
import 'package:appmobile/view/screens/mainPage.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscured = true;
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  User retrieved = User(
    username: 'admin',
    password: 'admin',
  ); ///////////////////////////////this oone we gonna set it later and retrieve it from the database

  void _toggleVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  bool _hasKid() {
    return false; // For simplicity.... later we'll set it using the database or firebase
  }

  bool _infoValid() {
    if (_password.text == retrieved.password &&
        _username.text == retrieved.username) return true;
    return false;
  }

  void launchGmail() async {
    await launchUrl(Uri(scheme: 'https', host: 'www.gmail.com'),
        mode: LaunchMode.externalApplication);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _password.text = '';
    _username.text = '';
  }

  void sendEmail() {
//request to the backend to call the finction that send an email from mykiddonest@gmail.com to the useremail
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 126),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/icon.PNG',
                    width: 160,
                    height: 143,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 19),
                    child: Text(
                      'Nice to see you!',
                      style: TextStyle(
                        fontFamily: 'open sans',
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    'Log in to continue',
                    style: TextStyle(
                      fontFamily: 'inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF565E6C),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 26,
                    top: 25,
                  ),
                  child: Text(
                    'Username',
                    style: TextStyle(
                      fontFamily: 'roboto mono',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      height: 1,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 6,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: TextField(
                controller: _username,
                decoration: InputDecoration(
                  hintText: 'Enter your user name',
                  hintStyle: TextStyle(
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xFFBCC1CA),
                  ),
                  prefixIcon: Icon(Icons.person_outlined),
                  prefixIconColor: MaterialStateColor.resolveWith(
                    (states) => states.contains(MaterialState.focused)
                        ? Color(0xFF00ADE9)
                        : Colors.black,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 11),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(
                      color: Color(0xFF9095A0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF00ADE9)),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 26,
                    top: 25,
                  ),
                  child: Text(
                    'Password',
                    style: TextStyle(
                      fontFamily: 'roboto mono',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      height: 1,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 6,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: _password,
                obscureText: _isObscured,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xFFBCC1CA),
                  ),
                  prefixIcon: Icon(Icons.lock_outlined),
                  prefixIconColor: MaterialStateColor.resolveWith(
                    (states) => states.contains(MaterialState.focused)
                        ? Color(0xFF00ADE9)
                        : Colors.black,
                  ),
                  suffixIcon: IconButton(
                    icon: _isObscured
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                    onPressed: _toggleVisibility,
                  ),
                  suffixIconColor: MaterialStateColor.resolveWith(
                    (states) => states.contains(MaterialState.focused)
                        ? Color(0xFF00ADE9)
                        : Colors.black,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 11),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(
                      color: Color(0xFF9095A0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF00ADE9)),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    right: 26,
                    top: 20,
                  ),
                  child: GestureDetector(
                    child: Text(
                      'Forget my password!',
                      style: TextStyle(
                        fontFamily: 'roboto mono',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0xFF00ADE9),
                      ),
                    ),
                    onTap: () {
                      if (_username.text == retrieved.username) sendEmail();
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            contentPadding:
                                EdgeInsets.zero, // Remove default padding
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            content: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF3AD09A),
                                    offset: Offset(
                                        -13, 0), // Apply shadow to the left
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize
                                    .min, // Ensure the column takes minimum space
                                children: [
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Text(
                                      (_username.text == retrieved.username
                                          ? (_password.text !=
                                                  retrieved.password
                                              ? 'Please, check your email, we send you your password!'
                                              : 'You have typed the correct log in information!')
                                          : 'check your username please'),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF757474),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      //primary: Color(0xFFEBEBEB),
                                    ),
                                    onPressed: () {
                                      _username.text == retrieved.username
                                          ? (_password.text !=
                                                  retrieved.password
                                              ? launchGmail()
                                              : (_hasKid()
                                                  ? Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              MainPage()),
                                                    )
                                                  : Navigator.replace(
                                                      context,
                                                      oldRoute: ModalRoute.of(
                                                          context)!,
                                                      newRoute:
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      AddKid1()),
                                                    )))
                                          : Navigator.of(context).pop();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 17),
                                      child: Text(
                                        (_username.text == retrieved.username
                                            ? (_password.text !=
                                                    retrieved.password
                                                ? 'Open Gmail'
                                                : 'Log in')
                                            : 'Close'),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 40),
                child: SizedBox(
                  width: 200,
                  height: 44,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xFF00ADE9)),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (_infoValid() && _hasKid())
                        Navigator.replace(
                          context,
                          oldRoute: ModalRoute.of(context)!,
                          newRoute: MaterialPageRoute(
                              builder: (context) => MainPage()),
                        );
                      else if (_infoValid() && !_hasKid())
                        Navigator.replace(
                          context,
                          oldRoute: ModalRoute.of(context)!,
                          newRoute: MaterialPageRoute(
                              builder: (context) => AddKid1()),
                        );
                      else if (!_infoValid())
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              contentPadding:
                                  EdgeInsets.zero, // Remove default padding
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              content: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFFF42B4F),
                                      offset: Offset(
                                          -13, 0), // Apply shadow to the left
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize
                                      .min, // Ensure the column takes minimum space
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 16),
                                      child: Text(
                                        'Ooops!',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'poppins',
                                          fontSize: 32,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                        'Please, check your login information!',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFF757474),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        //primary: Color(0xFFEBEBEB),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12, horizontal: 17),
                                        child: Text(
                                          'Try again',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                    },
                    child: Text(
                      'log in ',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
