import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/home_screen.dart';
import 'package:forui/forui.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => FTheme(
        data: FThemes.zinc.dark,
        child: child!,
      ),
      title: 'Flutter CRUD App',
      // theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}
