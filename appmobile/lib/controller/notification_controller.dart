import 'package:appmobile/models/notification_model.dart';

class NotificationsController {
  List<NotificationModel> notifications = [
    NotificationModel(
      title: 'New message',
      message: 'Message for notification',
      timestamp: DateTime.now(),
      isRead: false,
    ),
    NotificationModel(
      title: 'English session is Canceled',
      message: 'English session has been canceled today',
      timestamp: DateTime.now(),
      isRead: false,
    ),
  ];

  void markNotificationAsRead(int index) {
    notifications[index].isRead = true;
  }

  // Other methods for adding, deleting for notifications
  void addNotification(int index) {
    final NotificationModel newNotification = NotificationModel(
        title: 'title', message: 'message', timestamp: DateTime.now());
    notifications.add(newNotification);
  }

  void deleteNotification(int index) {
    if (index > 0 && index < notifications.length) {
      notifications.removeAt(index);
    } else
      print('Invalid index $index. Notification not found.');
  }

  void updateNotificationView() {}
}
