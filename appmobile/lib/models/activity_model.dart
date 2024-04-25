class Activity {
  String imageUrl;
  String title;
  String description; // This will be null for event announcements
  bool isEvent;

  Activity(
      {required this.imageUrl,
      required this.title,
      this.description = '',
      required this.isEvent});
}
