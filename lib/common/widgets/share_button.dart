import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.black.withOpacity(0.3),
      child: Center(
        child: IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.share,
              color: Color(0xFFAEF0B0),
            )),
      ),
    );
  }
}
