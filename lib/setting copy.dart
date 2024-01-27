import 'package:flutter/material.dart';
import 'text_styles.dart';
import 'colors.dart';
import 'home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  TextEditingController morningController = TextEditingController();
  TextEditingController afternoonController = TextEditingController();
  TextEditingController eveningController = TextEditingController();
  TextEditingController insulinEffectController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // ウィジェットが初期化されたときに保存された値を読み込む
    loadSavedValues();
  }

  Future<void> loadSavedValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      morningController.text = prefs.getString('morning') ?? '';
      afternoonController.text = prefs.getString('afternoon') ?? '';
      eveningController.text = prefs.getString('evening') ?? '';
      insulinEffectController.text = prefs.getString('insulinEffect') ?? '';
    });
  }

  Future<void> saveValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('morning', morningController.text);
    prefs.setString('afternoon', afternoonController.text);
    prefs.setString('evening', eveningController.text);
    prefs.setString('insulinEffect', insulinEffectController.text);
  }

  @override
  void dispose() {
    // ウィジェットが破棄されたときにコントローラを破棄する
    morningController.dispose();
    afternoonController.dispose();
    eveningController.dispose();
    insulinEffectController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Mycolors.white,
      body: Center(
        child: Column(
          children: [
            Flexible(
              child: Container(
                margin: EdgeInsets.only(
                    top: deviceHeight * 0.1, bottom: deviceHeight * 0.05),
                child: Text(
                  'InsuCount',
                  style: MyTextStyles.lTitle,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 50, bottom: 0, left: 10, right: 10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Mycolors.black, width: 2.0),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  Text('カーボカウント', style: MyTextStyles.mBlackText),

                  // テキストフィールド横3つ
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: 75,
                          child: TextField(
                            controller: morningController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              labelText: '朝',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: 75,
                          child: TextField(
                            controller: afternoonController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              labelText: '昼',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: 75,
                          child: TextField(
                            controller: eveningController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              labelText: '夜',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
// その他の既存のコード...
                  Container(
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: TextField(
                      controller: insulinEffectController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        labelText: 'インスリン効果値',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 180,
              height: 70,
              // ボタン
              margin: EdgeInsets.only(top: deviceHeight * 0.1, bottom: 20),
              child: ElevatedButton(
                onPressed: () {
                  saveValues();
                  // settingに遷移
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => home()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Mycolors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('確定', style: MyTextStyles.lwhiteText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
