import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common/color.dart';
import '../provider/scheduling_provider.dart';
import '../widgets/custom_dialog.dart';
import '../widgets/platform_widget.dart';

class SettingScreen extends StatelessWidget {
  static const String settingsTitle = 'Settings';

  const SettingScreen({Key? key}) : super(key: key);

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text(settingsTitle),
      ),
      body: _buildList(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(settingsTitle),
      ),
      child: _buildList(context),
    );
  }

  Widget _buildList(BuildContext context) {
    return ListTile(
      title: const Text('Scheduling News'),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

}
