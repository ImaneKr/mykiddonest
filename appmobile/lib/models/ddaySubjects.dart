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
              label: 'Fitness',
              startingTime: TimeOfDay(hour: 09, minute: 00),
              endingTime: TimeOfDay(hour: 10, minute: 00)),
          Subject(
              label: 'Physics',
              startingTime: TimeOfDay(hour: 10, minute: 00),
              endingTime: TimeOfDay(hour: 12, minute: 00)),
          Subject(
              label: 'Islamic Sciences',
              startingTime: TimeOfDay(hour: 13, minute: 00),
              endingTime: TimeOfDay(hour: 13, minute: 45)),
          Subject(
              label: 'Maths',
              startingTime: TimeOfDay(hour: 13, minute: 45),
              endingTime: TimeOfDay(hour: 14, minute: 00)),
        ];

      case 'Monday':
        return [
          Subject(
              label: 'Fitness',
              startingTime: TimeOfDay(hour: 09, minute: 00),
              endingTime: TimeOfDay(hour: 10, minute: 00)),
          Subject(
              label: 'Arabic litterature',
              startingTime: TimeOfDay(hour: 10, minute: 00),
              endingTime: TimeOfDay(hour: 11, minute: 00)),
          Subject(
              label: 'Physics',
              startingTime: TimeOfDay(hour: 11, minute: 00),
              endingTime: TimeOfDay(hour: 12, minute: 00)),
          Subject(
              label: 'Writing',
              startingTime: TimeOfDay(hour: 13, minute: 00),
              endingTime: TimeOfDay(hour: 13, minute: 45)),
          Subject(
              label: 'Islamic Sciences',
              startingTime: TimeOfDay(hour: 13, minute: 45),
              endingTime: TimeOfDay(hour: 14, minute: 30)),
        ];
      case 'Sunday':
        return [
          Subject(
              label: 'Maths',
              startingTime: TimeOfDay(hour: 09, minute: 00),
              endingTime: TimeOfDay(hour: 10, minute: 00)),
          Subject(
              label: 'Communication',
              startingTime: TimeOfDay(hour: 10, minute: 00),
              endingTime: TimeOfDay(hour: 12, minute: 00)),
          Subject(
              label: 'Reading',
              startingTime: TimeOfDay(hour: 13, minute: 00),
              endingTime: TimeOfDay(hour: 13, minute: 45)),
          Subject(
              label: 'Sciences',
              startingTime: TimeOfDay(hour: 13, minute: 45),
              endingTime: TimeOfDay(hour: 14, minute: 30)),
        ];
      case 'Wednesday':
        return [
          Subject(
              label: 'Fitness',
              startingTime: TimeOfDay(hour: 09, minute: 00),
              endingTime: TimeOfDay(hour: 10, minute: 00)),
          Subject(
              label: 'History',
              startingTime: TimeOfDay(hour: 10, minute: 00),
              endingTime: TimeOfDay(hour: 12, minute: 00)),
          Subject(
              label: 'Arabic litterature',
              startingTime: TimeOfDay(hour: 13, minute: 00),
              endingTime: TimeOfDay(hour: 13, minute: 45)),
          Subject(
              label: 'Islamic Sciences',
              startingTime: TimeOfDay(hour: 13, minute: 45),
              endingTime: TimeOfDay(hour: 14, minute: 30)),
        ];
      case 'Thursday':
        return [
          Subject(
              label: 'Art & creativity',
              startingTime: TimeOfDay(hour: 09, minute: 00),
              endingTime: TimeOfDay(hour: 12, minute: 00)),
          Subject(
              label: 'Maths',
              startingTime: TimeOfDay(hour: 13, minute: 00),
              endingTime: TimeOfDay(hour: 13, minute: 45)),
          Subject(
              label: 'Writing',
              startingTime: TimeOfDay(hour: 13, minute: 45),
              endingTime: TimeOfDay(hour: 14, minute: 30)),
        ];
      case 'Friday':
        return [
          Subject(
              label: 'Fitness',
              startingTime: TimeOfDay(hour: 09, minute: 00),
              endingTime: TimeOfDay(hour: 11, minute: 00)),
          Subject(
              label: 'Maths',
              startingTime: TimeOfDay(hour: 11, minute: 00),
              endingTime: TimeOfDay(hour: 12, minute: 00)),
          Subject(
              label: 'History',
              startingTime: TimeOfDay(hour: 13, minute: 00),
              endingTime: TimeOfDay(hour: 14, minute: 30)),
        ];
      default:
        return [
          Subject(
              label: 'Fitness',
              startingTime: TimeOfDay(hour: 09, minute: 00),
              endingTime: TimeOfDay(hour: 11, minute: 00)),
          Subject(
              label: 'Maths',
              startingTime: TimeOfDay(hour: 11, minute: 00),
              endingTime: TimeOfDay(hour: 12, minute: 00)),
          Subject(
              label: 'History',
              startingTime: TimeOfDay(hour: 13, minute: 00),
              endingTime: TimeOfDay(hour: 14, minute: 30)),
        ];
    }
  }
}
