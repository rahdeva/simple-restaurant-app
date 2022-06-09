import 'dart:math';
import 'dart:ui';
import 'dart:isolate';
import 'package:restaurant_app/data/model/restaurant.dart';

import '../main.dart';
import '../data/api/api_service.dart';
import '../utils/notification_helper.dart';

final ReceivePort port = ReceivePort();

class BackgroundService {
  static BackgroundService? _instance;
  static String _isolateName = 'isolate';
  static SendPort? _uiSendPort;

  BackgroundService._internal() {
    _instance = this;
  }

  factory BackgroundService() => _instance ?? BackgroundService._internal();

  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(
      port.sendPort,
      _isolateName,
    );
  }

  static Future<void> callback() async {
    print('Alarm fired!');
    final NotificationHelper _notificationHelper = NotificationHelper();
    var result = await ApiService().getRestoList() as RestaurantResult;
    final _random = Random();
    var _restaurantData = result.restaurants[_random.nextInt(result.restaurants.length)];
    await _notificationHelper.showNotification(
        flutterLocalNotificationsPlugin, _restaurantData);

    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}
