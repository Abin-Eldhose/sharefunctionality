import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:media_share/view/image_page.dart';
import 'package:media_share/view/text_page.dart';
import 'package:media_share/view/video_page.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.put(NavigationController());
    return Scaffold(
      backgroundColor: const Color(0xFFAEF0B0),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 70,
          elevation: 2,
          backgroundColor: const Color(0xFFAEF0B0),
          indicatorColor: Colors.white,
          selectedIndex: navigationController.selectedIndex.value,
          onDestinationSelected: (index) =>
              navigationController.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(
                icon: Icon(
                  Icons.text_decrease,
                  color: Colors.black,
                ),
                label: 'Text'),
            NavigationDestination(
                icon: Icon(Icons.image, color: Colors.black), label: 'Image'),
            NavigationDestination(
                icon: Icon(Icons.video_call, color: Colors.black),
                label: 'Video'),
          ],
        ),
      ),
      body: Obx(
        () => navigationController
            .pages[navigationController.selectedIndex.value],
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final pages = [
    const TextPage(),
    const ImagePage(),
    const VideoPage(),
  ];
}
