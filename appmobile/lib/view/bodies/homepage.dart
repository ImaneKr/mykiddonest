import 'package:appmobile/models/activity_model.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:appmobile/models/menu.dart';
import 'package:appmobile/view/screens/menu.dart';
import 'package:appmobile/controller/menu_controller.dart';
import 'package:intl/intl.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:convert'; // for encoding/decoding JSON
import 'package:http/http.dart' as http;
import 'dart:typed_data';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  String userFirstName = Hive.box('guardianData').get('firstname');
  List<bool> done = [];
  late int currentMonth;
  int selectedDay = DateTime.now().day;
  int selectedMonth = 0;

  final List<DateTime> days = [];

  List<Activity> eventsList = [];
  List<Activity> announcementList = [];
  List<Activity> activitiesList = [];

  @override
  void initState() {
    super.initState();
    currentMonth = DateTime.now().month;
    getEvents();
    getAnnouncements();
  }

  DateTime selectedDate = DateTime.now();
  final Menu menu = Menu(
    picture: '',
    title: ' ',
  );

  Future<void> getEvents() async {
    final eventresponse = await http.get(
      Uri.parse('https://backend-1-dg5f.onrender.com/event/published'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (eventresponse.statusCode == 200) {
      final List<dynamic> responseBody = jsonDecode(eventresponse.body);
      print('the list : $responseBody');
      final List<Map<String, dynamic>> events = responseBody
          .map((dynamic item) => item as Map<String, dynamic>)
          .toList();

      List<Activity> fetchedEvents = events.asMap().entries.map((entry) {
        int index = entry.key;
        var event = entry.value;
        return Activity(
          id: event["event_id"],
          imageUrl: index == 0
              ? 'assets/images/zoo.jpg'
              : (index == 1
                  ? 'assets/images/birthday.jpg'
                  : 'assets/images/defaultEvent.jpeg'),
          title: event["event_name"],
          isEvent: true,
          date: DateTime.parse(event["event_date"]),
        );
      }).toList();

      setState(() {
        eventsList = fetchedEvents;
        activitiesList = eventsList + announcementList;
        done =
            List.filled(activitiesList.length, false); // Initialize done list
      });
    } else {
      throw Exception('Failed to get the events : ${eventresponse.body}');
    }
  }

  Future<void> getAnnouncements() async {
    final announcementresponse = await http.get(
      Uri.parse('https://backend-1-dg5f.onrender.com/announcement/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (announcementresponse.statusCode == 200) {
      final List<dynamic> announcementresponseBody =
          jsonDecode(announcementresponse.body);
      print('the list : $announcementresponseBody');
      final List<Map<String, dynamic>> announcement = announcementresponseBody
          .map((dynamic item) => item as Map<String, dynamic>)
          .toList();

      List<Activity> fetchedAnnouncements =
          announcement.asMap().entries.map((entry) {
        int index = entry.key;
        var announcement = entry.value;
        return Activity(
          id: announcement["announcement_id"],
          imageUrl: index == 0
              ? 'assets/images/menu.jpg'
              : (index == 1
                  ? 'assets/images/zoo.jpg'
                  : 'assets/images/defaultAnnouncement.jpg'),
          title: announcement["announcement_title"],
          description: announcement["announcement_desc"],
          isEvent: false,
        );
      }).toList();

      setState(() {
        announcementList = fetchedAnnouncements;
        activitiesList = eventsList + announcementList;
        done =
            List.filled(activitiesList.length, false); // Initialize done list
      });
    } else {
      throw Exception(
          'Failed to get the announcement: ${announcementresponse.body}');
    }
  }

  Future<void> acceptEventAttendance(int eventId, int index) async {
    try {
      final kidData = Hive.box('selectedKid').get('selectedKid');
      final kidId = kidData != null ? kidData['kid_id'] : null;

      if (kidId == null) {
        print('Kid ID is null');
        return;
      }

      final response = await http.post(
        Uri.parse(
            'https://backend-1-dg5f.onrender.com/eventlist/$eventId/accept'), // Assuming your backend API endpoint for accepting attendance is '/events/:eventId/accept'
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, int>{
          'kidId': kidId,
        }),
      );

      if (response.statusCode == 200) {
        // Attendance accepted successfully
        print('Attendance accepted successfully');
        setState(() {
          done[index] = true; // Update done list
        });
      } else {
        // Handle error
        print('Failed to accept attendance: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network errors
      print('Network error: $error');
    }
  }

  Future<void> declineEventAttendance(int eventId, int index) async {
    try {
      final kidData = Hive.box('selectedKid').get('selectedKid');
      final kidId = kidData != null ? kidData['kid_id'] : null;

      if (kidId == null) {
        print('Kid ID is null');
        return;
      }

      final response = await http.post(
        Uri.parse(
            'https://backend-1-dg5f.onrender.com/eventlist/$eventId/decline'), // Assuming your backend API endpoint for accepting attendance is '/events/:eventId/accept'
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, int>{
          'kidId': kidId,
        }),
      );

      if (response.statusCode == 200) {
        // Attendance declined successfully
        print('Attendance declined successfully');
        setState(() {
          done[index] = true; // Update done list
        });
      } else {
        // Handle error
        print('Failed to decline attendance: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network errors
      print('Network error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.only(left: 15, right: 15),
        children: <Widget>[
          SizedBox(
            height: 8,
          ),

          Container(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              AppLocalizations.of(context)!.welcome + ' $userFirstName!',
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Container(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              AppLocalizations.of(context)!.today +
                  ' , ' +
                  DateFormat(
                          'd MMMM', Localizations.localeOf(context).toString())
                      .format(DateTime.now()),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontFamily: 'Inter',
                color: Color.fromARGB(255, 140, 215, 100),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 350,
            height: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                'assets/images/homepage2.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              AppLocalizations.of(context)!.viewLunchMenu,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: 'Inter',
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            height: 120,
            width: 350,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 135, 179, 69).withOpacity(0.85),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.checkWeeksLunchMenu,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter',
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        padding: EdgeInsets.fromLTRB(0, 0, 110.0, 0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(Size(90, 36)),
                          ),
                          onPressed: () {
                            showLunchMenuBottomSheet(
                                context, selectedDate, menu);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.view,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 5.0),
                  height: 95,
                  width: 95,
                  child: Container(
                    child: ClipRRect(
                      child: Image.asset(
                        'assets/images/dish.png',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 7,
          ),
          SizedBox(
            height: 8,
            width: 325,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
            child: Text(
              AppLocalizations.of(context)!.discoverActivities,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: 'Inter',
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 6,
            width: 325,
          ),
          // activity part
          Container(
            height: 260,
            padding: EdgeInsets.fromLTRB(8.0, 0, 5.0, 0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: activitiesList.length,
              itemBuilder: (context, index) {
                var activity = activitiesList[index];

                return Container(
                  width: 170,
                  margin: EdgeInsets.fromLTRB(6.0, 2.0, 6.0, 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 150,
                        width: 210,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          child: Image.asset(
                            activity.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 6.0),
                      Padding(
                          padding: EdgeInsets.fromLTRB(7, 0, 5, 0),
                          child: Text(
                            activity.title,
                            style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500),
                          )),
                      SizedBox(height: 6.0),
                      activity.isEvent
                          ? Text(activity.date != null
                              ? DateFormat(
                                      'd MMMM',
                                      Localizations.localeOf(context)
                                          .toString())
                                  .format(activity.date!)
                              : '')
                          : Container(),
                      SizedBox(height: 6.0),
                      Expanded(
                          child: activity.isEvent
                              ? Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                        onPressed: done[index]
                                            ? null
                                            : () => acceptEventAttendance(
                                                activity.id, index),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.grey.shade200),
                                          foregroundColor: done[index]
                                              ? MaterialStateProperty.all<
                                                  Color>(Colors.grey)
                                              : MaterialStateProperty.all<
                                                  Color>(Colors.black),
                                          padding: MaterialStateProperty.all<
                                              EdgeInsetsGeometry>(
                                            EdgeInsets.symmetric(
                                                horizontal: 14.0,
                                                vertical: 8.0),
                                          ),
                                        ),
                                        child: Text(
                                            AppLocalizations.of(context)!
                                                .accept),
                                      ),
                                      ElevatedButton(
                                        onPressed: done[index]
                                            ? null
                                            : () => declineEventAttendance(
                                                activity.id, index),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.grey.shade200),
                                          foregroundColor: done[index]
                                              ? MaterialStateProperty.all<
                                                  Color>(Colors.grey)
                                              : MaterialStateProperty.all<
                                                  Color>(Colors.black),
                                          padding: MaterialStateProperty.all<
                                              EdgeInsetsGeometry>(
                                            EdgeInsets.symmetric(
                                                horizontal: 14.0,
                                                vertical: 8.0),
                                          ),
                                        ),
                                        child: Text(
                                            AppLocalizations.of(context)!
                                                .decline),
                                      ),
                                    ],
                                  ),
                                )
                              : Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 5, right: 7, left: 7),
                                  child: Text(
                                    activity.description!,
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400),
                                  ),
                                )),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
