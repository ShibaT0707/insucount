import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'text_styles.dart';
import 'colors.dart';
import 'setting.dart';
import 'home.dart';
import 'package:intl/intl.dart';

late List<CameraDescription> _cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  _cameras = await availableCameras();
  runApp(const Camera());
}

/// CameraApp is the Main Application.
class Camera extends StatefulWidget {
  /// Default Constructor
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraAppState();
}

class _CameraAppState extends State<Camera> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(_cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return MaterialApp(
      home: CameraPreview(controller),
    );
  }
}
