import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hive_flutter/hive_flutter.dart';

import 'package:appmobile/models/kid.dart';
import 'package:appmobile/view/components/guardianInfoField.dart';
import 'package:intl/intl.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late Kid selectedKid = Kid();
  final _selectedKidBox = Hive.box('selectedKid');
  final _kidsBox = Hive.box('kidsData');

  String formatDate(DateTime dateTime) {
    // Using intl package to format the date
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(dateTime);
  }

  List<String> stringToList(String value) {
    return [value];
  }

  @override
  void initState() {
    super.initState();
    selectedKid = Kid(
        kidId: _selectedKidBox.get('selectedKid')['kid_id'] ?? 0,
        firstName:
            _selectedKidBox.get('selectedKid')['firstname'].toString() ?? '',
        familyName:
            _selectedKidBox.get('selectedKid')['lastname'].toString() ?? '',
        gender: _selectedKidBox.get('selectedKid')['gender'].toString() ?? '',
        allergies:
            _selectedKidBox.get('selectedKid')['allergies'].toString() ?? '',
        syndromes:
            _selectedKidBox.get('selectedKid')['syndroms'].toString() ?? '',
        hobbies: _selectedKidBox.get('selectedKid')['hobbies'].toString() ?? '',
        dateOfBirth: _selectedKidBox.get('selectedKid')['dateOfbirth'] ?? '',
        authorizedPickupper: _selectedKidBox
                .get('selectedKid')['authorizedpickups']
                .toString() ??
            '',
        relationshipToChild:
            _selectedKidBox.get('selectedKid')['relationTochild'].toString() ??
                '');
  }

  editKidData() async {
    Map<String, dynamic> edited = {
      'firstname': selectedKid.firstName,
      'lastname': selectedKid.familyName,
      'gender': selectedKid.gender,
      'relationTochild': selectedKid.relationshipToChild,
      'dateOfbirth': formatDate(
          selectedKid.dateOfBirth!), // Should be in ISO format: 'YYYY-MM-DD'
      'allergies': stringToList(selectedKid.allergies), // Array of allergies
      'hobbies': stringToList(selectedKid.hobbies), // Array of hobbies
      'authorizedpickups':
          stringToList(selectedKid.hobbies), // Array of authorized pickups
      'syndromes': stringToList(selectedKid.syndromes),
    };

    try {
      // Make PUT request to update the kid's profile
      var response = await http.put(
        Uri.parse(
            'https://backend-1-dg5f.onrender.com/kid/${selectedKid.kidId}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          // Add any additional headers if required
        },
        body: jsonEncode(edited),
      );

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print('Kid profile updated successfully');
        int index = await Hive.box('selectedKid').get('index');
        await _kidsBox.put('kiddo$index', {
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
        await _selectedKidBox.put('selectedKid', {
          'kid_id': _kidsBox.get('kiddo$index')['kid_id'],
          'firstname': _kidsBox.get('kiddo$index')['firstname'].toString(),
          'lastname': _kidsBox.get('kiddo$index')['lastname'].toString(),
          'gender': _kidsBox.get('kiddo$index')['gender'].toString(),
          'allergies': _kidsBox.get('kiddo$index')['allergies'][0],
          'syndroms': _kidsBox.get('kiddo$index')['syndroms'][0],
          'hobbies': _kidsBox.get('kiddo$index')['hobbies'][0],
          'authorizedpickups': _kidsBox.get('kiddo$index')['authorizedpickups']
              [0],
          'dateOfbirth': _kidsBox.get('kiddo$index')['dateOfbirth'],
          'relationTochild':
              _kidsBox.get('kiddo$index')['relationTochild'].toString()
        });
      } else {
        // Handle errors if the request was not successful
        print(
            'Failed to update kid profile. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (error) {
      // Handle any exceptions that occur during the request
      print('Error updating kid profile: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Edit profile',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              editKidData();
              Navigator.pop(
                  context); // Replace current route with the profile page
            },
            child: Row(
              children: [
                Icon(
                  Icons.done,
                  color: Colors.grey.shade300,
                ),
                Text(
                  'Done',
                  style: TextStyle(
                    color: Color.fromARGB(255, 134, 138, 148),
                    fontFamily: 'inter',
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15),
              Center(
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: selectedKid.gender == 'Male'
                          ? Colors.blue.shade100
                          : Colors.pink.shade100, // Border color
                      width: 1.0, // Border width
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: selectedKid.gender == 'Male'
                        ? AssetImage('assets/images/kid.jpg')
                        : AssetImage('assets/images/girl.jpg'),
                  ),
                ),
              ),
              SizedBox(height: 12),
              GuardianInfoField(
                initialValue: selectedKid.firstName,
                label: 'First name',
                onChange: (value) {
                  setState(() {
                    selectedKid.firstName = value;
                  }); // Trigger rebuild to update UI
                },
              ),
              SizedBox(height: 12),
              GuardianInfoField(
                initialValue: selectedKid.familyName,
                label: 'Last name',
                onChange: (value) {
                  setState(() {
                    selectedKid.familyName = value;
                  }); // Trigger rebuild to update UI
                },
              ),
              SizedBox(height: 12),
              GuardianInfoField(
                initialValue: selectedKid.gender,
                label: 'Gender',
                onChange: (value) {
                  setState(() {
                    selectedKid.gender = value;
                  }); // Trigger rebuild to update UI
                },
              ),
              SizedBox(height: 12),
              GuardianInfoField(
                initialValue: selectedKid.dateOfBirth!,
                label: 'Date Of birth',
                onChange: (value) {
                  setState(() {
                    selectedKid.dateOfBirth = DateTime.parse(value);
                  }); // Trigger rebuild to update UI
                },
                isDate: true,
              ),
              SizedBox(height: 12),
              GuardianInfoField(
                initialValue: selectedKid.hobbies,
                label: 'Hobbies',
                onChange: (value) {
                  setState(() {
                    selectedKid.hobbies = value;
                  }); // Trigger rebuild to update UI
                },
              ),
              SizedBox(height: 12),
              GuardianInfoField(
                initialValue: selectedKid.syndromes,
                label: 'Syndromes',
                onChange: (value) {
                  setState(() {
                    selectedKid.syndromes = value;
                  }); // Trigger rebuild to update UI
                },
              ),
              SizedBox(height: 12),
              GuardianInfoField(
                initialValue: selectedKid.allergies,
                label: 'Allergies',
                onChange: (value) {
                  setState(() {
                    selectedKid.allergies = value;
                  }); // Trigger rebuild to update UI
                },
              ),
              SizedBox(height: 12),
              GuardianInfoField(
                initialValue: selectedKid.authorizedPickupper,
                label: 'Authorized pick-up persons',
                onChange: (value) {
                  setState(() {
                    selectedKid.authorizedPickupper = value;
                  }); // Trigger rebuild to update UI
                },
              ),
              SizedBox(height: 12),
              GuardianInfoField(
                initialValue: selectedKid.relationshipToChild,
                label: 'Relationship to child',
                onChange: (value) {
                  setState(() {
                    selectedKid.relationshipToChild = value;
                  }); // Trigger rebuild to update UI
                },
              ),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  editKidData();
                  Navigator.pop(context);
                },
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
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
      ),
    );
  }
}
