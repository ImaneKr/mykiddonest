import 'package:appmobile/models/subject.dart';
import 'package:flutter/material.dart';

class SubjectEvaluation extends StatelessWidget {
  final Color color;
  final Subject subject;
  final double pourcentage;
  final Color progressColor;
  const SubjectEvaluation({
    Key? key,
    required this.color,
    required this.subject,
    required this.pourcentage,
    required this.progressColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Convert percentage to a value between 0.0 and 1.0
    double progressValue = pourcentage / 100.0;

    return Padding(
      padding: EdgeInsets.only(top: 15, left: 24, right: 24),
      child: Container(
        padding: EdgeInsets.only(top: 12, bottom: 12, left: 15, right: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFD9D9D9),
              blurRadius: 5,
              offset: Offset(3, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 3,
                ),
                Image.asset(
                  subject.icon,
                  height: 23,
                  width: 23,
                ),
                SizedBox(
                    width: 8), // Add some spacing between the icon and text
                Text(
                  '\t' + subject.label,
                  style: TextStyle(
                    fontFamily: 'inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(
                height:
                    12), // Add some spacing between the text and progress indicator
            Container(
              height: 12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black), // Add black border
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value:
                      progressValue, // Set progress value between 0.0 and 1.0
                  valueColor: AlwaysStoppedAnimation<Color>(
                    progressColor,
                  ), // Customize progress color if needed
                  backgroundColor:
                      Colors.white, // Customize background color if needed
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
