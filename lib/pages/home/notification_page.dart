import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_dkriya/helper/my_color.dart';


class Notifikasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce App',
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: NotificationListScreen(),
    );
  }
}

class NotificationListScreen extends StatefulWidget {
  @override
  _NotificationListScreenState createState() => _NotificationListScreenState();
}

class _NotificationListScreenState extends State<NotificationListScreen> {
  late Future<List<NotificationItem>> _notificationsFuture;

  @override
  void initState() {
    super.initState();
    _notificationsFuture = fetchNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.primaryColor,
        title: Text('Notifications'),
      ),
      body: FutureBuilder<List<NotificationItem>>(
        future: _notificationsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Failed to fetch notifications'),
            );
          } else if (snapshot.hasData) {
            final List<NotificationItem> notifications = snapshot.data!;
            return ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final NotificationItem notification = notifications[index];
                return ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text(
                    notification.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    notification.message,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle),
                    onPressed: () {
                      removeNotification(notification);
                    },
                  ),
                  onTap: () {
                    showNotificationDetails(notification);
                  },
                );
              },
            );
          } else {
            return Center(
              child: Text('No notifications available'),
            );
          }
        },
      ),
    );
  }

  Future<List<NotificationItem>> fetchNotifications() async {
    final response = await http.get(Uri.parse('https://s3-id-jkt-1.kilatstorage.id/d3si-telu/dkriya/notifikasi.json'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => NotificationItem.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch notifications');
    }
  }

  void removeNotification(NotificationItem notification) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Notification removed'),
        duration: Duration(seconds: 2),
      ),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Notification'),
          content: Text('Do you want to remove this notification?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  // Remove the notification from the list
                  _notificationsFuture = _notificationsFuture.then((notifications) {
                    notifications.remove(notification);
                    return notifications;
                  });
                });
              },
              child: Text('Remove'),
            ),
          ],
        );
      },
    );
  }

  void showNotificationDetails(NotificationItem notification) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(notification.title),
          content: Text(notification.message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

class NotificationItem {
  final String title;
  final String message;

  NotificationItem({required this.title, required this.message});

  factory NotificationItem.fromJson(Map<String, dynamic> json) {
    return NotificationItem(
      title: json['title'],
      message: json['message'],
    );
  }
}
