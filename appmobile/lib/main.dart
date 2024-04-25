// ignore_for_file: prefer_const_constructors//////keeep these comments

import 'package:appmobile/view/bodies/homePage.dart';
import 'package:appmobile/view/bodies/kidProfile.dart';
import 'package:appmobile/view/screens/guardianProfile.dart';
import 'package:appmobile/view/screens/notification.dart';
import 'package:appmobile/view/screens/payment.dart';
import 'package:appmobile/view/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:appmobile/view/screens/addKid1.dart';
import 'package:appmobile/view/screens/loginPage.dart';
import 'package:appmobile/view/screens/mainPage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:appmobile/view/screens/edit_profile.dart';

void main() async {
  await initializeDateFormatting(
      'fr_FR', null); // Initialize French locale for App
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyKiddoNest',
      debugShowCheckedModeBanner: false,
      routes: {
        '/homepage': (context) => MyHomePage(),
        '/notification': (context) => MyNotification(),
        '/payment': (context) => Payment(),
        '/kidProfile': (context) => KidProfile(),
        '/editKidPro': (context) => EditProfile(),
        '/settings': (context) => Settings(),
        '/guardianAccount': (context) => GuardianProfile(),
        //   'lunchMenu' : (context) => LunchMenuBottomSheet(selectedDate: selectedDate, subject: subject),
      },
      home:
          isAuthenticated() ? (hasKid() ? MainPage() : AddKid1()) : LoginPage(),
      theme: ThemeData(datePickerTheme: DatePickerThemeData(
        dayBackgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return Color(0xFF3AD09A); // Color for the selected day
          }
          return null; // Use the default value for other states
        }),
      )),
    );
  }

  bool isAuthenticated() {
    return false; // For simplicity.... later we'll set it using the database
  }

  bool hasKid() {
    return false; // For simplicity.... later we'll set it using the database
  }
}
