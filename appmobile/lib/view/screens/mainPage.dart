// ignore_for_file: use_key_in_widget_constructors, file_names, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, sort_child_properties_last

import 'package:appmobile/models/ddaySubjects.dart';
import 'package:flutter/material.dart';
import 'package:appmobile/view/bodies/evaluation.dart';
import 'package:appmobile/view/bodies/homePage.dart';
import 'package:appmobile/view/bodies/kidProfile.dart';
import 'package:appmobile/view/bodies/timeTable.dart';
import 'package:appmobile/view/bodies/sideBar.dart';
import 'package:appmobile/view/screens/notification.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _body = [
    MyHomePage(),
    TimeTable(
      subjects: DdaySubjects(day: 'Saturday'),
    ),
    Evaluation(),
    KidProfile(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        title: Center(
            child: Text(
          "MyKiddoNest",
          style: TextStyle(
            fontFamily: 'inter',
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        )),
        leading: IconButton(
          icon: Image.asset(
            'assets/icons/menu.png',
            height: 32,
            width: 32,
          ),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        actions: [
          Container(
            child: IconButton(
                icon: Image.asset(
                  'assets/icons/inbox.png',
                  width: 30,
                  height: 30,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyNotification()),
                  );
                }),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType
            .fixed, // so that we can get more than 3 icons in this bottomNavBar ,'c z this one offer the same area for all the items
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/home.png', width: 23, height: 23),
            activeIcon: Image.asset('assets/icons/activeHome.png',
                width: 23, height: 23), // Icon
            label: 'Home', // Label
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/timeTable.png',
                width: 23, height: 23),
            activeIcon: Image.asset('assets/icons/activeTimetable.png',
                width: 23, height: 23), // Icon
            label: 'Time Table', // Label
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/evaluation.png',
                width: 23, height: 23),
            activeIcon: Image.asset('assets/icons/activeEvaluation.png',
                width: 23, height: 23), // Icon
            label: 'Evaluation', // Label
          ),
          BottomNavigationBarItem(
            icon:
                Image.asset('assets/icons/profile.png', width: 23, height: 23),
            activeIcon: Image.asset('assets/icons/activeProfile.png',
                width: 23, height: 23), // Icon
            label: 'Profile', // Label
          ),
        ],
        selectedItemColor: Color(0xFF8BC62A),
        unselectedItemColor: Color(0xFF978F8F),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 8,
          fontFamily: 'inter',
        ),
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 8,
          fontFamily: 'inter',
        ),
        onTap: _onItemTapped, // Handle tap event here
        currentIndex: _selectedIndex,
      ),
      body: _body[_selectedIndex],
      drawer: Container(
        child: SideBar(),
        width: 250,
      ),
    );
  }
}
