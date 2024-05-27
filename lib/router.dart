//import 'package:menu_navigator/pages/root_app.dart';
import 'package:menu_navigator/pages/subpages/Notifications.dart';
import 'package:menu_navigator/pages/subpages/TodayTargetDetailPage.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings setting) {
  final Map<String, dynamic> args = <String, dynamic>{};

  switch (setting.name) {
    //case '/root_app':
    //return MaterialPageRoute(builder: (context) => RootApp());
    case '/notifications':
    return MaterialPageRoute(builder: (context) => Notifications());
    case '/today_target_detail':
      return MaterialPageRoute(
          builder: (context) => const TodayTargetDetailPage());
    default:
      return MaterialPageRoute(
          builder: (context) => const Scaffold(
                body: Center(),
              ));
  }
}
