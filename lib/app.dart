import 'package:flutter/material.dart';
import 'package:task_list_flutter_app/pages/home/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Tasks', home: HomePage());
  }
}
