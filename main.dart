import 'package:flutter/material.dart';
import 'app_shell.dart';
import 'pavlova.dart';
import 'task4.dart';
import 'task5.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.task3,
      routes: {
        AppRoutes.task3: (_) => const PavlovaPage(),
        AppRoutes.task4: (_) => const Task4Page(),
        AppRoutes.task5: (_) => const Task5Page(),
      },
    );
  }
}