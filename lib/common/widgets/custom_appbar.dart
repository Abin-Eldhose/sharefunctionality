import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('Share your $text'),
    ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
