import 'package:appmobile/models/kid.dart';
import 'package:appmobile/view/components/profileTextField.dart';
import 'package:appmobile/view/screens/editKid.dart';
import 'package:flutter/material.dart';
import 'package:appmobile/view/screens/payment.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'dart:convert'; // for encoding/decoding JSON
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class KidProfile extends StatefulWidget {
  KidProfile({super.key});

  @override
  State<KidProfile> createState() => _KidProfileState();
}

class _KidProfileState extends State<KidProfile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late Box _selectedKidBox;
  Kid selectedKid = Kid();

  String formatDate(DateTime dateTime) {
    // Using intl package to format the date
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(dateTime);
  }

  @override
  void initState() {
    super.initState();
    _selectedKidBox = Hive.box('selectedKid');
    _initializeSelectedKid();

    // Set up a listener for changes in the selectedKidBox
    _selectedKidBox.listenable().addListener(_updateSelectedKid);
  }

  void _initializeSelectedKid() {
    setState(() {
      selectedKid = Kid(
        firstName:
            _selectedKidBox.get('selectedKid')['firstname'].toString() ?? '',
        familyName:
            _selectedKidBox.get('selectedKid')['lastname'].toString() ?? '',
        gender: _selectedKidBox.get('selectedKid')['gender'].toString() ?? '',
        allergies: _selectedKidBox.get('selectedKid')['allergies'] ?? '',
        syndromes: _selectedKidBox.get('selectedKid')['syndroms'] ?? '',
        hobbies: _selectedKidBox.get('selectedKid')['hobbies'] ?? '',
        dateOfBirth: _selectedKidBox
            .get('selectedKid')['dateOfbirth'], // year , month , day
        authorizedPickupper:
            _selectedKidBox.get('selectedKid')['authorizedpickups'],
      );
    });
  }

  void _updateSelectedKid() {
    _initializeSelectedKid();
  }

  @override
  void dispose() {
    _selectedKidBox.listenable().removeListener(_updateSelectedKid);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                        backgroundImage: AssetImage('assets/images/aymen.jpg'),
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
                          selectedKid.gender == 'Male'
                              ? AppLocalizations.of(context)!.male
                              : AppLocalizations.of(context)!.female,
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
                              AppLocalizations.of(context)!.editProfile,
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
                  textLabelTop: AppLocalizations.of(context)!.dateOfBirth,
                  textHint: DateFormat(
                          'd MMMM', Localizations.localeOf(context).toString())
                      .format(selectedKid.dateOfBirth!),
                ),
                SizedBox(height: 5),
                ProfileTextField(
                  textLabelTop: AppLocalizations.of(context)!.allergies,
                  textHint: selectedKid.allergies,
                ),
                SizedBox(height: 5),
                ProfileTextField(
                  textLabelTop: AppLocalizations.of(context)!.syndromes,
                  textHint: selectedKid.syndromes,
                ),
                SizedBox(height: 5),
                ProfileTextField(
                  textLabelTop: AppLocalizations.of(context)!.hobbies,
                  textHint: selectedKid.hobbies,
                ),
                SizedBox(height: 5),
                ProfileTextField(
                  textLabelTop:
                      AppLocalizations.of(context)!.authorizedPickupPersons,
                  textHint: selectedKid.authorizedPickupper,
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
                  AppLocalizations.of(context)!.checkout,
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
    );
  }
}
