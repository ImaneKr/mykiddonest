import 'package:flutter/material.dart';
import 'package:appmobile/controller/notification_controller.dart';
import 'package:intl/intl.dart';

class MyNotification extends StatefulWidget {
  const MyNotification({Key? key}) : super(key: key);

  @override
  State<MyNotification> createState() => _MyNotificationState();
}

class _MyNotificationState extends State<MyNotification> {
  NotificationsController notificationController = NotificationsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Notifications',
            style: TextStyle(
              fontFamily: 'Epilogue-SemiBold',
              fontWeight: FontWeight.w600,
              fontSize: 23,
            ),
          ),
        ),
        /*  leading: IconButton(
          icon: Icon(Icons.arrow_back),
          style: ButtonStyle(
            iconSize: MaterialStatePropertyAll(30.0),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
         leadingWidth: 20.0,*/
      ),
      body: Padding(
        padding: EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Today',
                  style: TextStyle(
                    fontFamily: 'Poppins-SemiBold',
                    fontWeight: FontWeight.w600,
                    fontSize: 19,
                    color: Color(0xFF323842),
                  ),
                ),
                SizedBox(
                  width: 195.0,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Clear all',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      color: Color(0xFFFB143D),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: notificationController.notifications.length,
                itemBuilder: (context, index) {
                  final timePosted =
                      notificationController.notifications[index].timestamp;
                  // ignore: unnecessary_null_comparison
                  final formattedHour = timePosted != null
                      ? DateFormat('HH:mm').format(timePosted)
                      : ''; // cuz if dateTime is null => problem
                  //check if timePosted is always valid DateTime object before formatting
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 240, 238, 238),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 208, 233, 252),
                                  borderRadius: BorderRadius.circular(17),
                                ),
                                child: Icon(
                                  Icons.notifications,
                                  color: Color.fromARGB(255, 66, 159, 230),
                                  size: 28.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '${notificationController.notifications[index].title}',
                                    style: TextStyle(
                                      fontFamily: 'Poppins-Medium',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.0,
                                      color: Color.fromARGB(255, 38, 43, 52),
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '${notificationController.notifications[index].message}',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.0,
                                      color: Color.fromARGB(255, 48, 52, 61),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '${formattedHour}',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.0,
                                      color: Color.fromARGB(255, 58, 62, 72),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
