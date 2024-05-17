// ignore_for_file: prefer_const_constructors

import 'package:appmobile/Uint8ListAdapter.dart';
import 'package:appmobile/view/bodies/homePage.dart';
import 'package:appmobile/view/bodies/kidProfile.dart';
import 'package:appmobile/view/screens/addKid2.dart';
import 'package:appmobile/view/screens/editKid.dart';
import 'package:appmobile/view/screens/guardianProfile.dart';
import 'package:appmobile/view/screens/notification.dart';
import 'package:appmobile/view/screens/payment.dart';
import 'package:appmobile/view/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:appmobile/view/screens/addKid1.dart';
import 'package:appmobile/view/screens/loginPage.dart';
import 'package:appmobile/view/screens/mainPage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  await initializeDateFormatting('fr_FR', null);
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  await Hive.initFlutter();
  Hive.registerAdapter(Uint8ListAdapter());

  await Hive.openBox('guardianData');
  await Hive.openBox('kidsData');
  await Hive.openBox('connection');
  await Hive.openBox('selectedKid');

  runApp(MyApp());
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
      home: isAuthenticated()
          ? (_hasKid() ? MainPage() : AddKid1())
          : LoginPage(),
      theme: ThemeData(
        datePickerTheme: DatePickerThemeData(
          dayBackgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return Color(0xFF3AD09A); // Color for the selected day
              }
              return null; // Use the default value for other states
            },
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
