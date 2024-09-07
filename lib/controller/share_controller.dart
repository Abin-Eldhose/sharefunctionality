import 'dart:io';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ShareController extends GetxController {
  static ShareController get instance => Get.find();

  // Method to share text and handle app/web fallback
  Future<void> shareText(String text, String websiteUrl) async {
    try {
      // Share the text using SharePlus
      await Share.share(text);
    } catch (e) {
      // If the app is not installed, open the website as a fallback
      final Uri url = Uri.parse('$websiteUrl?content=$text');
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        Get.snackbar('Error', 'Could not launch website');
      }
    }
  }

  // Method to share image and handle app/web fallback
  Future<String> saveImageToTemp(ByteData byteData) async {
    final buffer = byteData.buffer.asUint8List();
    final tempDir = Directory.systemTemp;
    final tempFile = File('${tempDir.path}/temp_image.jpeg');
    await tempFile.writeAsBytes(buffer);
    return tempFile.path;
  }

  Future<void> shareImage(String imagePath, String websiteUrl) async {
    try {
      final XFile imageFile = XFile(imagePath);
      // Share the image using SharePlus
      await Share.shareXFiles([imageFile], text: 'Check out this image');
    } catch (e) {
      // If the app is not installed, open the website as a fallback
      final Uri url = Uri.parse('$websiteUrl?image=$imagePath');
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        Get.snackbar('Error', 'Could not launch website');
      }
    }
  }

  // Method to share video and handle app/web fallback
  Future<void> shareVideo(String videoPath, String websiteUrl) async {
    try {
      // Convert videoPath (String) to XFile
      final XFile videoFile = XFile(videoPath);

      // Share the video using SharePlus
      await Share.shareXFiles([videoFile], text: 'Check out this video');
    } catch (e) {
      // If the app is not installed, open the website as a fallback
      final Uri url = Uri.parse('$websiteUrl?video=$videoPath');
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        Get.snackbar('Error', 'Could not launch website');
      }
    }
  }
}
