import 'package:flutter/material.dart';
import 'package:flutter_assignment_3/presentation/screens/home_screen.dart';

class MyBagApp extends StatelessWidget{
  const MyBagApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }

}