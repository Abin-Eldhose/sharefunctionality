import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:media_share/bootom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'media share app',
      home: NavBarWidget(),
    );
  }
}
