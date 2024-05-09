import 'package:appmobile/models/activity_model.dart';

class ActivityController {
  List<Activity> activities = [
    Activity(
        imageUrl: 'assets/images/alibirth.jpg',
        title: 'Ali’s Birthday party!',
        date: DateTime(2024, 11, 10),
        isEvent: true),
    Activity(
      imageUrl: 'assets/images/free.jpg',
      title: 'Free activities',
      isEvent: false,
      description:
          'some free activities after the\nlunch, helloooooooo i guess is dynamic exp: painting,reading.',
    ),
  ];
  // using List Add more activities as needed
  String getTitle(int index) {
    return activities[index].title;
  }
  // Accept and Decline functions if the activity is event

  void acceptEvent(int index) {
    print('${activities[index].title} accepted');
  }

  void declineEvent(int index) {
    print('${activities[index].title} declined');
  }
}
