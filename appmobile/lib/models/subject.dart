import 'package:flutter/material.dart';

class Subject {
  final String label;
  final TimeOfDay startingTime;
  final TimeOfDay endingTime;
  final double pourcentage;
  String icon;
  String description;

  static Map<String, String> subjectsImage = {
    'Arabic litterature': 'assets/images/arabic.png',
    'Physics': 'assets/images/physics.png',
    'Maths': 'assets/images/maths.png',
    'Communication': 'assets/images/communication.png',
    'Art & creativity': 'assets/images/art.png',
    'Reading': 'assets/imagess/reading.png',
    'Writing': 'assets/images/writing.png',
    'Islamic Sciences': 'assets/images/islamicSc.png',
    'Sciences': 'assets/images/sciences.png',
    'History': 'assets/images/history.png',
    'Fitness': 'assets/images/fitness.png',
  };

  static Map<String, String> subjectDescription = {
    'Arabic litterature':
        'Where the elegance of language meets the depth of culture',
    'Physics': 'Fueling curiosity, igniting discovery.',
    'Maths':
        'Where numbers dance and equations sing, revealing the harmony of the cosmos',
    'Communication': 'Connecting minds, sharing stories, building bridges',
    'Art & creativity':
        "Spreading the soul's colors with boundless expressions",
    'Reading': 'Your ticket to endless adventures and diverse worlds',
    'Writing': 'Crafting thoughts into beautifully shaped words',
    'Islamic Sciences':
        'Guiding hearts and enlightening minds through the eternal verses of the Quran',
    'Sciences': 'Constantly regenerating our understanding of the universe',
    'History': 'Stories of our past, shaping our present',
    'Fitness': "Spreading some blood and joy in our kiddo's life "
  };

  Subject(
      {required this.label,
      this.startingTime = const TimeOfDay(hour: 0, minute: 0),
      this.endingTime = const TimeOfDay(hour: 0, minute: 0),
      this.pourcentage = 0})
      : icon = subjectsImage[label] ?? '',
        description = subjectDescription[label] ?? '';
}
