import 'package:flutter/material.dart';
import 'package:pavlok_challenge/UI/pavlok_theme.dart';

import 'UI/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'model/time_reminder.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => TimeReminder(), child: Pavlok()));
}

class Pavlok extends StatelessWidget {
  Pavlok({Key? key}) : super(key: key);

  final theme = PavlokTheme.light();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pavlok',
      theme: theme,
      home: const HomeScreen(),
    );
  }
}
