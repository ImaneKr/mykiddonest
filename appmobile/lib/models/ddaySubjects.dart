import 'package:appmobile/models/subject.dart';
import 'package:flutter/material.dart';

class DdaySubjects {
  final String day;
  final BuildContext context;
  List<Subject> subjects = [];

  DdaySubjects({required this.day, required this.context}) {
    subjects = _generateSubjects();
  }

  List<Subject> _generateSubjects() {
    switch (day) {
      case 'Saturday':
        return [
          Subject(
              subjectId: 1,
              context: context,
              startingTime: TimeOfDay(hour: 09, minute: 00),
              endingTime: TimeOfDay(hour: 10, minute: 00)),
          Subject(
              subjectId: 2,
              context: context,
              startingTime: TimeOfDay(hour: 10, minute: 00),
              endingTime: TimeOfDay(hour: 12, minute: 00)),
          Subject(
              subjectId: 3,
              context: context,
              startingTime: TimeOfDay(hour: 13, minute: 00),
              endingTime: TimeOfDay(hour: 13, minute: 45)),
          Subject(
              subjectId: 4,
              context: context,
              startingTime: TimeOfDay(hour: 13, minute: 45),
              endingTime: TimeOfDay(hour: 14, minute: 00)),
        ];

      case 'Monday':
        return [
          Subject(
              subjectId: 3,
              context: context,
              startingTime: TimeOfDay(hour: 09, minute: 00),
              endingTime: TimeOfDay(hour: 10, minute: 00)),
          Subject(
              subjectId: 4,
              context: context,
              startingTime: TimeOfDay(hour: 10, minute: 00),
              endingTime: TimeOfDay(hour: 11, minute: 00)),
          Subject(
              subjectId: 5,
              context: context,
              startingTime: TimeOfDay(hour: 11, minute: 00),
              endingTime: TimeOfDay(hour: 12, minute: 00)),
          Subject(
              subjectId: 2,
              context: context,
              startingTime: TimeOfDay(hour: 13, minute: 00),
              endingTime: TimeOfDay(hour: 13, minute: 45)),
          Subject(
              subjectId: 1,
              context: context,
              startingTime: TimeOfDay(hour: 13, minute: 45),
              endingTime: TimeOfDay(hour: 14, minute: 30)),
        ];
      case 'Sunday':
        return [
          Subject(
              subjectId: 4,
              context: context,
              startingTime: TimeOfDay(hour: 09, minute: 00),
              endingTime: TimeOfDay(hour: 10, minute: 00)),
          Subject(
              subjectId: 3,
              context: context,
              startingTime: TimeOfDay(hour: 10, minute: 00),
              endingTime: TimeOfDay(hour: 12, minute: 00)),
          Subject(
              subjectId: 1,
              context: context,
              startingTime: TimeOfDay(hour: 13, minute: 00),
              endingTime: TimeOfDay(hour: 13, minute: 45)),
          Subject(
              subjectId: 1,
              context: context,
              startingTime: TimeOfDay(hour: 13, minute: 45),
              endingTime: TimeOfDay(hour: 14, minute: 30)),
        ];
      case 'Wednesday':
        return [
          Subject(
              subjectId: 1,
              context: context,
              startingTime: TimeOfDay(hour: 09, minute: 00),
              endingTime: TimeOfDay(hour: 10, minute: 00)),
          Subject(
              subjectId: 2,
              context: context,
              startingTime: TimeOfDay(hour: 10, minute: 00),
              endingTime: TimeOfDay(hour: 12, minute: 00)),
          Subject(
              subjectId: 4,
              context: context,
              startingTime: TimeOfDay(hour: 13, minute: 00),
              endingTime: TimeOfDay(hour: 13, minute: 45)),
          Subject(
              subjectId: 3,
              context: context,
              startingTime: TimeOfDay(hour: 13, minute: 45),
              endingTime: TimeOfDay(hour: 14, minute: 30)),
        ];
      case 'Thursday':
        return [
          Subject(
              subjectId: 1,
              context: context,
              startingTime: TimeOfDay(hour: 09, minute: 00),
              endingTime: TimeOfDay(hour: 12, minute: 00)),
          Subject(
              subjectId: 3,
              context: context,
              startingTime: TimeOfDay(hour: 13, minute: 00),
              endingTime: TimeOfDay(hour: 13, minute: 45)),
          Subject(
              subjectId: 2,
              context: context,
              startingTime: TimeOfDay(hour: 13, minute: 45),
              endingTime: TimeOfDay(hour: 14, minute: 30)),
        ];
      case 'Friday':
        return [
          Subject(
              subjectId: 5,
              context: context,
              startingTime: TimeOfDay(hour: 09, minute: 00),
              endingTime: TimeOfDay(hour: 11, minute: 00)),
          Subject(
              subjectId: 3,
              context: context,
              startingTime: TimeOfDay(hour: 11, minute: 00),
              endingTime: TimeOfDay(hour: 12, minute: 00)),
          Subject(
              subjectId: 1,
              context: context,
              startingTime: TimeOfDay(hour: 13, minute: 00),
              endingTime: TimeOfDay(hour: 14, minute: 30)),
        ];
      default:
        return [
          Subject(
              subjectId: 1,
              context: context,
              startingTime: TimeOfDay(hour: 09, minute: 00),
              endingTime: TimeOfDay(hour: 11, minute: 00)),
          Subject(
              subjectId: 1,
              context: context,
              startingTime: TimeOfDay(hour: 11, minute: 00),
              endingTime: TimeOfDay(hour: 12, minute: 00)),
          Subject(
              subjectId: 1,
              context: context,
              startingTime: TimeOfDay(hour: 13, minute: 00),
              endingTime: TimeOfDay(hour: 14, minute: 30)),
        ];
    }
  }
}
