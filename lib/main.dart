import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pavlok_challenge/UI/pavlok_theme.dart';

import 'UI/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'model/time_reminder.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      //Preview app on different screens
      enabled: !kReleaseMode,
      builder: (context) => ChangeNotifierProvider(
          create: (context) => TimeReminder(), child: Pavlok()),
    ),
  );
}

class Pavlok extends StatelessWidget {
  Pavlok({Key? key}) : super(key: key);

  final theme = PavlokTheme.light();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Pavlok',
      theme: theme,
      home: const HomeScreen(),
    );
  }
}
