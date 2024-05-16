import 'package:appmobile/models/guardian.dart';
import 'package:appmobile/models/kid.dart';
import 'package:appmobile/view/components/kidSelection.dart';
import 'package:appmobile/view/screens/addKid1.dart';
import 'package:appmobile/view/screens/guardianProfile.dart';
import 'package:appmobile/view/screens/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:appmobile/view/screens/settings.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  Kid? selectedKid;
  List<Kid> kids = [];
  final _myBox = Hive.box('guardianData');
  final _kidsBox = Hive.box('kidsData');
  final _selectedKidBox = Hive.box('selectedKid');

  late Guardian guardian;
  String? selectedMenuItem;
  bool isExpanded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    guardian = Guardian(
        username: _myBox.get('username'),
        password: _myBox.get('password'),
        firstName: _myBox.get('firstname'),
        lastName: _myBox.get('lastname'));
    for (int i = 0; i < _kidsBox.get('nbKids'); i++) {
      String iTostring = i.toString();
      kids.add(Kid(
        kidId: _kidsBox.get('kiddo$iTostring')['kid_id'],
        firstName: _kidsBox.get('kiddo$iTostring')['firstname'].toString(),
        familyName: _kidsBox.get('kiddo$iTostring')['lastname'].toString(),
        dateOfBirth: _kidsBox.get('kiddo$iTostring')['dateOfbirth'],
        gender: _kidsBox.get('kiddo$iTostring')['gender'],
        allergies: _kidsBox.get('kiddo$iTostring')['allergies'][0],
        syndromes: _kidsBox.get('kiddo$iTostring')['syndroms'][0],
        hobbies: _kidsBox.get('kiddo$iTostring')['hobbies'][0],
        authorizedPickupper:
            _kidsBox.get('kiddo$iTostring')['authorizedpickups'][0],
        relationshipToChild:
            _kidsBox.get('kiddo$iTostring')['firstname'].toString(),
      ));
    }
    selectedKid = kids[_selectedKidBox.get('index')];
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.only(
          top: 50.0,
        ),
        color: Colors.white,
        child: Column(
          children: [
            Column(children: [
              Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/icon.PNG',
                      height: 55,
                      width: 55,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'MyKiddoNest',
                      style: TextStyle(
                        fontFamily: 'inter',
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              )
            ]),
            SizedBox(
              height: 13,
            ),
            Container(
              height: 1.9,
              width: 220,
              /* decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 5,
                    offset: Offset(0, 6.5), // changes position of shadow
                  ),
                ],
              ),*/
              child: Divider(
                color: Color.fromARGB(49, 106, 105, 105),
                thickness: 1.7,
                height: 20,
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ExpansionTile(
                      backgroundColor: Colors.transparent,
                      title: Text(
                        'My Kids Profiles',
                        style: TextStyle(
                          fontFamily: 'inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: isExpanded ? Color(0xFF8BC62A) : Colors.black,
                        ),
                      ),
                      onExpansionChanged: (expanded) {
                        setState(() {
                          isExpanded = expanded;
                        });
                      },
                      leading: Container(
                        height: 40,
                        width: 40,
                        child: isExpanded
                            ? Image.asset('assets/icons/kidsSelected.png')
                            : Image.asset('assets/icons/kids.png'),
                      ),
                      children: [
                        if (kids.isNotEmpty)
                          for (int i = 0; i < kids.length; i++)
                            KidSelection(
                              kid: kids[i],
                              isSelected: selectedKid == kids[i],
                              onTap: () async {
                                await _selectedKidBox.put('index', i);
                                await _selectedKidBox.put('selectedKid', {
                                  'kid_id': kids[i].kidId,
                                  'firstname': kids[i].firstName,
                                  'lastname': kids[i].familyName,
                                  'gender': kids[i].gender,
                                  'allergies': kids[i].allergies,
                                  'syndroms': kids[i].syndromes,
                                  'hobbies': kids[i].hobbies,
                                  'authorizedpickups':
                                      kids[i].authorizedPickupper,
                                  'dateOfbirth': kids[i].dateOfBirth,
                                });
                                setState(() {
                                  selectedKid = kids[i];
                                });
                              },
                            )
                        else
                          Text('nokids'),
                        KidSelection(
                            label: 'add Kid',
                            isSelected: false,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddKid1()),
                              );
                            })
                      ],
                      childrenPadding: EdgeInsets.only(left: 30),
                      shape: Border(),
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      iconColor: Color(0xFF8BC62A),
                    ),
                    ListTile(
                      title: Text(
                        'Settings',
                        style: TextStyle(
                          fontFamily: 'inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: selectedMenuItem == 'Settings'
                              ? Color(0xFF8BC62A)
                              : Colors.black,
                        ),
                      ),
                      leading: Container(
                        height: 40,
                        width: 40,
                        child: Icon(
                          Icons.settings_rounded,
                          color: selectedMenuItem == 'Settings'
                              ? Color(0xFF8BC62A)
                              : Colors.black,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          selectedMenuItem = 'Settings';
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Settings()),
                        );
                      },
                    ),
                    ListTile(
                      title: Text(
                        'About us',
                        style: TextStyle(
                          fontFamily: 'inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: selectedMenuItem == 'About us'
                              ? Color(0xFF8BC62A)
                              : Colors.black,
                        ),
                      ),
                      leading: Container(
                        height: 40,
                        width: 40,
                        child: Icon(
                          Icons.info_outline,
                          color: selectedMenuItem == 'About us'
                              ? Color(0xFF8BC62A)
                              : Colors.black,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          selectedMenuItem = 'About us';
                        });
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Log out',
                        style: TextStyle(
                          fontFamily: 'inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: selectedMenuItem == 'Log out'
                              ? Color(0xFF8BC62A)
                              : Colors.black,
                        ),
                      ),
                      leading: Container(
                        height: 40,
                        width: 40,
                        child: Icon(
                          Icons.logout_outlined,
                          color: selectedMenuItem == 'Log out'
                              ? Color(0xFF8BC62A)
                              : Colors.black,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          selectedMenuItem = 'Log out';
                          selectedKid = null;
                          Navigator.replace(
                            context,
                            oldRoute: ModalRoute.of(context)!,
                            newRoute: MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
              child: Row(
                children: [
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
                      radius: 32,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${guardian.lastName}\r${guardian.firstName}',
                        style: TextStyle(
                          fontFamily: 'open sans',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GuardianProfile()),
                            );
                          },
                          child: Text(
                            'View account',
                            style: TextStyle(
                                fontFamily: 'inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
