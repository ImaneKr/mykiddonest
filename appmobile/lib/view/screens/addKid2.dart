import 'package:appmobile/view/components/kifInfoField.dart';
import 'package:appmobile/view/screens/mainPage.dart';
import 'package:flutter/material.dart';

class AddKid2 extends StatefulWidget {
  const AddKid2({Key? key}) : super(key: key);

  @override
  _AddKid2State createState() => _AddKid2State();
}

class _AddKid2State extends State<AddKid2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          KidInfoField(textHintf: 'Allergies', labelf: 'Allergies'),
          SizedBox(height: 20),
          KidInfoField(
            textHintf: 'Syndromes...',
            labelf: 'Syndromes',
          ),
          SizedBox(height: 20),
          KidInfoField(
            textHintf: 'Hobbies...',
            labelf: 'Hobbies',
          ),
          SizedBox(height: 20),
          KidInfoField(
              textHintf: 'mention', labelf: 'Authorized pick-up persons '),
          SizedBox(height: 20),
          KidInfoField(
              textHintf: 'Additional info...',
              labelf: 'Additional Information '),
          Container(
            padding: EdgeInsets.only(top: 40, left: 10, right: 10),
            child: Row(
              children: [
                TextButton.icon(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Color(0xFF8BC62A); // color when pressed
                        }
                        // color when idle
                        return Colors.black;
                      },
                    ),
                  ),
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back_ios_new_rounded),
                  label: Text(
                    'Back',
                    style: TextStyle(
                      fontFamily: 'roboto mono ',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(width: 160),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                    );
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
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
      )),
    );
  }
}
