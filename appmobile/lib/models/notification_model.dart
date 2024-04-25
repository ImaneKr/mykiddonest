class NotificationModel {
  String title;
  String message;
  DateTime timestamp;
  bool isRead;

  NotificationModel(
      {required this.title,
      required this.message,
      required this.timestamp,
      this.isRead = false});
}
