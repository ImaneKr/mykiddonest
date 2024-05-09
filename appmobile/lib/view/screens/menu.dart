//import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:appmobile/models/menu.dart';
import 'package:appmobile/controller/menu_controller.dart';

class WeekDates {
  final DateTime start;
  final DateTime end;
  WeekDates({
    required this.start,
    required this.end,
  });
}

class Calendar {
  List<List<DateTime>> monthDates(int year, int month) {
    final firstDay = DateTime(year, month, 1);
    final lastDay = DateTime(year, month + 1, 0);

    final monthDays = <List<DateTime>>[];
    var currentDay = firstDay;
    while (currentDay.isBefore(lastDay)) {
      final week = <DateTime>[];
      for (var i = 0; i < 7; i++) {
        if (currentDay.month == month) {
          week.add(currentDay);
        }
        currentDay = currentDay.add(Duration(days: 1));
      }
      monthDays.add(week);
    }

    return monthDays;
  }
}

void showLunchMenuBottomSheet(
    BuildContext context, DateTime selectedDate, Menu menu) {
  showModalBottomSheet(
    barrierColor: Colors.black54,
    backgroundColor: Color.fromARGB(255, 255, 255, 255),
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.vertical(top: Radius.circular(35)),
    ),
    context: context,
    builder: (context) {
      return LunchMenuBottomSheet(selectedDate: selectedDate, subject: menu);
    },
  );
}

class LunchMenuBottomSheet extends StatefulWidget {
  final DateTime selectedDate;
  final Menu subject; // Corrected type of subject
  LunchMenuBottomSheet({
    Key? key,
    required this.selectedDate,
    required this.subject,
  }) : super(key: key);
  @override
  _LunchMenuBottomSheetState createState() => _LunchMenuBottomSheetState();
}

String _getMonth(int month) {
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  return months[month - 1];
}

class _LunchMenuBottomSheetState extends State<LunchMenuBottomSheet> {
  late DateTime selectedDate;
  late MController _controller;
  late List<Menu> _menus;
  @override
  void initState() {
    selectedDate = widget.selectedDate;
    _controller = MController(day: _getDayOfWeek(selectedDate));
    _menus = _controller.generateMenuForDay();
    super.initState();
  }

  String getWeekRange(DateTime date) {
    final startDay =
        date.subtract(Duration(days: date.weekday - DateTime.monday));
    final endDay = startDay.add(Duration(days: 6));
    final formatter = DateFormat('MMMMd');
    return '${formatter.format(startDay)} - ${formatter.format(endDay)}';
  }

  String _getDayOfWeek(DateTime date) {
    return DateFormat('EEEE').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return _buildMenuWidget(_menus);
  }

  Widget _buildMenuWidget(List<Menu> menus) {
    return Container(
      height: 650,
      width: double.infinity,
      padding: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 214, 214, 214),
            Colors.white,
          ],
        ),
        borderRadius: BorderRadius.circular(35),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'Lunch Menu Of The week',
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 23,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            getWeekRange(selectedDate),
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(5, (index) {
                final weekDay = selectedDate
                    .subtract(Duration(days: selectedDate.weekday - index));
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: GestureDetector(
                    onTap: () => setState(() => selectedDate = weekDay),
                    child: Container(
                      padding: EdgeInsets.all(7),
                      margin: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: weekDay.day == selectedDate.day
                            ? Color.fromARGB(255, 249, 209, 147)
                            : Color.fromARGB(255, 205, 204, 204),
                      ),
                      child: Center(
                        child: Text(
                          DateFormat('EEE').format(weekDay),
                          style: TextStyle(
                            fontFamily: 'sans_serif',
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Flexible(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisExtent: 155,
                mainAxisSpacing: 20,
              ),
              itemCount: menus.length,
              padding: EdgeInsets.all(20),
              itemBuilder: (BuildContext context, int index) {
                final menu = menus[index];
                return Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 215, 215, 215),
                        blurRadius: 5,
                        offset: Offset(4, 4),
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        menu.title,
                        style: TextStyle(
                            fontFamily: 'roboto mono',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 19, 19, 18)),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Image.asset(
                        menu.picture,
                        width: 100,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
