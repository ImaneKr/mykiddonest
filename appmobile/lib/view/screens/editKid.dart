import 'dart:io';

import 'package:appmobile/models/guardian.dart';
import 'package:appmobile/models/kid.dart';
import 'package:appmobile/view/bodies/kidProfile.dart';
import 'package:appmobile/view/components/guardianInfoField.dart';
import 'package:appmobile/view/screens/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late Kid selectedKid = Kid();
  final _selectedKidBox = Hive.box('selectedKid');
  @override
  void initState() {
    super.initState();
    selectedKid = Kid(
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
      dateOfBirth: _selectedKidBox
          .get('selectedKid')['dateOfbirth'], // year , month , day
      authorizedPickupper:
          _selectedKidBox.get('selectedKid')['authorizedpickups'].toString(),
    );
  }

  File? _imageFile;

  Future<void> _pickImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
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
                Navigator.replace(context,
                    oldRoute: ModalRoute.of(context)!,
                    newRoute: MaterialPageRoute(
                        builder: (context) =>
                            KidProfile())); // Replace current route with the profile page
              },
              child: Row(
                children: [
                  Icon(
                    Icons.done,
                    color: Colors.grey.shade300,
                  ),
                  Text('Done',
                      style: TextStyle(
                          color: Color.fromARGB(255, 134, 138, 148),
                          fontFamily: 'inter',
                          fontSize: 15,
                          fontWeight: FontWeight.w400))
                ],
              ))
        ],
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 65,
                      backgroundImage: AssetImage('assets/images/aymen.jpg'),
                    ),
                    Positioned(
                      bottom: 2,
                      right: 0,
                      child: Container(
                          padding: EdgeInsets.zero,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                              onPressed: _pickImageFromGallery,
                              icon: Icon(
                                Icons.add_a_photo_rounded,
                                color: Color(0xFF00ADE9),
                              ))),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              GuardianInfoField(
                initialValue: selectedKid.firstName ?? '',
                label: 'First name',
              ),
              SizedBox(
                height: 12,
              ),
              GuardianInfoField(
                initialValue: selectedKid.familyName ?? '',
                label: 'Last name',
              ),
              SizedBox(
                height: 12,
              ),
              GuardianInfoField(
                initialValue: selectedKid.gender ?? '',
                label: 'Gender',
              ),
              SizedBox(
                height: 12,
              ),
              /*      GuardianInfoField(
                initialValue: selectedKid.civilSt?? '',
                label: 'Civil state',
              ),*/
              SizedBox(
                height: 12,
              ),
              GuardianInfoField(
                initialValue: selectedKid.hobbies ?? '',
                label: 'Hobbies',
              ),
              SizedBox(
                height: 12,
              ),
              GuardianInfoField(
                initialValue: selectedKid.syndromes ?? '',
                label: 'Syndromes',
              ),
              SizedBox(
                height: 12,
              ),
              GuardianInfoField(
                initialValue: selectedKid.allergies ?? '',
                label: 'Allergies',
              ),
              SizedBox(height: 12),
              GuardianInfoField(
                initialValue: selectedKid.authorizedPickupper ?? '',
                label: 'Authorized pick-up persons',
              ),
              SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 12,
              ),
              ElevatedButton(
                onPressed: () {},
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
