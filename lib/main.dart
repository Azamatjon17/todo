import 'package:flutter/material.dart';
import 'package:todo/views/screens/admin_panel_page.dart';
import 'package:todo/views/screens/home_page.dart';
import 'package:todo/views/screens/maneger_page.dart';
import 'package:todo/views/screens/note_page.dart';
import 'package:todo/views/screens/settings_page.dart';
import 'package:todo/views/screens/todo_page.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/todo': (context) => const TodoPage(),
        '/note': (context) => const NotePage(),
        '/home': (context) => const HomePage(),
        '/settings': (context) => SettingsPage(),
        '/admin': (context) => const AdminPanelPage(),
      },
      home: const ManagerPage(),
    );
  }
}
