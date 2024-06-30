import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'dart:convert'; // for encoding/decoding JSON
import 'package:http/http.dart' as http;
import 'package:appmobile/models/kid.dart';
import 'package:appmobile/models/subject.dart';
import 'package:appmobile/view/components/subjectEvaluation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Evaluation extends StatefulWidget {
  const Evaluation({Key? key}) : super(key: key);

  @override
  _EvaluationState createState() => _EvaluationState();
}

class _EvaluationState extends State<Evaluation> {
  late Kid selectedKid;
  final _selectedKidBox = Hive.box('selectedKid');

  late List<Subject> subjects;
  late int starsNb;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadKidData();
  }

  Future<void> fetchData() async {
    List<Map<String, dynamic>> evaluations =
        await fetchEvaluations(selectedKid.kidId);

    setState(() {
      subjects = evaluations.map((subject) {
        int subjectId = subject['subject_id'];
        int percentage = subject['mark'];
        return Subject(
          subjectId: subjectId,
          percentage: percentage,
          context: context,
        );
      }).toList();

      double percentagesSum =
          subjects.fold(0, (sum, subject) => sum + subject.percentage);
      starsNb = ((percentagesSum * 5 / 100)).toInt();
      isLoading = false;
    });
  }

  Future<Map<String, dynamic>> fetchKidData(int kidId) async {
    final String baseUrl =
        'https://backend-1-dg5f.onrender.com'; // Replace with your actual backend URL
    final response = await http.get(Uri.parse('$baseUrl/kid/$kidId'));

    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load kid info');
    }
  }

  Future<void> loadKidData() async {
    setState(() {
      selectedKid = Kid(
        kidId: _selectedKidBox.get('selectedKid')['kid_id'],
      );
    });

    try {
      Map<String, dynamic> kidData = await fetchKidData(selectedKid.kidId);
      setState(() {
        selectedKid = Kid(
          kidId: kidData['kid_id'],
          firstName: kidData['firstname'],
          familyName: kidData['lastname'],
          gender: kidData['gender'],
          dateOfBirth: DateTime.parse(kidData['dateOfbirth']),
          allergies: kidData['allergies'][0],
          syndromes: kidData['syndroms'][0],
          hobbies: kidData['hobbies'][0],
          authorizedPickupper: kidData['authorizedpickups'][0],
          relationshipToChild: kidData['relationTochild'],
        );
      });
      await fetchData();
    } catch (e) {
      print('Failed to load kid data: $e');
    }
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
                        AppLocalizations.of(context)!.yourChildsEvaluation,
                        style: TextStyle(
                          color: Color.fromARGB(203, 11, 11, 11),
                          fontFamily: 'inter',
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      CircleAvatar(
                        backgroundImage: selectedKid.gender == 'Male'
                            ? AssetImage('assets/images/kid.jpg')
                            : AssetImage('assets/images/girl.jpg'),
                        radius: 48,
                      ),
                      SizedBox(height: 5),
                      Text(
                        '${selectedKid.firstName}\r${selectedKid.familyName}',
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
                              pourcentage: subject.percentage.toDouble(),
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
