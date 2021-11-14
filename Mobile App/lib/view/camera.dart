import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:masi/services/services.dart';
import 'package:masi/view/voiceView.dart';
import 'TakeASelfie.dart';

// A screen that allows users to take a picture using a given camera.
class TakePictureScreen extends StatefulWidget {
  bool isSelfie;

  TakePictureScreen({
    Key? key,
    required this.camera,
    required this.isSelfie,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  Services services = Services();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the Future is complete, display the preview.

                  final scale = MediaQuery.of(context).size.aspectRatio * 2.8;
                  return Transform.scale(
                    scale: scale,
                    alignment: Alignment.topCenter,
                    child: CameraPreview(_controller),
                  );
                } else {
                  // Otherwise, display a loading indicator.
                  return const Center(child: CircularProgressIndicator());
                }
              },
            )
          : Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 10,
                ),
                Text("Wait While Verifying ...")
              ],
            )),
      floatingActionButton: FloatingActionButton.extended(
        // Provide an onPressed callback.
        onPressed: () async {
          try {
            setState(() {
              isLoading = false;
            });
            await _initializeControllerFuture;

            final image = await _controller.takePicture();

            final bytes = File(image.path).readAsBytesSync();

            String userImage = base64Encode(bytes);
            String name ='';
            if (!widget.isSelfie) {
              name = await services.textractService(userImage);
            }

            // await Future.delayed(Duration(seconds: 5));

            setState(() {
              isLoading = true;
            });
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => widget.isSelfie
                    ? VoiceAPI()
                    : TakeASelfie(
                        camera: widget.camera,
                        name: name,
                      ),
              ),
            );
          } catch (e) {
            // If an error occurs, log the error to the console.
            print(e);
          }
        },
        label: const Text('Take A Picture',
                  style: TextStyle(color: Colors.white)),
        icon: const Icon(Icons.camera_alt_outlined, color: Colors.white),
      ),
    );
  }
}
