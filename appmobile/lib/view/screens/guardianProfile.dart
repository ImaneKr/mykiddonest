import 'package:appmobile/models/guardian.dart';
import 'package:appmobile/view/components/guardianInfoField.dart';
import 'package:appmobile/view/screens/loginPage.dart';
import 'package:flutter/material.dart';

class GuardianProfile extends StatefulWidget {
  const GuardianProfile({Key? key}) : super(key: key);

  @override
  State<GuardianProfile> createState() => _GuardianProfileState();
}

class _GuardianProfileState extends State<GuardianProfile> {
  Guardian guardian = Guardian(
    firstName: 'Meriem',
    familyName: 'Kadri',
    phoneNumber: '0773738392',
    username: '_meriemKdr',
    password: 'meriem2024',
    birthday: DateTime(1980, 5, 7),
  );
  late TextEditingController _dateController;

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController(
        text: (guardian.birthday.day >= 10
                ? "${guardian.birthday.day}"
                : "0" + "${guardian.birthday.day}") +
            "/" +
            (guardian.birthday.month >= 10
                ? "${guardian.birthday.month}"
                : "0" + "${guardian.birthday.month}") +
            "/" +
            "${guardian.birthday.year}");
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: guardian.birthday,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = (picked.day >= 10
                ? "${picked.day}"
                : "0" + "${picked.day}") +
            "/" +
            (picked.month >= 10 ? "${picked.month}" : "0" + "${picked.month}") +
            "/" +
            "${picked.year}";
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
              AppLocalizations.of(context)!.myAccount,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
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
              child: Text(
                AppLocalizations.of(context)!.logOut,
                style: TextStyle(
                  color: Color.fromARGB(255, 134, 138, 148),
                  fontFamily: 'inter',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              isLoading = true;
            });
            await loadGuardianData();
          },
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 15),
                        GestureDetector(
                          onTap: () {
                            // Implement image picker here if needed
                          },
                          child: CircleAvatar(
                            radius: 70,
                            backgroundImage:
                                AssetImage('assets/images/mother.jpg'),
                          ),
                        ),
                        SizedBox(height: 12),
                        GuardianInfoField(
                          initialValue: guardian.firstName ?? '',
                          label: AppLocalizations.of(context)!.firstName,
                          onChange: (value) {
                            setState(() {
                              guardian.firstName = value;
                            });
                          },
                        ),
                        SizedBox(height: 12),
                        GuardianInfoField(
                          initialValue: guardian.lastName ?? '',
                          label: AppLocalizations.of(context)!.familyName,
                          onChange: (value) {
                            setState(() {
                              guardian.lastName = value;
                            });
                          },
                        ),
                        SizedBox(height: 12),
                        GuardianInfoField(
                          initialValue: guardian.gender ?? '',
                          label: AppLocalizations.of(context)!.gender,
                          onChange: (value) {
                            setState(() {
                              guardian.gender = value;
                            });
                          },
                        ),
                        SizedBox(height: 12),
                        GuardianInfoField(
                          initialValue: guardian.civilState ?? '',
                          label: AppLocalizations.of(context)!.civilState,
                          onChange: (value) {
                            setState(() {
                              guardian.civilState = value;
                            });
                          },
                        ),
                        SizedBox(height: 12),
                        GuardianInfoField(
                          initialValue: guardian.username ?? '',
                          label: AppLocalizations.of(context)!.username,
                          onChange: (value) {
                            setState(() {
                              guardian.username = value;
                            });
                          },
                        ),
                        SizedBox(height: 12),
                        GuardianInfoField(
                          initialValue: guardian.password ?? '',
                          label: AppLocalizations.of(context)!.password,
                          isPassword: true,
                          onChange: (value) {
                            setState(() {
                              guardian.password = value;
                            });
                          },
                        ),
                        SizedBox(height: 12),
                        GuardianInfoField(
                          initialValue: guardian.adresseMail ?? '',
                          label: AppLocalizations.of(context)!.emailAddress,
                          onChange: (value) {
                            setState(() {
                              guardian.adresseMail = value;
                            });
                          },
                        ),
                        SizedBox(height: 12),
                        GuardianInfoField(
                          initialValue: guardian.phoneNumber ?? '',
                          label: AppLocalizations.of(context)!.phoneNumber,
                          onChange: (value) {
                            setState(() {
                              guardian.phoneNumber = value;
                            });
                          },
                        ),
                        SizedBox(height: 12),
                        GuardianInfoField(
                          initialValue: guardian.address ?? '',
                          label: AppLocalizations.of(context)!.address,
                          onChange: (value) {
                            setState(() {
                              guardian.address = value;
                            });
                          },
                        ),
                        SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: editGuardian,
                          child: Text(
                            AppLocalizations.of(context)!.saveChanges,
                            style: TextStyle(
                              fontFamily: 'inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.lightBlue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Color(0xFFF3F4F6),
                      ),
                      child: TextFormField(
                        controller: _dateController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 15,
                            right: 15.0,
                            top: 10,
                          ),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          suffixIcon: IconButton(
                            onPressed: () => _selectDate(context),
                            icon: Icon(Icons.calendar_today),
                          ),
                        ),
                        readOnly: true,
                        onTap: () => _selectDate(context),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
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
