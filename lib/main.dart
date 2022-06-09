import 'dart:io';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:restaurant_app/provider/search_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/preferences/preferences_helper.dart';
import '../data/api/api_service.dart';
import '../provider/resto_provider.dart';
import '../provider/preferences_provider.dart';
import '../common/navigation.dart';
import '../provider/scheduling_provider.dart';
import '../utils/background_service.dart';
import '../utils/notification_helper.dart';
import '../screens/favorite.dart';
import '../screens/setting.dart';
import '../provider/bottom_navigation_provider.dart';
import '../screens/search.dart';
import '../screens/onboarding.dart';
import '../screens/home.dart';
import '../screens/splash.dart';
import '../screens/detail.dart';
import 'package:provider/provider.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final NotificationHelper _notificationHelper = NotificationHelper();
  final BackgroundService _service = BackgroundService();
  
  _service.initializeIsolate();
  
  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }
  await _notificationHelper.initNotifications(flutterLocalNotificationsPlugin);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RestoProvider>(
          create: (_) => RestoProvider(apiService: ApiService()),
        ),
        ChangeNotifierProvider<SearchProvider>(
          create: (_) => SearchProvider(apiService: ApiService()),
        ),
        ChangeNotifierProvider(create: (_) => SchedulingProvider()),
        ChangeNotifierProvider(
          create: (_) => PreferencesProvider(
            preferencesHelper: PreferencesHelper(
              sharedPreferences: SharedPreferences.getInstance(),
            ),
          ),
        ),
        ChangeNotifierProvider<SchedulingProvider>(
          create: (_) => SchedulingProvider(),
          child: const SettingScreen(),
        ),
      ],
      child: Consumer<PreferencesProvider>(
        builder: (context, provider, child) {
          return MaterialApp(
            navigatorKey: navigatorKey,
            title: 'Restaurant App',
            theme: provider.themeData,
            builder: (context, child) {
              return CupertinoTheme(
                data: CupertinoThemeData(
                  brightness: 
                    provider.isDarkTheme ? Brightness.dark : Brightness.light,
                ),
                child: Material(
                  child: child,
                ),
              );
            },
            initialRoute: SplashScreen.routeName,
            routes: {
              SplashScreen.routeName: (context) => const SplashScreen(),
              OnboardingScreen.routeName: (context) => const OnboardingScreen(),
              HomeScreen.routeName: (context) => const HomeScreen(),
              DetailScreen.routeName: (context) => DetailScreen(
                id: ModalRoute.of(context)?.settings.arguments as String,
              ),
              SearchScreen.routeName: (context) => const SearchScreen(),
              // setting
              // favorite
            },
          );
        }
      ),
    );
  }
}

class BottomNavigationBarResto extends StatefulWidget {
  const BottomNavigationBarResto({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarRestoState createState() => _BottomNavigationBarRestoState();
}

class _BottomNavigationBarRestoState extends State<BottomNavigationBarResto> {
  final NotificationHelper _notificationHelper = NotificationHelper();
  
  var currentTab = [
    const HomeScreen(),
    const FavoriteScreen(),
    const SettingScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _notificationHelper.configureSelectNotificationSubject(
        DetailScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    return Scaffold(
      body: currentTab[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: provider.currentIndex,
        onTap: (index) {
          provider.currentIndex = index;
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    selectNotificationSubject.close();
    super.dispose();
  }

}