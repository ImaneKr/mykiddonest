import 'package:appmobile/models/guardian.dart';
import 'package:appmobile/view/components/guardianInfoField.dart';
import 'package:appmobile/view/screens/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class GuardianProfile extends StatefulWidget {
  const GuardianProfile({Key? key}) : super(key: key);

  @override
  State<GuardianProfile> createState() => _GuardianProfileState();
}

class _GuardianProfileState extends State<GuardianProfile> {
  final _myBox = Hive.box('guardianData');

  late Guardian guardian;

  @override
  void initState() {
    super.initState();
    guardian = new Guardian(
      firstName: _myBox.get('firstname'),
      lastName: _myBox.get('lastname'),
      phoneNumber: _myBox.get('phonenumber'),
      username: _myBox.get('username'),
      password: _myBox.get('password'),
      adresseMail: _myBox.get('adressMail'),
      gender: _myBox.get('gender'),
      civilState: _myBox.get('civilstate'),
      address: _myBox.get('address'),
      //guardianPic: _myBox.get('guardianPic'),
    );
    ;
  }

  Future<void> _selectDate(BuildContext context) async {}

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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Log out',
                  style: TextStyle(
                      color: Color.fromARGB(255, 134, 138, 148),
                      fontFamily: 'inter',
                      fontSize: 15,
                      fontWeight: FontWeight.w400)))
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
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  /* border: Border.all(
                    color: Colors.black,
                    width: 0.8,
                  ),*/
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/mother.jpg'),
                  radius: 55,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              GuardianInfoField(
                initialValue: guardian.firstName ?? '',
                label: 'First name',
              ),
              SizedBox(
                height: 12,
              ),
              GuardianInfoField(
                initialValue: guardian.lastName ?? '',
                label: 'Last name',
              ),
              SizedBox(
                height: 12,
              ),
              GuardianInfoField(
                initialValue: guardian.gender ?? '',
                label: 'Gender',
              ),
              SizedBox(
                height: 12,
              ),
              GuardianInfoField(
                initialValue: guardian.civilState ?? '',
                label: 'Civil state',
              ),
              SizedBox(
                height: 12,
              ),
              GuardianInfoField(
                initialValue: guardian.username ?? '',
                label: 'Username',
              ),
              SizedBox(
                height: 12,
              ),
              GuardianInfoField(
                initialValue: guardian.password ?? '',
                label: 'Password',
                isPassword: true,
              ),
              SizedBox(
                height: 12,
              ),
              GuardianInfoField(
                initialValue: guardian.adresseMail ?? '',
                label: 'Email address',
              ),
              SizedBox(height: 12),
              GuardianInfoField(
                initialValue: guardian.phoneNumber ?? '',
                label: 'Phone number',
              ),
              SizedBox(
                height: 12,
              ),
              GuardianInfoField(
                initialValue: guardian.address ?? '',
                label: 'Address',
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
