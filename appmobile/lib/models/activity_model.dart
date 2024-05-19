class Activity {
  int id;
  String imageUrl;
  String title;
  String description; // This will be null for event announcements
  bool isEvent;
  DateTime? date; // Optional date attribute

  Activity({
    required this.id,
    required this.imageUrl,
    required this.title,
    this.description = '',
    required this.isEvent,
    this.date, // Optional parameter for date
  });
}
