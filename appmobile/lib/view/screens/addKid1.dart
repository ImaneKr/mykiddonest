import 'package:appmobile/models/kid.dart';
import 'package:flutter/material.dart';
import 'package:appmobile/view/components/kifInfoField.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddKid1 extends StatefulWidget {
  @override
  _AddKid1State createState() => _AddKid1State();
}

class _AddKid1State extends State<AddKid1> {
  String _selected = 'Male';
  final _selectedKidBox = Hive.box('selectedKid');

  @override
  void initState() {
    super.initState();
    kiddo.gender = _selected;
  }

  late Kid kiddo = new Kid();
  TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = picked.toString().split(' ')[0];
        kiddo.dateOfBirth = picked;
// Format the date as needed
      });
    }
  }

  Future<void> _pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        kiddo.imageUrl = File(pickedImage.path);
        kiddo.isSet = true;
      });
    }
  }

  final myBox = Hive.box('guardianData');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40),
            ),
            Center(
                child: GestureDetector(
              onTap: _pickImageFromGallery,
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 80, // Adjust the size as needed
                    backgroundImage: kiddo.isSet
                        ? FileImage(kiddo
                            .imageUrl!) // Cast FileImage to ImageProvider<Object>
                        : AssetImage(
                            _selected == 'Male'
                                ? 'assets/images/kid.jpg'
                                : 'assets/images/girl.jpg') as ImageProvider<
                            Object>, // Cast AssetImage to ImageProvider<Object>
                  ),
                  Positioned(
                    top: 120,
                    left: 120,
                    child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
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
            )),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Add my kid',
                style: TextStyle(
                  fontFamily: 'roboto mono',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            KidInfoField(
                textHintf: 'First name',
                labelf: 'First name',
                onChanged: (value) {
                  setState(() {
                    kiddo.firstName =
                        value; // Update the value in the parent widget
                  });
                }),
            SizedBox(height: 20),
            KidInfoField(
                textHintf: 'Last  name',
                labelf: 'Last name',
                onChanged: (value) {
                  setState(() {
                    kiddo.familyName =
                        value; // Update the value in the parent widget
                  });
                }),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\t\t' + 'Date of birth',
                    style: TextStyle(
                      fontFamily: 'intel',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  TextFormField(
                    controller: _dateController,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.only(left: 10, top: 10, bottom: 10),
                      hintText: 'DD/MM/YY',
                      hintStyle: TextStyle(
                          fontFamily: 'roboto mono ',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xFF4B4949)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF00ADE9)),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () => _selectDate(context),
                        icon: Icon(Icons.calendar_today),
                      ),
                    ),
                    readOnly: true,
                    onTap: () => _selectDate(context),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            KidInfoField(
                labelf: 'Relationship to child',
                textHintf: 'Relationship ..',
                onChanged: (value) {
                  setState(() {
                    kiddo.relationshipToChild =
                        value; // Update the value in the parent widget
                  });
                }),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 10),
                Radio(
                  activeColor: Color(0xFF00ADE9),
                  value: 'Male',
                  groupValue: _selected,
                  onChanged: (value) {
                    setState(() {
                      _selected = value!;
                      kiddo.gender = _selected;
                    });
                  },
                ),
                Text('Male'),
                SizedBox(width: 50),
                Radio(
                  activeColor: Color(0xFF00ADE9),
                  value: 'Female',
                  groupValue: _selected,
                  onChanged: (value) {
                    setState(() {
                      _selected = value!;
                      kiddo.gender = _selected;
                    });
                  },
                ),
                Text('Female'),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 20, left: 10, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (kiddo.familyName == '' ||
                          kiddo.firstName == '' ||
                          (kiddo.dateOfBirth) == null ||
                          kiddo.gender == '')
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
                                      padding: const EdgeInsets.all(15),
                                      child: Text(
                                        'Please fill the important fields and try again',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'poppins',
                                          fontSize: 19,
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
                                          'Close',
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
                      else
                        Navigator.pushNamed(context, '/addKid2',
                            arguments: kiddo);
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(color: Colors.white),
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
          ],
        ),
      ),
    );
  }
}
