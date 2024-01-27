import 'package:flutter/material.dart';
import 'text_styles.dart';
import 'colors.dart';
import 'camera.dart';
import 'home.dart';
import 'package:intl/intl.dart';
import 'note_add.dart';

int selectedNumber = 0;
DateTime now = DateTime.now();
String formattedDate = DateFormat('M/d HH時mm分').format(now);
double _value1 = 100;

double? _deviceWidth, _deviceHeight;

class Store extends StatefulWidget {
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  // 現在の日付を取得

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Mycolors.lightGrey,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Mycolors.white,
              child: DropdownButton(
                alignment: Alignment.center,
                value: selectedNumber,
                isExpanded: true,
                items: [
                  DropdownMenuItem(
                    child: Text('お店'),
                    alignment: Alignment.center,
                    value: 0,
                  ),
                  DropdownMenuItem(
                    child: Text('マクドナルド'),
                    alignment: Alignment.center,
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text('モスバーガー'),
                    alignment: Alignment.center,
                    value: 2,
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedNumber = value as int;
                  });
                },
              ),
            ),
            Flexible(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: 10, bottom: 10, left: 15, right: 15),
                              width: _deviceWidth! * 0.47,
                              height: _deviceHeight! * 0.2,
                              decoration: BoxDecoration(
                                color: Mycolors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: 10, bottom: 10, left: 15, right: 15),
                              width: _deviceWidth! * 0.47,
                              height: _deviceHeight! * 0.2,
                              decoration: BoxDecoration(
                                color: Mycolors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              //ボタン
              margin:
                  const EdgeInsets.only(top: 15, left: 5, right: 5, bottom: 5),

              child: ElevatedButton(
                onPressed: () {
                  //settingに遷移
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
                child: const Text('確定', style: MyTextStyles.mwhiteText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
