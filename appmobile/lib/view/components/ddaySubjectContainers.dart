import 'package:appmobile/models/ddaySubjects.dart';
import 'package:appmobile/view/components/subjectContainer.dart';
import 'package:flutter/material.dart';

class DdaySbjctsContainers extends StatelessWidget {
  final String day;

  const DdaySbjctsContainers(this.day, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DdaySubjects sbjcts = DdaySubjects(day: day, context: context);

    return Column(
      children: sbjcts.subjects
          .map((sbjct) => SubjectContainer(subject: sbjct))
          .toList(),
    );
  }
}
