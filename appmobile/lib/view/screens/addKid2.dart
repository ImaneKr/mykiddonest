import 'dart:convert'; // for encoding/decoding JSON
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http; // for making HTTP requests
import 'package:appmobile/models/kid.dart';
import 'package:appmobile/view/components/kifInfoField.dart';
import 'package:appmobile/view/screens/mainPage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddKid2 extends StatefulWidget {
  const AddKid2({Key? key}) : super(key: key);

  @override
  _AddKid2State createState() => _AddKid2State();
}

String formatDate(DateTime dateTime) {
  // Using intl package to format the date
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  return formatter.format(dateTime);
}

List<String> stringToList(String value) {
  return [value];
}

class _AddKid2State extends State<AddKid2> {
  final myBox = Hive.box('guardianData');
  final _kidsBox = Hive.box('kidsData');
  final _selectedKidBox = Hive.box('selectedKid');
  Future<void> getkidsSubjects(int id) async {
    final url = 'https://backend-1-dg5f.onrender.com/evaluation/addmark/$id';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      );

      if (response.statusCode == 200) {
        print('Evaluation set correctly');
      } else if (response.statusCode == 404) {
        print('Kid not found');
      } else {
        print('Failed to set evaluation: ${response.statusCode}');
      }
    } catch (error) {
      print('Error setting evaluation: $error');
    }
  }

  late Kid kiddo;
  Future<void> createKidProfile(Kid kid) async {
    String url =
        'https://backend-1-dg5f.onrender.com/kid'; // Replace with your backend URL
    Map<String, dynamic> requestBody = {
      "guardianId": myBox
          .get('guardian_id'), // Example guardianId, replace with actual data
      "firstname": kid.firstName,
      "lastname": kid.familyName,
      "dateOfbirth":
          formatDate(kiddo.dateOfBirth!), // Example date, format: YYYY-MM-DD
      "gender": kid.gender,
      "allergies": stringToList(kid.allergies), // Example allergies array
      "hobbies": stringToList(kid.hobbies), // Example hobbies array
      "profilePic":
          "http://example.com/profile.jpg", // Example profile picture URL
      "syndromes": stringToList(kid.syndromes), // Example syndromes array
      "authorizedpickups": stringToList(kid.authorizedPickupper),
      "relationTochild":
          kid.relationshipToChild // Example authorized pickups array
    };

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );
      if (response.statusCode == 201) {
        var data = jsonDecode(response.body);
        print('Kid profile created successfully: $data');
        int nbKids = await _kidsBox.get('nbKids');
        await _kidsBox.put('kiddo$nbKids', {
          'kid_id': data['kid_id'],
          'firstname': data['firstname'],
          'lastname': data['lastname'],
          'gender': data['gender'],
          'dateOfbirth': DateFormat("yyyy-MM-dd").parse(data['dateOfbirth']),
          'allergies': data['allergies'],
          'hobbies': data['hobbies'],
          'syndroms': data['syndroms'],
          'authorizedpickups': data['authorizedpickups'],
          'guardian_id': data['guardian_id'],
          'category_id': data['category_id'],
          'kidId': data['kid_id'],
          'relationTochild': data['relationTochild']
        });
        await _kidsBox.put('nbKids', nbKids + 1);
        nbKids = await _kidsBox.get('nbKids');
        if (nbKids == 1) {
          await _selectedKidBox.put('selectedKid', {
            'kid_id': _kidsBox.get('kiddo0')['kid_id'],
            'firstname': _kidsBox.get('kiddo0')['firstname'].toString(),
            'lastname': _kidsBox.get('kiddo0')['lastname'].toString(),
            'gender': _kidsBox.get('kiddo0')['gender'].toString(),
            'allergies': _kidsBox.get('kiddo0')['allergies'][0],
            'syndroms': _kidsBox.get('kiddo0')['syndroms'][0],
            'hobbies': _kidsBox.get('kiddo0')['hobbies'][0],
            'authorizedpickups': _kidsBox.get('kiddo0')['authorizedpickups'][0],
            'dateOfbirth': _kidsBox.get('kiddo0')['dateOfbirth'],
            'relationTochild':
                _kidsBox.get('kiddo0')['relationTochild'].toString(),
            'category_id': _kidsBox.get('kiddo0')['category_id'],
          });
          await _selectedKidBox.put('index', 0);
        }
        int kiddoId = data['kid_id'];
        await getkidsSubjects(kiddoId);
      } else {
        print('Failed to create kid profile: ${response.statusCode}');
        // Handle other status codes or errors
      }
    } catch (error) {
      print('Error creating kid profile: $error');
      // Handle network errors
    }
  }

  @override
  Widget build(BuildContext context) {
    kiddo = ModalRoute.of(context)?.settings.arguments as Kid;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  KidInfoField(
                      textHintf: 'Allergies',
                      labelf: 'Allergies',
                      onChanged: (value) {
                        setState(() {
                          kiddo.allergies =
                              value; // Update the value in the parent widget
                        });
                      }),
                  SizedBox(height: 20),
                  KidInfoField(
                      textHintf: 'Syndromes...',
                      labelf: 'Syndromes',
                      onChanged: (value) {
                        setState(() {
                          kiddo.syndromes =
                              value; // Update the value in the parent widget
                        });
                      }),
                  SizedBox(height: 20),
                  KidInfoField(
                      textHintf: 'Hobbies...',
                      labelf: 'Hobbies',
                      onChanged: (value) {
                        setState(() {
                          kiddo.hobbies =
                              value; // Update the value in the parent widget
                        });
                      }),
                  SizedBox(height: 20),
                  KidInfoField(
                      textHintf: 'mention',
                      labelf: 'Authorized pick-up persons ',
                      onChanged: (value) {
                        setState(() {
                          kiddo.authorizedPickupper =
                              value; // Update the value in the parent widget
                        });
                      }),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 40, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Color(0xFF8BC62A); // color when pressed
                            }
                            // color when idle
                            return Colors.black;
                          },
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios_new_rounded),
                      label: Text(
                        'Back',
                        style: TextStyle(
                          fontFamily: 'roboto mono ',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await createKidProfile(kiddo);
                        // Mark the function as async
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => MainPage()),
                          (route) => false,
                        );
                      },
                      child: Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
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
                          (states) => states.contains(MaterialState.pressed)
                              ? Colors.lightBlue
                              : Colors.lightBlue, // color when idle
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
