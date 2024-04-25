import 'package:appmobile/models/subject.dart';
import 'package:flutter/material.dart';

class SubjectContainer extends StatelessWidget {
  final Subject subject;
  // final DdaySubjects ddaySubjects;

  const SubjectContainer({
    Key? key,
    required this.subject,

    /* required this.ddaySubjects,*/
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 14),
      child: Container(
        padding: EdgeInsets.only(right: 10, left: 10, top: 8, bottom: 10),
        // height: 70,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 230, 230, 230),
                blurRadius: 5,
                offset: Offset(3, 4),
              )
            ],
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Color.fromARGB(255, 191, 191, 191))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 230,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subject.label,
                    style: TextStyle(
                        fontFamily: 'inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFDC6504)),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    subject.description,
                    style: TextStyle(
                        fontFamily: 'inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Colors.grey.shade700),
                  )
                ],
              ),
            ),
            SizedBox(),
            Container(
              padding: EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (subject.startingTime.hour < 10
                                ? '0' + subject.startingTime.hour.toString()
                                : subject.startingTime.hour > 12
                                    ? (subject.startingTime.hour - 12)
                                        .toString()
                                    : subject.startingTime.hour.toString()) +
                            ':' +
                            ((subject.startingTime.minute == 0)
                                ? '00'
                                : subject.startingTime.minute.toString()) +
                            (subject.startingTime.hour <= 12 ? ' am' : ' pm'),
                        style: TextStyle(
                            fontFamily: 'inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 13),
                      ),
                      // Add space for the divider
                      SizedBox(height: 2),
                      Padding(
                        padding: EdgeInsets.only(left: 6),
                        child: Container(
                          height: 13, // Adjust the height as needed
                          width: 1, // This will be the thickness of the line
                          color: Color.fromARGB(
                              138, 0, 0, 0), // Specify the color of the line
                        ),
                      ),
                      SizedBox(height: 2), // Add space after the divider
                      Text(
                        (subject.endingTime.hour < 10
                                ? '0' + subject.endingTime.hour.toString()
                                : subject.endingTime.hour > 12
                                    ? (subject.endingTime.hour - 12).toString()
                                    : subject.endingTime.hour.toString()) +
                            ':' +
                            ((subject.endingTime.minute == 0)
                                ? '00'
                                : subject.endingTime.minute.toString()) +
                            (subject.endingTime.hour <= 12 ? ' am' : ' pm'),
                        style: TextStyle(
                            fontFamily: 'inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 13),
                      ),
                    ],
                  ),
                  // Rest of your Row children
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
