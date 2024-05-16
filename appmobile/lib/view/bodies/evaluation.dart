import 'package:appmobile/models/kid.dart';
import 'package:appmobile/models/subject.dart';
import 'package:appmobile/view/components/subjectEvaluation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Evaluation extends StatelessWidget {
  const Evaluation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _selectedKidBox = Hive.box('selectedKid');

    Kid kid = Kid(
        firstName:
            _selectedKidBox.get('selectedKid')['firstname'].toString() ?? '',
        familyName:
            _selectedKidBox.get('selectedKid')['lastname'].toString() ?? '');
    List<Subject> subjects = [
      Subject(label: 'Physics', pourcentage: 20),
      Subject(label: 'Maths', pourcentage: 20),
      Subject(label: 'Islamic Sciences', pourcentage: 90),
      Subject(label: 'Sciences', pourcentage: 80),
      Subject(label: 'Fitness', pourcentage: 70),
      Subject(label: 'History', pourcentage: 70),
    ];
    late int starsNb;
    double pourcentagesSum = 0;
    for (int i = 0; i < subjects.length; i++)
      pourcentagesSum += subjects[i].pourcentage;
    starsNb = ((pourcentagesSum * 5 / 100) / subjects.length).toInt();
    return SingleChildScrollView(
      // Use SingleChildScrollView instead of ListView
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              'Your child\'s evaluation',
              style: TextStyle(
                color: Color.fromARGB(203, 11, 11, 11),
                fontFamily: 'inter',
                fontSize: 21,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/kid.jpg'),
              radius: 48,
            ),
            SizedBox(height: 5),
            Text(
              kid.firstName + '\r' + kid.familyName,
              style: TextStyle(
                color: Color.fromARGB(203, 11, 11, 11),
                fontFamily: 'inter',
                fontSize: 21,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 1; i <= 5; i++)
                  i <= starsNb
                      ? Icon(
                          Icons.star,
                          color: Color(0xFFFFC700),
                        )
                      : Icon(
                          Icons.star_outline,
                          color: Color(0xFFFFC700),
                        ),
              ],
            ),
            SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(), // Disable scrolling
              itemCount: subjects.length,
              itemBuilder: (context, index) {
                Subject subject = subjects[index];
                Color color = index % 4 == 1
                    ? Color(0xFFE17C29)
                    : (index % 4 == 2
                        ? Color(0xFF027BAF)
                        : (index % 4 == 3
                            ? Color(0xFFACD052)
                            : Color(0xFFE12929)));
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SubjectEvaluation(
                    color: color,
                    subject: subject,
                    pourcentage: subject.pourcentage,
                    progressColor: color,
                  ),
                );
              },
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Image.asset(
                'assets/images/animals.png',
                height: 150,
                width: 250,
              ),
            )
          ],
        ),
      ),
    );
  }
}
