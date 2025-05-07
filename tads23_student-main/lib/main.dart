import 'package:flutter/material.dart';
import 'common/config/dependencies.dart';
import 'package:tads23_student/common/themes/themes.dart';
import 'package:tads23_student/ui/pages/home_page.dart';

void main() {
  setupDependencies();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const HomePage(),
    theme: myTheme,
  ));
}
