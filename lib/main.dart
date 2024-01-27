// main.dart

import 'package:flutter/material.dart';
import 'start.dart';
import 'camera.dart'; // 追加

import 'dart:async';

import 'package:camera/camera.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  FirstCameraHolder.firstCamera = cameras.first; // 設定

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Start(),
    );
  }
}
