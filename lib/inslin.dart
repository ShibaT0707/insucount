import 'package:flutter/material.dart';
import 'package:insucount/text_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

String _inslin = '0';

class inslin extends StatefulWidget {
  @override
  _inslinState createState() => _inslinState();
}

class _inslinState extends State<inslin> {
  @override
  void initState() {
    super.initState();
    setFlag();
    getInslin();
  }

  Future<void> setFlag() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setBool('flag', false);
    });
  }

  Future<void> getInslin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _inslin = prefs.getString('inslin') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop(); // Navigate back when tapped
          },
          child: _buildCircleWithText(),
        ),
      ),
    );
  }

  Widget _buildCircleWithText() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.green,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('インスリン', style: MyTextStyles.lwhiteText),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // 水平方向に中央揃え
              children: [
                Text(
                  _inslin,
                  style: MyTextStyles.xlwhiteText,
                ),
                Text(
                  '単位',
                  style: MyTextStyles.mwhiteText,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
