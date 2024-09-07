import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:media_share/common/widgets/custom_appbar.dart';
import 'package:media_share/common/widgets/share_button.dart';
import 'package:media_share/controller/share_controller.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late FlickManager flickManager;

  final String videoPath = "assets/videos/sample_video.mp4";

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.asset(videoPath));
  }

  @override
  Widget build(BuildContext context) {
    final shareController = ShareController.instance;

    return Scaffold(
      backgroundColor: const Color(0xFFAEF0B0),
      appBar: const CustomAppbar(
        text: 'Video',
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20)),
                        child: FlickVideoPlayer(flickManager: flickManager)),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, bottom: 10),
                      child: ShareButton(
                        onPressed: () async {
                          // Load the video file
                          final ByteData byteData =
                              await DefaultAssetBundle.of(context)
                                  .load(videoPath);
                          final Uint8List uint8List =
                              byteData.buffer.asUint8List();

                          // Get the directory for temporary files
                          final directory = await getTemporaryDirectory();
                          final tempFile =
                              File('${directory.path}/temp_video.mp4');

                          // Write the video file to the temporary directory
                          await tempFile.writeAsBytes(uint8List);

                          // Share the video
                          await shareController.shareVideo(
                              tempFile.path, 'https://example.com/');
                        },
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
