import 'dart:convert';
import 'package:appmobile/models/guardian.dart';
import 'package:appmobile/view/components/guardianInfoField.dart';
import 'package:appmobile/view/screens/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class GuardianProfile extends StatefulWidget {
  const GuardianProfile({Key? key}) : super(key: key);

  @override
  State<GuardianProfile> createState() => _GuardianProfileState();
}

class _GuardianProfileState extends State<GuardianProfile> {
  final _myBox = Hive.box('guardianData');
  Guardian guardian = Guardian(username: '', password: '');
  late int id;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadGuardianData();
  }

  Future<Map<String, dynamic>> fetchGuardianData(int guardianId) async {
    final String baseUrl =
        'https://backend-1-dg5f.onrender.com'; // Replace with your actual backend URL
    final response = await http.get(Uri.parse('$baseUrl/guardian/$guardianId'));

    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load guardian info');
    }
  }

  Future<void> loadGuardianData() async {
    id = _myBox.get('guardian_id');
    try {
      Map<String, dynamic> guardianData = await fetchGuardianData(id);
      setState(() {
        isLoading = false;
        guardian = Guardian(
          id: guardianData['guardian_id'],
          firstName: guardianData['firstname'],
          lastName: guardianData['lastname'],
          phoneNumber: guardianData['phone_number'],
          username: guardianData['username'],
          password: guardianData['guardian_pwd'],
          adresseMail: guardianData['email'],
          gender: guardianData['gender'],
          civilState: guardianData['civilState'],
          address: guardianData['address'],
        );
      });
      await _myBox.put('guardian_id', guardian.id);
      await _myBox.put('firstname', guardian.firstName);
      await _myBox.put('lastname', guardian.lastName);
      await _myBox.put('phonenumber', guardian.phoneNumber);
      await _myBox.put('username', guardian.username);
      await _myBox.put('password', guardian.password);
      await _myBox.put('adressMail', guardian.adresseMail);
      await _myBox.put('gender', guardian.gender);
      await _myBox.put('civilstate', guardian.civilState);
      await _myBox.put('address', guardian.address);
      await _myBox.put('guardianPic', guardian.guardianPic);
    } catch (e) {
      print('Failed to load guardian data: $e');
    }
  }

  Future<void> editGuardian() async {
    final url = Uri.parse(
        'https://backend-1-dg5f.onrender.com/guardian/${guardian.id}');
    final Map<String, dynamic> data = {
      'firstname': guardian.firstName ?? '',
      'lastname': guardian.lastName ?? '',
      'gender': guardian.gender ?? '',
      'username': guardian.username ?? '',
      'guardian_pwd': guardian.password ?? '',
      'civilstate': guardian.civilState ?? '',
      'email': guardian.adresseMail ?? '',
      'phone_number': guardian.phoneNumber ?? '',
      'address': guardian.address ?? '',
    };

    try {
      final response = await http.put(
        url,
        body: jsonEncode(data),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        await updateGuardianData(responseData);
        Navigator.pop(context);
      } else {
        final errorData = json.decode(response.body);
        print('Failed to update guardian: $errorData');
      }
    } catch (e) {
      print('Error updating guardian: $e');
    }
  }

  Future<void> updateGuardianData(Map<String, dynamic> data) async {
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
    print('Guardian updated successfully: $data');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'My account',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await Hive.box('guardianData').clear();
              await Hive.box('kidsData').clear();
              await Hive.box('connection').clear();
              await Hive.box('selectedKid').clear();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (Route<dynamic> route) =>
                    false, // This removes all the previous routes
              );
            },
            child: Text(
              'Log out',
              style: TextStyle(
                color: Color.fromARGB(255, 134, 138, 148),
                fontFamily: 'inter',
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        // Implement image picker here if needed
                      },
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage('assets/images/mother.jpg'),
                      ),
                    ),
                    SizedBox(height: 12),
                    GuardianInfoField(
                      initialValue: guardian.firstName ?? '',
                      label: 'First name',
                      onChange: (value) {
                        setState(() {
                          guardian.firstName = value;
                        });
                      },
                    ),
                    SizedBox(height: 12),
                    GuardianInfoField(
                      initialValue: guardian.lastName ?? '',
                      label: 'Last name',
                      onChange: (value) {
                        setState(() {
                          guardian.lastName = value;
                        });
                      },
                    ),
                    SizedBox(height: 12),
                    GuardianInfoField(
                      initialValue: guardian.gender ?? '',
                      label: 'Gender',
                      onChange: (value) {
                        setState(() {
                          guardian.gender = value;
                        });
                      },
                    ),
                    SizedBox(height: 12),
                    GuardianInfoField(
                      initialValue: guardian.civilState ?? '',
                      label: 'Civil state',
                      onChange: (value) {
                        setState(() {
                          guardian.civilState = value;
                        });
                      },
                    ),
                    SizedBox(height: 12),
                    GuardianInfoField(
                      initialValue: guardian.username ?? '',
                      label: 'Username',
                      onChange: (value) {
                        setState(() {
                          guardian.username = value;
                        });
                      },
                    ),
                    SizedBox(height: 12),
                    GuardianInfoField(
                      initialValue: guardian.password ?? '',
                      label: 'Password',
                      isPassword: true,
                      onChange: (value) {
                        setState(() {
                          guardian.password = value;
                        });
                      },
                    ),
                    SizedBox(height: 12),
                    GuardianInfoField(
                      initialValue: guardian.adresseMail ?? '',
                      label: 'Email address',
                      onChange: (value) {
                        setState(() {
                          guardian.adresseMail = value;
                        });
                      },
                    ),
                    SizedBox(height: 12),
                    GuardianInfoField(
                      initialValue: guardian.phoneNumber ?? '',
                      label: 'Phone number',
                      onChange: (value) {
                        setState(() {
                          guardian.phoneNumber = value;
                        });
                      },
                    ),
                    SizedBox(height: 12),
                    GuardianInfoField(
                      initialValue: guardian.address ?? '',
                      label: 'Address',
                      onChange: (value) {
                        setState(() {
                          guardian.address = value;
                        });
                      },
                    ),
                    SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: editGuardian,
                      child: Text(
                        'Save Changes',
                        style: TextStyle(
                          fontFamily: 'inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.lightBlue,
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
