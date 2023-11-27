import 'package:flutter/material.dart';
import 'text_styles.dart';
import 'colors.dart';
import 'home.dart';

class Setting extends StatelessWidget {
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
                    // 中央ぞろえ
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: 75,
                          child: TextField(
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
                  Container(
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child:
                        Text('インスリン1単位で下がる血糖値', style: MyTextStyles.sBlackText),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: TextField(
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
