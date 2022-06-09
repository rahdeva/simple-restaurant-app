import 'dart:convert';
import '../common/navigation.dart';
import '../data/model/restaurant.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';

final selectNotificationSubject = BehaviorSubject<String>();

class NotificationHelper {
    static NotificationHelper? _instance;
    
    NotificationHelper._internal() {
      _instance = this;
    }
  
    factory NotificationHelper() => _instance ?? NotificationHelper._internal();
  
    Future<void> initNotifications(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
      var initializationSettingsAndroid =
          AndroidInitializationSettings('app_icon');
  
      var initializationSettingsIOS = IOSInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
      );
  
      var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  
      await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? payload) async {
        if (payload != null) {
          print('notification payload: ' + payload);
        }
        selectNotificationSubject.add(payload ?? 'empty payload');
      });
    }
  
    Future<void> showNotification(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
      Restaurant resto) async {
      var _channelId = "1";
      var _channelName = "channel_01";
      var _channelDescription = "random restaurant channel"; 
  
      var androidPlatformChannelSpecifics = AndroidNotificationDetails(
          _channelId, _channelName,
          channelDescription: _channelDescription,
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker',
          styleInformation: DefaultStyleInformation(true, true));
  
      var iOSPlatformChannelSpecifics = IOSNotificationDetails();
      var platformChannelSpecifics = NotificationDetails(
          android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
  
      var titleNotification = "<b>Restaurant</b>";
      var titleNews = resto.name;
  
      await flutterLocalNotificationsPlugin.show(
          0, titleNotification, titleNews, platformChannelSpecifics,
          payload: json.encode(resto.toJson()));
    }
  
    void configureSelectNotificationSubject(String route) {
      selectNotificationSubject.stream.listen(
        (String payload) async {
          var data = Restaurant.fromJson(json.decode(payload));
          Navigation.intentWithData(route, data.id!);
        },
      );
    }
}