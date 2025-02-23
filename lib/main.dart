import 'package:flutter/material.dart';
import 'screens/task_list_screen.dart';

void main() {
  runApp(const MyApp()); // Use `const` here as well
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Add a `const` constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Todo List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:
          const TaskListScreen(), // Ensure TaskListScreen also has a `const` constructor
    );
  }
}
