import 'dart:io';

// import 'package:dicoding_news_app/provider/preferences_provider.dart';
// import 'package:dicoding_news_app/provider/scheduling_provider.dart';
// import 'package:dicoding_news_app/widgets/custom_dialog.dart';
// import 'package:dicoding_news_app/widgets/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/color.dart';
import 'package:restaurant_app/provider/scheduling_provider.dart';
import 'package:restaurant_app/widgets/custom_dialog.dart';
import 'package:restaurant_app/widgets/platform_widget.dart';

class SettingScreen extends StatelessWidget {
  static const String settingsTitle = 'Settings';

  const SettingScreen({Key? key}) : super(key: key);

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(settingsTitle),
      ),
      body: _buildList(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(settingsTitle),
      ),
      child: _buildList(context),
    );
  }

  Widget _buildList(BuildContext context) {
    return ListView(
          children: [
            Material(
              child: ListTile(
                title: Text('Dark Theme'),
                // trailing: Switch.adaptive(
                //   value: provider.isDarkTheme,
                //   onChanged: (value) {
                //     provider.enableDarkTheme(value);
                //   },
                // ),
              ),
            ),
            Material(
              child: ListTile(
                title: Text('Scheduling News'),
                trailing: Consumer<SchedulingProvider>(
                  builder: (context, scheduled, _) {
                    return Switch.adaptive(
                      value: scheduled.isScheduled,
                      onChanged: (value) async {
                        if (Platform.isIOS) {
                          customDialog(context);
                        } else {
                          scheduled.scheduledNews(value);
                        }
                      },
                    );
                  },
                ),
              ),
            ),
          ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  // Widget _buildList(BuildContext context) {
  //   return Consumer<PreferencesProvider>(
  //     builder: (context, provider, child) {
  //       return ListView(
  //         children: [
  //           Material(
  //             child: ListTile(
  //               title: Text('Dark Theme'),
  //               trailing: Switch.adaptive(
  //                 value: provider.isDarkTheme,
  //                 onChanged: (value) {
  //                   provider.enableDarkTheme(value);
  //                 },
  //               ),
  //             ),
  //           ),
  //           Material(
  //             child: ListTile(
  //               title: Text('Scheduling News'),
  //               trailing: Consumer<SchedulingProvider>(
  //                 builder: (context, scheduled, _) {
  //                   return Switch.adaptive(
  //                     value: scheduled.isScheduled,
  //                     onChanged: (value) async {
  //                       if (Platform.isIOS) {
  //                         customDialog(context);
  //                       } else {
  //                         scheduled.scheduledNews(value);
  //                       }
  //                     },
  //                   );
  //                 },
  //               ),
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  
}