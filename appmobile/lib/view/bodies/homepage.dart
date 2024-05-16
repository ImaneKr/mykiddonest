import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:appmobile/controller/activity_controller.dart';
import 'package:appmobile/models/menu.dart';
import 'package:appmobile/view/screens/menu.dart';
import 'package:appmobile/controller/menu_controller.dart';
import 'package:intl/intl.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  String userFirstName = Hive.box('guardianData')
      .get('firstname'); // late means will be intialized later
  String currentDate = DateFormat('d MMMM').format(DateTime.now());
  final ActivityController _controller = ActivityController();
  //---------------------------
  late int currentMonth;
  int selectedDay = DateTime.now().day;
  int selectedMonth = 0;

  final List<DateTime> days = [];
  late MController ddaySubjects;

  @override
  void initState() {
    super.initState();
    currentMonth = DateTime.now().month;
  }

  DateTime selectedDate = DateTime.now();
  final Menu menu = Menu(
    picture: '',
    title: ' ',
  );
  //------------------
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          padding: EdgeInsets.only(left: 15, right: 15),
          children: <Widget>[
            SizedBox(
              height: 8,
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 15),
              // Adjust padding for precise positioning
              child: Text(
                'Welcome $userFirstName!',
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
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 15),
              // Adjust padding for precise positioning
              child: Text(
                'Today, $currentDate',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Inter',
                  color: Color.fromARGB(255, 140, 215, 100),
                  //Color.fromARGB(255, 143, 177, 88),
                  // Color.fromRGBO(75, 119, 5, 0.612),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              //Container Home image
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
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'View Lunch Menu',
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
              height: 100,
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
                      children: [
                        Text(
                          'Check week\'s lunch menu',
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
                              'View',
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
                    //alignment: Alignment.topRight,
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
              alignment: Alignment.topLeft,
              padding: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
              child: Text(
                'Discover Activities',
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
            /*--------- */
            // activity part

            Container(
              height: 260,
              // height: getDynamicHeight(activity.title),
              padding: EdgeInsets.fromLTRB(8.0, 0, 5.0, 0),
              child: ListView.builder(
                scrollDirection:
                    Axis.horizontal, // Set the scroll direction to horizontal
                itemCount: _controller.activities.length,
                itemBuilder: (context, index) {
                  var activity = _controller.activities[index];

                  return Container(
                    width: 190,
                    margin: EdgeInsets.fromLTRB(6.0, 2.0, 6.0, 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.withOpacity(0.3)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
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
                        Text(
                          activity.title,
                          style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 6.0),
                        activity.isEvent
                            ? Text(activity.date != null
                                ? DateFormat('d MMMM yyyy')
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
                                          onPressed: () =>
                                              _controller.acceptEvent(index),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.white),
                                            foregroundColor:
                                                MaterialStateProperty.all<
                                                        Color>(
                                                    Colors.black), // Text color
                                            padding: MaterialStateProperty.all<
                                                EdgeInsetsGeometry>(
                                              EdgeInsets.symmetric(
                                                  horizontal: 14.0,
                                                  vertical: 8.0), // Padding
                                            ),
                                          ),
                                          child: Text('Accept'),
                                        ),
                                        ElevatedButton(
                                          onPressed: () =>
                                              _controller.declineEvent(index),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.white),
                                            foregroundColor:
                                                MaterialStateProperty.all<
                                                        Color>(
                                                    Colors.black), // Text color
                                            padding: MaterialStateProperty.all<
                                                EdgeInsetsGeometry>(
                                              EdgeInsets.symmetric(
                                                  horizontal: 14.0,
                                                  vertical: 8.0), // Padding
                                            ),
                                          ),
                                          child: Text('Decline'),
                                        ),
                                      ],
                                    ),
                                  )
                                : // : of the condition

                                Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 5, right: 5, left: 5),
                                    child: Text(
                                      activity.description,
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  )),

                        // if it is not event, it will display a description
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ), // activity part finish
          ],
        ),
      ),
    );
  }
}
