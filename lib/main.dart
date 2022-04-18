import 'package:flutter/material.dart';
import 'package:pavlok_challenge/UI/pavlok_theme.dart';

import 'UI/screens/home_screen.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  runApp(Pavlok());
}

class Pavlok extends StatelessWidget {
  Pavlok({Key? key}) : super(key: key);

  final theme = PavlokTheme.light();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pavlok',
      theme: theme,
      home: const HomeScreen(),
    );
  }
}
