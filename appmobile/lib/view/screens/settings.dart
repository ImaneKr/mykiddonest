import 'package:appmobile/view/bodies/homepage.dart';
import 'package:appmobile/view/bodies/sideBar.dart';
import 'package:appmobile/view/bodies/kidProfile.dart';
import 'package:appmobile/view/screens/guardianProfile.dart';
import 'package:appmobile/view/screens/mainPage.dart';
import 'package:appmobile/view/screens/notification.dart';
import 'package:flutter/material.dart';
import 'package:appmobile/controller/kid_profile_controller.dart';
import 'package:appmobile/view/screens/payment.dart';
import 'package:appmobile/view/screens/edit_profile.dart';
import 'package:flutter/widgets.dart';
import 'package:appmobile/controller/guardian_controller.dart';
import 'package:appmobile/controller/user_controller.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final GuardianController _guardianAccountController = GuardianController();
  final UserController _userController = UserController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // No app bar
      home: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(12),
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              child: Stack(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Color.fromARGB(253, 226, 225, 229);
                              }
                              return Colors.black;
                            },
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MainPage()),
                          );
                        },
                        icon: Icon(Icons.close),
                        label: Text(''),
                      ),
                      SizedBox(width: 10),
                      Center(
                        child: Text(
                          AppLocalizations.of(context)!.settings,
                          style: TextStyle(
                            fontFamily: 'intel',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 100),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              height: 125,
              width: 340,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
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
                      backgroundImage: AssetImage('assets/images/mother.jpg'),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        '${_guardianAccountController.guardian.firstName} ${_guardianAccountController.guardian.familyName}',
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Stack(
                          children: [
                            SizedBox(
                              width: 10,
                              height: 2,
                            ),
                            Text(
                              '@${_userController.user.username}',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                color: Color.fromARGB(255, 158, 155, 155),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              height: 2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: Stack(
                      children: [
                        TextButton.icon(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Color.fromARGB(253, 226, 225, 229);
                                }
                                return Color.fromARGB(255, 63, 60, 60);
                              },
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GuardianProfile()),
                            );
                          },
                          icon: Icon(
                            Icons.edit_outlined,
                            size: 30,
                            color: Colors.black,
                          ),
                          label: Text(''),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
                    AppLocalizations.of(context)!.account,
                    style: TextStyle(
                      fontFamily: 'intel',
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 6),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.black,
              ),
              title: Text(AppLocalizations.of(context)!.personalInformation),
              trailing: Icon(
                Icons.arrow_forward_ios,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GuardianProfile()),
                );
              },
            ),
            Divider(),
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
                    AppLocalizations.of(context)!.appearance,
                    style: TextStyle(
                      fontFamily: 'intel',
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 6),
            ListTile(
              leading: Icon(
                Icons.dark_mode_rounded,
                color: Colors.black,
              ),
              title: Text(AppLocalizations.of(context)!.nightMode),
              trailing: Switch(
                value: false,
                onChanged: (bool value) {},
              ),
            ),
            Divider(),
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
                    AppLocalizations.of(context)!.otherSettings,
                    style: TextStyle(
                      fontFamily: 'intel',
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            ListTile(
              leading: Icon(
                Icons.notifications,
                color: Colors.black,
              ),
              title: Text(AppLocalizations.of(context)!.notification),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MyNotification()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.payment,
                color: Colors.black,
              ),
              //iconColor: Colors.black,
              title: Text(AppLocalizations.of(context)!.payment),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Payment()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
