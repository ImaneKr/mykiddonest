import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'dart:convert'; // for encoding/decoding JSON
import 'package:http/http.dart' as http;
import 'package:appmobile/models/kid.dart';
import 'package:appmobile/models/subject.dart';
import 'package:appmobile/view/components/subjectEvaluation.dart';

class Evaluation extends StatefulWidget {
  const Evaluation({Key? key}) : super(key: key);

  @override
  _EvaluationState createState() => _EvaluationState();
}

class _EvaluationState extends State<Evaluation> {
  late Kid kid;
  late List<Subject> subjects;
  late int starsNb;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final _selectedKidBox = Hive.box('selectedKid');
    kid = Kid(
        kidId: _selectedKidBox.get('selectedKid')['kid_id'] ?? 0,
        firstName:
            _selectedKidBox.get('selectedKid')['firstname'].toString() ?? '',
        familyName:
            _selectedKidBox.get('selectedKid')['lastname'].toString() ?? '',
        gender: _selectedKidBox.get('selectedKid')['gender'].toString());

    List<Map<String, dynamic>> evaluations = await fetchEvaluations(kid.kidId);

    setState(() {
      subjects = evaluations.map((subject) {
        int subjectId = subject['subject_id'];
        int pourcentage = subject['mark'];
        return Subject(
          subjctId: subjectId,
          pourcentage: pourcentage,
        );
      }).toList();

      double pourcentagesSum =
          subjects.fold(0, (sum, subject) => sum + subject.pourcentage);
      starsNb = ((pourcentagesSum * 5 / 100)).toInt();
      isLoading = false;
    });
  }

  Future<List<Map<String, dynamic>>> fetchEvaluations(int kidId) async {
    final String baseUrl =
        'https://backend-1-dg5f.onrender.com'; // Replace with your actual backend URL
    final response = await http.get(Uri.parse('$baseUrl/evaluation/$kidId'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((subject) => subject as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to load evaluations');
    }
  }

  Future<void> _refreshData() async {
    await fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _refreshData,
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 15),
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
                        backgroundImage: kid.gender == 'Male'
                            ? AssetImage('assets/images/kid.jpg')
                            : AssetImage('assets/images/girl.jpg'),
                        radius: 48,
                      ),
                      SizedBox(height: 5),
                      Text(
                        '${kid.firstName}\r${kid.familyName}',
                        style: TextStyle(
                          color: Color.fromARGB(203, 11, 11, 11),
                          fontFamily: 'inter',
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 1; i <= 5; i++)
                            Icon(
                              i <= starsNb ? Icons.star : Icons.star_outline,
                              color: Color(0xFFFFC700),
                            ),
                        ],
                      ),
                      SizedBox(height: 8),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: subjects.length,
                        itemBuilder: (context, index) {
                          Subject subject = subjects[index];
                          Color color = _getColorForIndex(index);
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: SubjectEvaluation(
                              color: color,
                              subject: subject,
                              pourcentage: subject.pourcentage.toDouble(),
                              progressColor: color,
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 15),
                      Center(
                        child: Image.asset(
                          'assets/images/animals.png',
                          height: 150,
                          width: 250,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Color _getColorForIndex(int index) {
    switch (index % 4) {
      case 1:
        return Color(0xFFE17C29);
      case 2:
        return Color(0xFF027BAF);
      case 3:
        return Color(0xFFACD052);
      default:
        return Color(0xFFE12929);
    }
  }
}
