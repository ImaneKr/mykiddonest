// ignore_for_file: use_key_in_widget_constructors, file_names, prefer_const_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures
import 'dart:convert'; // for encoding/decoding JSON
import 'package:appmobile/models/guardian.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
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
  final _myBox = Hive.box('guardianData');
  final connectionBox = Hive.box('connection');
  final _selectedKidBox = Hive.box('selectedKid');

  final _kidsBox = Hive.box('kidsData');

  late Guardian retrieved = new Guardian(username: '', password: '');
  late dynamic kidsList;
/////////////////////////////////////////

  void _toggleVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

///// hadi is a method to retrieve the kids by guardian id
  Future<bool> _hasKid() async {
    final myBox = Hive.box('kidsData');
    int? nb = await myBox.get('nbKids');
    return (nb == null || nb == 0) ? false : true;
  }

  Future<bool> _infoValid() async {
    final String username = _username.text;
    final String password = _password.text;

    final url = Uri.parse('https://backend-1-dg5f.onrender.com/auth/guardian');

    try {
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "username": username,
          "guardian_pwd": password,
        }),
      );

      if (response.statusCode == 201) {
        var data = jsonDecode(response.body);
        await _myBox.put('guardian_id', data['guardian_id']);
        await _myBox.put('firstname', data['firstname']);
        await _myBox.put('lastname', data['lastname']);
        await _myBox.put('phonenumber', data['phone_number']);
        await _myBox.put('username', data['username']);
        await _myBox.put('password', data['guardian_pwd']);
        await _myBox.put('adressMail', data['email']);
        await _myBox.put('gender', data['gender']);
        await _myBox.put('civilstate', data['civilState']);
        await _myBox.put('address', data['address']);
        await _myBox.put('guardianPic', data['acc_pic']);

        print('guardian log in successfully:$data');
        await _myBox.put('isConnected', true);

        List<Map<String, dynamic>> guardianKids =
            await getKidsByGuardianId(_myBox.get("guardian_id"));
        print('got kids successfully');
        if (guardianKids == null || guardianKids == [] || guardianKids.isEmpty)
          await _kidsBox.put('nbKids', 0);
        else
          await _kidsBox.put('nbKids', guardianKids.length);
        ;
        if (guardianKids != null)
          for (int i = 0; i < guardianKids.length; i++) {
            await _kidsBox.put('kiddo$i', {
              'kid_id': guardianKids[i]['kid_id'],
              'firstname': guardianKids[i]['firstname'],
              'lastname': guardianKids[i]['lastname'],
              'gender': guardianKids[i]['gender'],
              'dateOfbirth': DateTime.parse(guardianKids[i]['dateOfbirth']),
              'allergies': guardianKids[i]['allergies'],
              'hobbies': guardianKids[i]['hobbies'],
              'syndroms': guardianKids[i]['syndroms'],
              'authorizedpickups': guardianKids[i]['authorizedpickups'],
              'guardian_id': guardianKids[i]['guardian_id'],
              'category_id': guardianKids[i]['category_id'],
              'relationTochild': guardianKids[i]['relationTochild'],
            });
          }
        connectionBox.put('isConnected', true);
        return true;
      } else {
        // Login failed
        print('Log in failed:${response.statusCode}');
        return false;
      }
    } catch (error) {
      print('Error during login: $error');
      return false;
    }
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

  Future<List<Map<String, dynamic>>> getKidsByGuardianId(int guardianId) async {
    final response = await http.get(
      Uri.parse('https://backend-1-dg5f.onrender.com/kid/$guardianId/kids'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> responseBody = jsonDecode(response.body);
      final List<Map<String, dynamic>> kids = responseBody
          .map((dynamic item) => item as Map<String, dynamic>)
          .toList();
      print('kidsretrieved :$kids');
      return kids;
    } else {
      throw Exception('Failed to fetch kids by guardian ID: ${response.body}');
    }
  }

  void storeKids(int guardian_id) async {
    try {
      List<Map<String, dynamic>> kids = await getKidsByGuardianId(
          guardian_id); // Replace 123 with the actual guardian ID

      setState(() {
        kidsList = kids;
      });
    } catch (e) {
      // Handle errors
      print('Error fetching and storing kids: $e');
    }
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
                                    onPressed: () async {
                                      bool hasKids = await _hasKid();
                                      _username.text == retrieved.username
                                          ? (_password.text !=
                                                  retrieved.password
                                              ? launchGmail()
                                              : (hasKids
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
                                                      newRoute: MaterialPageRoute(
                                                          builder:
                                                              (newcontext) =>
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
                    onPressed: () async {
                      bool isValid = await _infoValid();
                      bool hasKids = await _hasKid();
                      if (isValid && hasKids) {
                        await _selectedKidBox.put('selectedKid', {
                          'kid_id': _kidsBox.get('kiddo0')['kid_id'],
                          'firstname':
                              _kidsBox.get('kiddo0')['firstname'].toString(),
                          'lastname':
                              _kidsBox.get('kiddo0')['lastname'].toString(),
                          'gender': _kidsBox.get('kiddo0')['gender'].toString(),
                          'allergies': _kidsBox.get('kiddo0')['allergies'][0],
                          'syndroms': _kidsBox.get('kiddo0')['syndroms'][0],
                          'hobbies': _kidsBox.get('kiddo0')['hobbies'][0],
                          'authorizedpickups':
                              _kidsBox.get('kiddo0')['authorizedpickups'][0],
                          'dateOfbirth': _kidsBox.get('kiddo0')['dateOfbirth'],
                          'relationTochild': _kidsBox
                              .get('kiddo0')['relationTochild']
                              .toString(),
                          'category_id': _kidsBox.get('kiddo0')['category_id'],
                        });
                        await _selectedKidBox.put('index', 0);
                        await _myBox.put('isConnected', true);

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainPage()));
                      } else if (isValid && !hasKids) {
                        await _myBox.put('isConnected', true);
                        Navigator.replace(
                          context,
                          oldRoute: ModalRoute.of(context)!,
                          newRoute: MaterialPageRoute(
                              builder: (context) => AddKid1()),
                        );
                      } else if (!isValid)
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
