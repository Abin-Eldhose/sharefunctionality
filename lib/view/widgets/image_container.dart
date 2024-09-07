import 'package:flutter/material.dart';
import 'package:media_share/common/widgets/share_button.dart';
import 'package:media_share/controller/share_controller.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    required this.imagePath,
    required this.shareController,
  });

  final String imagePath;
  final ShareController shareController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Display the image
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            child: Image.asset(
              imagePath,
              height: 200,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10, bottom: 10),
            child: ShareButton(
              onPressed: () async {
                final byteData =
                    await DefaultAssetBundle.of(context).load(imagePath);
                final tempFilePath =
                    await shareController.saveImageToTemp(byteData);
                shareController.shareImage(
                    tempFilePath, 'https://example.com/');
              },
            ),
          )
        ],
      ),
    );
  }
}
