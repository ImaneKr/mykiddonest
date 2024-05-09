import 'package:appmobile/view/screens/addKid2.dart';
import 'package:appmobile/view/screens/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:appmobile/view/components/kifInfoField.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddKid1 extends StatefulWidget {
  @override
  _AddKid1State createState() => _AddKid1State();
}

class _AddKid1State extends State<AddKid1> {
  String _selected = 'Male';
  TextEditingController _dateController = TextEditingController();
  File? _imageFile;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dateController.text =
            picked.toString().split(' ')[0]; // Format the date as needed
      });
    }
  }

  Future<void> _pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
  }

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
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 80, // Adjust the size as needed
                    backgroundImage: AssetImage(
                        'assets/images/kid.jpg'), // Provide the image path
                  ),
                  Positioned(
                    bottom: 2,
                    right: 0,
                    child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.white,
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
            KidInfoField(textHintf: 'First name', labelf: 'First name'),
            SizedBox(height: 20),
            KidInfoField(textHintf: 'Last  name', labelf: 'Last name'),
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
            ),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddKid2()),
                      );
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
