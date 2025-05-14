import 'package:flutter/material.dart';
import 'package:tads23_student/common/config/dependencies.dart';
import 'package:tads23_student/common/themes/themes.dart';
import 'package:tads23_student/ui/pages/home_page.dart';

void main() {
  setupDependencies();
  runApp(
    MaterialApp(
      title: 'Student ID Card',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: myTheme,
    ),
  );
}