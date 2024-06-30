import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'package:appmobile/Uint8ListAdapter.dart';
import 'package:appmobile/view/bodies/homePage.dart';
import 'package:appmobile/view/bodies/kidProfile.dart';
import 'package:appmobile/view/screens/addKid2.dart';
// ignore_for_file: prefer_const_constructors//////keeep these comments

import 'dart:async';

import 'package:appmobile/view/bodies/homePage.dart';
import 'package:appmobile/view/bodies/kidProfile.dart';
import 'package:appmobile/view/screens/editKid.dart';
import 'package:appmobile/view/screens/guardianProfile.dart';
import 'package:appmobile/view/screens/notification.dart';
import 'package:appmobile/view/screens/payment.dart';
import 'package:appmobile/view/screens/settings.dart';
import 'package:appmobile/view/screens/addKid1.dart';
import 'package:appmobile/view/screens/loginPage.dart';
import 'package:appmobile/view/screens/mainPage.dart';
// Correct import
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_file.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  await Hive.openBox('guardianData');
  await Hive.openBox('kidsData');
  await Hive.openBox('connection');
  await Hive.openBox('selectedKid');
  await Hive.openBox('lang');
  await Hive.box('lang').put('lang', 'en');
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyKiddoNest',
      routes: {
        '/homepage': (context) => MyHomePage(),
        '/notification': (context) => MyNotification(),
        '/payment': (context) => Payment(),
        '/kidProfile': (context) => KidProfile(),
        '/editKidPro': (context) => EditProfile(),
        '/settings': (context) => Settings(),
        '/guardianAccount': (context) => GuardianProfile(),
        '/addKid2': (context) => AddKid2(),
      },
      home: SplashScreen(),
      theme: ThemeData(
        datePickerTheme: DatePickerThemeData(
          dayBackgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return Color(0xFF3AD09A);
              }
              return null;
            },
          ),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: [
        Locale('en'), // English
        Locale('fr'),
        Locale('ar'),
      ],
      locale: const Locale('ar'),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      bool authenticated = isAuthenticated();
      bool hasKid = _hasKid();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>
              authenticated ? (hasKid ? MainPage() : AddKid1()) : LoginPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/icon.ico',
                height: 150,
                width: 150,
              ),
              SizedBox(height: 10),
              Text(
                'MyKiddoNest',
                style: TextStyle(
                  fontFamily: 'inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 37,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Your Child's World At Your Fingertips",
                style: TextStyle(
                  fontFamily: 'inter',
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 60),
              SpinKitRing(
                color: Colors.grey.shade800,
                size: 70.0,
              ),
              SizedBox(height: 8),
              Text(
                'loading ...',
                style: TextStyle(color: Colors.grey.shade800),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isAuthenticated() {
    final myBox = Hive.box('connection');
    return myBox.isNotEmpty;
  }

  bool _hasKid() {
    final myBox = Hive.box('kidsData');
    int? nb = myBox.get('nbKids');
    return (nb != null && nb > 0);
  }
}
