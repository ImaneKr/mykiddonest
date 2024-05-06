// ignore_for_file: file_names, prefer_const_constructors
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
//import 'package:flutter/rendering.dart';
//import 'package:flutter/services.dart';
//import 'package:flutter/widgets.dart';
//import 'package:appmobile/controller/kid_profile_controller.dart';
//import 'package:image_picker/image_picker.dart';
//import 'package:appmobile/view/bodies/KidProfile.dart';

class EditProfile extends StatefulWidget {
  @override
  const EditProfile({Key? key}) : super(key: key);
  _EditProfile createState() => _EditProfile();
}

class _EditProfile extends State<EditProfile> {
  FocusNode _focusNode = FocusNode();
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  File? _imageFile;

  // //Function to pick image from gallery
  Future<void> _pickImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
  }

  TextEditingController _date = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? chosen = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2100));
    if (chosen != null && chosen != DateTime.now()) {
      setState(() {
        _date.text = chosen.toString().split(' ')[0];
      });
    }
  }

  void saveChanges() {}

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Edit Profile',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
          actions: [
          // Additional actions (if needed)
 Row(
children: [ 
   TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.done),
                  label: Text('Done'),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Color.fromARGB(253, 226, 225, 229);
                        }
                        return Colors.black;
                      },
                    ),
                  ), 
                ),
],
)
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: <Widget>[
          SizedBox(
            height: 5.0,
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
            height: 12.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  top: 17,
                  bottom: 2,
                ),
                child: Text(
                  'First Name',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
          TextFormField(
            obscureText: false,
            focusNode: _focusNode,
            decoration: InputDecoration(
                //filled: State.hasFocus,
                fillColor: Colors.yellow,
                contentPadding: EdgeInsets.only(left: 10, top: 10, bottom: 2),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xAFAFAF)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF00ADE9)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                hintText: 'Aymen',
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 61, 57, 57),
                  fontSize: 14,
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  top: 17,
                  bottom: 2,
                ),
                child: Text(
                  'Last Name',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
          TextFormField(
            obscureText: false,
            decoration: InputDecoration(
                // fillColor: Color.fromARGB(253, 226, 225, 229),
                // filled: true,
                contentPadding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color.fromARGB(0, 77, 77, 77)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF00ADE9)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                hintText: 'Benaissa',
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 61, 57, 57),
                  fontSize: 14,
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  top: 17,
                  bottom: 2,
                ),
                child: Text(
                  'Date of Birth',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
          TextFormField(
            controller: _date,
            obscureText: false,
            decoration: InputDecoration(
                //  fillColor: Color.fromARGB(253, 226, 225, 229),
                //filled: true,
                contentPadding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color.fromARGB(0, 77, 77, 77)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF00ADE9)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () => _selectDate(context),
                  icon: Icon(Icons.calendar_today_rounded),
                ),
                hintText: 'DD/MM/YYYY',
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 61, 57, 57),
                  fontSize: 14,
                )),
            readOnly: true,
            onTap: () => _selectDate(context),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  top: 17,
                  bottom: 2,
                ),
                child: Text(
                  'Allergies',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
          TextFormField(
            obscureText: false,
            decoration: InputDecoration(
                //fillColor: Color.fromARGB(253, 226, 225, 229),
                //filled: true,
                contentPadding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color.fromARGB(0, 77, 77, 77)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF00ADE9)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                hintText: 'Fish Allergy,Flowers',
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 61, 57, 57),
                  fontSize: 14,
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  top: 17,
                  bottom: 2,
                ),
                child: Text(
                  'Syndromes',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
          TextFormField(
            obscureText: false,
            decoration: InputDecoration(
                // fillColor: Color.fromARGB(253, 226, 225, 229),
                //filled: true,
                contentPadding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color.fromARGB(0, 77, 77, 77)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF00ADE9)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                hintText: 'None',
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 61, 57, 57),
                  fontSize: 14,
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  top: 17,
                  bottom: 2,
                ),
                child: Text(
                  'Hobbies',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
          TextFormField(
            obscureText: false,
            decoration: InputDecoration(
                //fillColor: Color.fromARGB(253, 226, 225, 229),
                //filled: true,
                contentPadding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color.fromARGB(0, 77, 77, 77)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF00ADE9)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                hintText: 'Drawing,Playing Piaon',
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 61, 57, 57),
                  fontSize: 14,
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  top: 17,
                  bottom: 2,
                ),
                child: Text(
                  'Authorized Pick-up Person',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
          TextFormField(
            obscureText: false,
            decoration: InputDecoration(
                //fillColor: Color.fromARGB(253, 226, 225, 229),
                //filled: true,
                contentPadding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color.fromARGB(0, 77, 77, 77)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF00ADE9)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                hintText: 'Benaissa Mohammed',
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 61, 57, 57),
                  fontSize: 14,
                )),
          ),
        ],
      ),
    );
  }
}
