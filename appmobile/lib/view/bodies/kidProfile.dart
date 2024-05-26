import 'package:appmobile/models/kid.dart';
import 'package:appmobile/view/components/profileTextField.dart';
import 'package:appmobile/view/screens/editKid.dart';
import 'package:flutter/material.dart';
import 'package:appmobile/view/screens/payment.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'dart:convert'; // for encoding/decoding JSON
import 'package:http/http.dart' as http;

class KidProfile extends StatefulWidget {
  KidProfile({super.key});

  @override
  State<KidProfile> createState() => _KidProfileState();
}

class _KidProfileState extends State<KidProfile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _selectedKidBox = Hive.box('selectedKid');
  Kid selectedKid = Kid();

  @override
  void initState() {
    super.initState();
    loadKidData();
  }

  Future<Map<String, dynamic>> fetchKidData(int kidId) async {
    final String baseUrl =
        'https://backend-1-dg5f.onrender.com'; // Replace with your actual backend URL
    final response = await http.get(Uri.parse('$baseUrl/kid/$kidId'));

    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load kid info');
    }
  }

  Future<void> loadKidData() async {
    setState(() {
      selectedKid = Kid(
        kidId: _selectedKidBox.get('selectedKid')['kid_id'],
      );
    });

    try {
      Map<String, dynamic> kidData = await fetchKidData(selectedKid.kidId);
      setState(() {
        selectedKid = Kid(
          kidId: kidData['kid_id'],
          firstName: kidData['firstname'],
          familyName: kidData['lastname'],
          gender: kidData['gender'],
          dateOfBirth: DateTime.parse(kidData['dateOfbirth'])!,
          allergies: kidData['allergies'][0],
          syndromes: kidData['syndroms'][0],
          hobbies: kidData['hobbies'][0],
          authorizedPickupper: kidData['authorizedpickups'][0],
          relationshipToChild: kidData['relationTochild'],
        );
        _selectedKidBox.put('selectedKid', {
          'kid_id': selectedKid.kidId,
          'firstname': selectedKid.firstName,
          'lastname': selectedKid.familyName,
          'gender': selectedKid.gender,
          'allergies': selectedKid.allergies,
          'syndroms': selectedKid.syndromes,
          'hobbies': selectedKid.hobbies,
          'authorizedpickups': selectedKid.authorizedPickupper,
          'dateOfbirth': selectedKid.dateOfBirth,
          'relationTochild': selectedKid.relationshipToChild,
          'category_id': selectedKid.category_id,
        });
      });
    } catch (e) {
      print('Failed to load kid data: $e');
    }
  }

  Future<void> _refreshData() async {
    await loadKidData();
  }

  String formatDate(DateTime dateTime) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  height: 125,
                  width: 340,
                  decoration: BoxDecoration(
                    color: selectedKid.gender == 'Male'
                        ? Color(0xFFD6E6F7)
                        : Color.fromARGB(188, 247, 184, 219),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: selectedKid.gender == 'Male'
                                ? AssetImage('assets/images/kid.jpg')
                                : AssetImage('assets/images/girl.jpg'),
                          ),
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            Text(
                              '${selectedKid.firstName} ${selectedKid.familyName}',
                              style: TextStyle(
                                fontSize: 22,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              '${selectedKid.gender}',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Inter',
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditProfile()),
                                  );
                                },
                                child: Text(
                                  'Edit profile',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 30),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileTextField(
                      textLabelTop: 'Date of Birth',
                      textHint: selectedKid.dateOfBirth,
                    ),
                    SizedBox(height: 5),
                    ProfileTextField(
                      textLabelTop: 'Allergies',
                      textHint: selectedKid.allergies,
                    ),
                    SizedBox(height: 5),
                    ProfileTextField(
                      textLabelTop: 'Syndromes',
                      textHint: selectedKid.syndromes,
                    ),
                    SizedBox(height: 5),
                    ProfileTextField(
                      textLabelTop: 'Hobbies',
                      textHint: selectedKid.hobbies,
                    ),
                    SizedBox(height: 5),
                    ProfileTextField(
                      textLabelTop: 'Authorized pick-up persons',
                      textHint: selectedKid.authorizedPickupper,
                    ),
                    SizedBox(height: 5),
                    ProfileTextField(
                      textLabelTop: 'Relationship to child',
                      textHint: selectedKid.relationshipToChild,
                    ),
                    SizedBox(height: 5),
                  ],
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: selectedKid.gender == 'Male'
                          ? MaterialStateProperty.all<Color>(Color(0xFF00ADE9))
                          : MaterialStateProperty.all<Color>(
                              Color.fromARGB(188, 247, 184, 219)),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(horizontal: 28.0, vertical: 10.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Payment()),
                      );
                    },
                    child: Text(
                      'Checkout',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
