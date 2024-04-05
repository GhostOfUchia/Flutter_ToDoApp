import 'package:flutter/material.dart';
import 'package:todoapp/screen/home_screen.dart';

void main() {
  runApp(MyNote());
}

class MyNote extends StatelessWidget {
  const MyNote({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
