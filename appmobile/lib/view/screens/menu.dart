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
    backgroundColor: Colors.white,
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
  final Menu subject;
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
  late Future<List<Menu>> _futureMenus;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.selectedDate;
    _futureMenus =
        MController.getMenuForDay(_getDayOfWeek(selectedDate).substring(0, 3));
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

  void _updateMenusForSelectedDay(String day, int index) {
    setState(() {
      selectedIndex = index;
      _futureMenus = MController.getMenuForDay(day);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: double.infinity,
      padding: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 255, 255, 255),
            Colors.white,
          ],
        ),
        borderRadius: BorderRadius.circular(35),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Center(
            child: Text(
              'Lunch Menu Of The Week',
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 23,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Text(
            getWeekRange(selectedDate),
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                5,
                (index) {
                  final day = ["Sun", "Mon", "Tue", "Wed", "Thu"][index];
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _updateMenusForSelectedDay(day, index);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 8, left: 12, right: 12, bottom: 12),
                        margin: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: index == selectedIndex
                              ? Colors.orange
                              : Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          day,
                          style: TextStyle(
                            color: index == selectedIndex
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            flex: 2,
            child: FutureBuilder<List<Menu>>(
              future: _futureMenus,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  return _buildMenuWidget(snapshot.data!);
                } else {
                  return Center(child: Text('No menu available.'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuWidget(List<Menu> menus) {
    return GridView.builder(
      padding: EdgeInsets.only(left: 15, right: 15),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: menus.length,
      itemBuilder: (context, index) {
        var menu = menus[index];
        return Card(
          elevation: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                menu.title,
                style: TextStyle(
                  fontFamily: 'Roboto Mono',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 19, 19, 18),
                ),
              ),
              SizedBox(height: 10),
              Image.asset(
                menu.picture,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 6),
            ],
          ),
        );
      },
    );
  }
}
