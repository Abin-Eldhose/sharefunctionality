import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:media_share/common/widgets/custom_appbar.dart';
import 'package:media_share/common/widgets/share_button.dart';
import 'package:media_share/controller/share_controller.dart';

class TextPage extends StatelessWidget {
  const TextPage({super.key});

  @override
  Widget build(BuildContext context) {
    final shareController = Get.put(ShareController());
    const String textToShare = "Click the button below to share this text";
    return Scaffold(
      backgroundColor: const Color(0xFFAEF0B0),
      appBar: const CustomAppbar(
        text: 'text',
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(textToShare),
                      const SizedBox(
                        height: 10,
                      ),
                      ShareButton(
                        onPressed: () {
                          shareController.shareText(
                              textToShare, 'https://https://www.google.com/');
                        },
                      )
                    ],
                  ),
                ),
              ),
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
