// ignore_for_file: file_names, prefer_const_constructors
import 'package:appmobile/view/components/profileTextField.dart';
import 'package:appmobile/view/screens/guardianProfile.dart';
import 'package:flutter/material.dart';
import 'package:appmobile/controller/kid_profile_controller.dart';
import 'package:appmobile/view/screens/payment.dart';
import 'package:appmobile/view/screens/edit_profile.dart';

class KidProfile extends StatefulWidget {
  KidProfile({super.key});

  @override
  State<KidProfile> createState() => _KidProfileState();
}

class _KidProfileState extends State<KidProfile> {
  //input controller
  //  final TextEditingController _fieldController = TextEditingController();
  // create instance of the controller kid
  final KidProfileController _kidProfileController = KidProfileController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              height: 125,
              width: 340,
            decoration: BoxDecoration(
                color: _kidProfileController.kidProfile.gender == 'Male'
                    ? Color(0xFFD6E6F7)
                    : Color(0xFFF9CAD2),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/aymen.jpg'),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                     Text(
                        '${_kidProfileController.firstName} ${_kidProfileController.lastName}',
                        // textAlign: A,
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                        Text(
                        '${_kidProfileController.gender}',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Inter',
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 7,
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
                        ),),
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
        
                ],
              ),
            ),

            SizedBox(
              height: 15.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileTextField(
                  textLabelTop: 'Date of Birth',
                  textHint: _kidProfileController.dateOfBirth,
                  //directly pass
                ),
                SizedBox(
                  height: 5,
                ),
                ProfileTextField(
                  textLabelTop: 'Allergies',
                  textHint: _kidProfileController.allergies,
                ),
                SizedBox(
                  height: 5,
                ),
                ProfileTextField(
                  textLabelTop: 'Syndromes',
                  textHint: _kidProfileController.syndromes,
                ),
                SizedBox(
                  height: 5,
                ),
                ProfileTextField(
                  textLabelTop: 'Hobbies',
                  textHint: _kidProfileController.hobbies,
                ),
                SizedBox(
                  height: 5,
                ),
                ProfileTextField(
                  textLabelTop: 'Authorized pick-up persons',
                  textHint: _kidProfileController.authorizedPickUpPersons,
                  // must affected without ${}, because using this we are turning the variable to string first, it not correct
                ),
                SizedBox(
                  height: 5,
                ),
                ////////////////////////////////////////////////////
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: _kidProfileController.gender == 'Male'
                      ? MaterialStateProperty.all<Color>(Color(0xFF00ADE9))
                      : MaterialStateProperty.all<Color>(Color(0xFFF7ABB8)),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(
                        horizontal: 28.0, vertical: 10.0), // Padding
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
    );
  }
}
