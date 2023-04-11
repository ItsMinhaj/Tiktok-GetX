import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tiktok_getx/constant.dart';

import 'package:tiktok_getx/views/widgets/text_input_field.dart';
import 'package:video_player/video_player.dart';

class ConfirmVideoScreen extends StatefulWidget {
  final File videoPath;
  const ConfirmVideoScreen({super.key, required this.videoPath});

  @override
  State<ConfirmVideoScreen> createState() => _ConfirmVideoScreenState();
}

class _ConfirmVideoScreenState extends State<ConfirmVideoScreen> {
  late TextEditingController _titleController;
  late TextEditingController _captionController;
  late VideoPlayerController _playerController;

  @override
  void initState() {
    _titleController = TextEditingController();
    _captionController = TextEditingController();
    setState(() {
      _playerController = VideoPlayerController.file(widget.videoPath);
    });

    _playerController.initialize();
    _playerController.play();
    _playerController.setLooping(true);
    _playerController.setVolume(1);

    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _captionController.dispose();
    _playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .7,
              child: VideoPlayer(_playerController),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    height: 40,
                    child: TextInputField(
                        controller: _titleController,
                        labelText: "Song Name",
                        icon: Icons.music_note,
                        isObsecure: false),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    height: 40,
                    child: TextInputField(
                        controller: _captionController,
                        labelText: "Caption",
                        icon: Icons.description_rounded,
                        isObsecure: false),
                  ),
                  const SizedBox(height: 30),
                  Ink(
                    height: 40,
                    width: 120,
                    color: buttonColor,
                    child: const Center(
                        child: Text(
                      "Share",
                      style: TextStyle(fontSize: 18),
                    )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
