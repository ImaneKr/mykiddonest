import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Subject {
  final int? subjectId;
  final String label;
  final TimeOfDay startingTime;
  final TimeOfDay endingTime;
  final int percentage;
  final String icon;
  final String description;

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

  static Map<int, String Function(BuildContext)> subjectLabels = {
    1: (context) => AppLocalizations.of(context)!.letters,
    2: (context) => AppLocalizations.of(context)!.numbers,
    3: (context) => AppLocalizations.of(context)!.art,
    4: (context) => AppLocalizations.of(context)!.communication,
    5: (context) => AppLocalizations.of(context)!.physicalSkills,
  };

  static Map<int, String> subjectDescription = {
    1: 'Where the elegance of language meets the depth of culture',
    2: 'Where numbers dance and equations sing, revealing the harmony of the cosmos',
    3: 'Connecting minds, sharing stories, building bridges',
    4: "Spreading the soul's colors with boundless expressions",
    5: "Spreading some blood and joy in our kiddo's life ",
  };

  Subject({
    this.subjectId,
    required BuildContext context,
    this.startingTime = const TimeOfDay(hour: 0, minute: 0),
    this.endingTime = const TimeOfDay(hour: 0, minute: 0),
    this.percentage = 0,
  })  : label = subjectLabels[subjectId]?.call(context) ?? 'Unknown Subject',
        icon = subjectsImage[subjectId] ?? 'assets/images/default.png',
        description =
            subjectDescription[subjectId] ?? 'No description available.';
}
