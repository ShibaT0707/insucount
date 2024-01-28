import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data'; // 追加
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

class FirstCameraHolder {
  static late CameraDescription firstCamera;
}

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<Camera> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(
      FirstCameraHolder.firstCamera,
      ResolutionPreset.max,
    );
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // アクセスエラーの処理をここに記述
            break;
          default:
            // その他のエラーの処理をここに記述
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

  Future<void> _captureAndUpload() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      XFile picture = await controller.takePicture();
      Uint8List bytes = await picture.readAsBytes();
      String predictions = await uploadImage(bytes);
      Map<String, dynamic> decodedResponse = json.decode(predictions);
      print(decodedResponse.length);
      for (int i = 0; i < decodedResponse.length; i++) {
        String carbo = decodedResponse[i.toString()]['carbo'].toString();
        String food = decodedResponse[i.toString()]['food'].toString();

        prefs.setString('Cooked$i', food);
        prefs.setString('carbo$i', carbo);
      }

      // インデックスが0のデータのcarboとfoodを取得

// carboとfoodをstring型に変換

      // 予測結果を必要に応じて処理（例：UIに表示など）

      //print(predictions);
    } catch (e) {
      print("画像のキャプチャまたはアップロードエラー： $e");
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => home()),
    );
  }

  Future<String> uploadImage(Uint8List bytes) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://192.168.10.7:5000/predict'),
      );

      var multipartFile = http.MultipartFile.fromBytes(
        'image',
        bytes,
        filename: 'image.jpg',
      );

      request.files.add(multipartFile);

      var response = await request.send();

      if (response.statusCode == 200) {
        return await response.stream.bytesToString(); // JSON文字列を受け取る
      } else {
        print('画像のアップロードに失敗しました。ステータスコード： ${response.statusCode}');
        return ''; // 失敗した場合の処理を行う
      }
    } catch (e) {
      print("画像のアップロードエラー： $e");
      return ''; // エラーが発生した場合の処理を行う
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return MaterialApp(
      home: Scaffold(
        body: CameraPreview(controller),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: _captureAndUpload,
          child: const Icon(Icons.camera),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
