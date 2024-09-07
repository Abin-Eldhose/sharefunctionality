import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:media_share/common/widgets/custom_appbar.dart';
import 'package:media_share/controller/share_controller.dart';
import 'package:media_share/view/widgets/image_container.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final shareController = Get.put(ShareController());
    const String imagePath = 'assets/images/sample.jpeg'; // Path to your image

    return Scaffold(
      backgroundColor: const Color(0xFFAEF0B0),
      appBar: const CustomAppbar(
        text: 'Image',
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageContainer(
                  imagePath: imagePath, shareController: shareController),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
