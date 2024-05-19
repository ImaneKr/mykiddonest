import 'package:flutter/material.dart';

class Subject {
  final int? subjctId;
  final String label;
  final TimeOfDay startingTime;
  final TimeOfDay endingTime;
  final int pourcentage;
  final String icon;
  final String description;

  static Map<int, String> subjectsImage = {
    1: 'assets/images/arabic.png',
    2: 'assets/images/maths.png',
    4: 'assets/images/communication.png',
    3: 'assets/images/art.png',
    5: 'assets/images/fitness.png',
  };

  static Map<int, String> subjectLabels = {
    1: 'Letters',
    2: 'Numbers',
    3: 'Art',
    4: 'Communication',
    5: 'Physical skills',
  };

  static Map<int, String> subjectDescription = {
    1: 'Where the elegance of language meets the depth of culture',
    2: 'Where numbers dance and equations sing, revealing the harmony of the cosmos',
    3: 'Connecting minds, sharing stories, building bridges',
    4: "Spreading the soul's colors with boundless expressions",
    5: "Spreading some blood and joy in our kiddo's life ",
  };

  Subject({
    this.subjctId,
    this.startingTime = const TimeOfDay(hour: 0, minute: 0),
    this.endingTime = const TimeOfDay(hour: 0, minute: 0),
    this.pourcentage = 0,
  })  : label = subjectLabels[subjctId] ?? 'Unknown Subject',
        icon = subjectsImage[subjctId] ?? 'assets/images/default.png',
        description =
            subjectDescription[subjctId] ?? 'No description available.';
}
