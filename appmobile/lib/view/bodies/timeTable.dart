import 'package:appmobile/models/ddaySubjects.dart';
import 'package:appmobile/view/components/dayContainer.dart';
import 'package:appmobile/view/components/ddaySubjectContainers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({Key? key}) : super(key: key);

  @override
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  late int currentMonth;
  int selectedDay = DateTime.now().day;
  int selectedMonth = 0;

  static const Map<int, String> months = {
    1: 'January',
    2: 'February',
    3: 'March',
    4: 'April',
    5: 'May',
    6: 'June',
    7: 'July',
    8: 'August',
    9: 'September',
    10: 'October',
    11: 'November',
    12: 'December',
  };
  static const Map<int, int> monthsDays = {
    1: 31,
    2: 28,
    3: 31,
    4: 30,
    5: 31,
    6: 30,
    7: 31,
    8: 31,
    9: 30,
    10: 31,
    11: 30,
    12: 31,
  };
  static const List<String> dayName = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];
  final List<DateTime> days = [];
  late DdaySubjects ddaySubjects;

  @override
  void initState() {
    super.initState();
    currentMonth = DateTime.now().month;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height, // Adjust the height as needed
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            '\t\t\t' + AppLocalizations.of(context)!.timeTable,
            style: TextStyle(
              fontFamily: 'inter',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 163, 196, 81),
            ),
          ),
          Text(
            '\t\t\t\t\t' +
                (selectedMonth == 0
                    ? months[currentMonth] ?? ''
                    : months[selectedMonth] ?? '') +
                ',',
            style: TextStyle(
              fontFamily: 'inter',
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 186, 220, 101),
                    Colors.white
                  ], // Add your desired colors here
                ),
                borderRadius: BorderRadius.circular(35),
              ),
              child: Column(
                children: [
                  Container(
                    height: 70,
                    child: Container(
                      padding: EdgeInsets.only(right: 20, left: 20),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          for (int i = 1;
                              i <=
                                  (monthsDays[DateTime.now().month.toInt()] ??
                                      0);
                              i++)
                            DayContainer(
                              day: dayName[(DateTime(DateTime.now().year,
                                          DateTime.now().month, i)
                                      .weekday) %
                                  7],
                              dayInt: i,
                              isSelected: selectedDay == i &&
                                  selectedMonth == currentMonth,
                              onTap: () {
                                setState(() {
                                  if (i <= monthsDays[DateTime.now().month]!) {
                                    // If tapped day belongs to current month
                                    selectedDay = i;
                                    selectedMonth = currentMonth;
                                  } else {
                                    // If tapped day belongs to next month
                                    selectedDay = i;
                                    selectedMonth = currentMonth + 1;
                                  }
                                });
                              },
                              month: DateTime.now().month,
                              otherSelected: selectedDay == DateTime.now().day
                                  ? false
                                  : true,
                            ),
                          if (DateTime.now().day >= 20)
                            for (int i = 1;
                                i <=
                                    (monthsDays[(DateTime.now().month.toInt()) +
                                            1] ??
                                        0);
                                i++)
                              DayContainer(
                                day: dayName[(DateTime(DateTime.now().year,
                                            (DateTime.now().month) + 1, i)
                                        .weekday) %
                                    7],
                                dayInt: i,
                                isSelected: selectedDay == i &&
                                    selectedMonth == currentMonth + 1,
                                onTap: () {
                                  setState(() {
                                    selectedDay = i;
                                    selectedMonth = currentMonth + 1;
                                  });
                                },
                                month: (DateTime.now().month) + 1,
                                otherSelected: true,
                              ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(children: [
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /*  SizedBox(
                                width: 1,
                              ),*/
                              Text(
                                dayName[(DateTime(
                                                DateTime.now().year,
                                                selectedMonth == 0
                                                    ? currentMonth
                                                    : selectedMonth,
                                                selectedDay)
                                            .weekday) %
                                        7] +
                                    ',',
                                style: TextStyle(
                                    fontFamily: 'inter',
                                    fontSize: 21,
                                    fontWeight: FontWeight.w600),
                              ),
                              Column(
                                children: [
                                  SizedBox(height: 8),
                                  Text(
                                    selectedDay.toString() +
                                        ' ' +
                                        (months[selectedMonth == 0
                                            ? currentMonth
                                            : selectedMonth]!),
                                    style: TextStyle(
                                        fontFamily: 'inter',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17,
                                        color: Colors.grey.shade700),
                                  ),
                                ],
                              ),
                              SizedBox(),
                              SizedBox(),
                              SizedBox(),
                              SizedBox(),
                              SizedBox(),
                              SizedBox(),
                              SizedBox(),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DdaySbjctsContainers(
                            dayName[(DateTime(DateTime.now().year,
                                        DateTime.now().month, selectedDay)
                                    .weekday) %
                                7],
                          )
                        ]),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
