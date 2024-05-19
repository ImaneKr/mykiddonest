import 'package:appmobile/models/subject.dart';
import 'package:flutter/material.dart';

class DdaySubjects {
  final String day;
  List<Subject> subjects = [];

  DdaySubjects({required this.day}) {
    subjects = _generateSubjects();
  }

  List<Subject> _generateSubjects() {
    switch (day) {
      case 'Saturday':
        return [
          Subject(
              subjctId: 1,
              startingTime: TimeOfDay(hour: 09, minute: 00),
              endingTime: TimeOfDay(hour: 10, minute: 00)),
          Subject(
              subjctId: 1,
              startingTime: TimeOfDay(hour: 10, minute: 00),
              endingTime: TimeOfDay(hour: 12, minute: 00)),
          Subject(
              subjctId: 1,
              startingTime: TimeOfDay(hour: 13, minute: 00),
              endingTime: TimeOfDay(hour: 13, minute: 45)),
          Subject(
              subjctId: 1,
              startingTime: TimeOfDay(hour: 13, minute: 45),
              endingTime: TimeOfDay(hour: 14, minute: 00)),
        ];

      case 'Monday':
        return [
          Subject(
              subjctId: 1,
              startingTime: TimeOfDay(hour: 09, minute: 00),
              endingTime: TimeOfDay(hour: 10, minute: 00)),
          Subject(
              subjctId: 1,
              startingTime: TimeOfDay(hour: 10, minute: 00),
              endingTime: TimeOfDay(hour: 11, minute: 00)),
          Subject(
              subjctId: 1,
              startingTime: TimeOfDay(hour: 11, minute: 00),
              endingTime: TimeOfDay(hour: 12, minute: 00)),
          Subject(
              subjctId: 1,
              startingTime: TimeOfDay(hour: 13, minute: 00),
              endingTime: TimeOfDay(hour: 13, minute: 45)),
          Subject(
              subjctId: 1,
              startingTime: TimeOfDay(hour: 13, minute: 45),
              endingTime: TimeOfDay(hour: 14, minute: 30)),
        ];
      case 'Sunday':
        return [
          Subject(
              subjctId: 1,
              startingTime: TimeOfDay(hour: 09, minute: 00),
              endingTime: TimeOfDay(hour: 10, minute: 00)),
          Subject(
              subjctId: 1,
              startingTime: TimeOfDay(hour: 10, minute: 00),
              endingTime: TimeOfDay(hour: 12, minute: 00)),
          Subject(
              subjctId: 1,
              startingTime: TimeOfDay(hour: 13, minute: 00),
              endingTime: TimeOfDay(hour: 13, minute: 45)),
          Subject(
              subjctId: 1,
              startingTime: TimeOfDay(hour: 13, minute: 45),
              endingTime: TimeOfDay(hour: 14, minute: 30)),
        ];
      case 'Wednesday':
        return [
          Subject(
              subjctId: 1,
              startingTime: TimeOfDay(hour: 09, minute: 00),
              endingTime: TimeOfDay(hour: 10, minute: 00)),
          Subject(
              subjctId: 1,
              startingTime: TimeOfDay(hour: 10, minute: 00),
              endingTime: TimeOfDay(hour: 12, minute: 00)),
          Subject(
              subjctId: 1,
              startingTime: TimeOfDay(hour: 13, minute: 00),
              endingTime: TimeOfDay(hour: 13, minute: 45)),
          Subject(
              subjctId: 1,
              startingTime: TimeOfDay(hour: 13, minute: 45),
              endingTime: TimeOfDay(hour: 14, minute: 30)),
        ];
      case 'Thursday':
        return [
          Subject(
              subjctId: 1,
              startingTime: TimeOfDay(hour: 09, minute: 00),
              endingTime: TimeOfDay(hour: 12, minute: 00)),
          Subject(
              subjctId: 1,
              startingTime: TimeOfDay(hour: 13, minute: 00),
              endingTime: TimeOfDay(hour: 13, minute: 45)),
          Subject(
              subjctId: 1,
              startingTime: TimeOfDay(hour: 13, minute: 45),
              endingTime: TimeOfDay(hour: 14, minute: 30)),
        ];
      case 'Friday':
        return [
          Subject(
              subjctId: 1,
              startingTime: TimeOfDay(hour: 09, minute: 00),
              endingTime: TimeOfDay(hour: 11, minute: 00)),
          Subject(
              subjctId: 1,
              startingTime: TimeOfDay(hour: 11, minute: 00),
              endingTime: TimeOfDay(hour: 12, minute: 00)),
          Subject(
              subjctId: 1,
              startingTime: TimeOfDay(hour: 13, minute: 00),
              endingTime: TimeOfDay(hour: 14, minute: 30)),
        ];
      default:
        return [
          Subject(
              subjctId: 1,
              startingTime: TimeOfDay(hour: 09, minute: 00),
              endingTime: TimeOfDay(hour: 11, minute: 00)),
          Subject(
              subjctId: 1,
              startingTime: TimeOfDay(hour: 11, minute: 00),
              endingTime: TimeOfDay(hour: 12, minute: 00)),
          Subject(
              subjctId: 1,
              startingTime: TimeOfDay(hour: 13, minute: 00),
              endingTime: TimeOfDay(hour: 14, minute: 30)),
        ];
    }
  }
}
