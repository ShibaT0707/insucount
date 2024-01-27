import 'package:flutter/material.dart';
import 'package:insucount/note_page.dart';
import 'text_styles.dart';
import 'colors.dart';
import 'camera.dart';
import 'home.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

int selectedNumber = 0;
DateTime now = DateTime.now();
String formattedDate = DateFormat('M/d HH時mm分').format(now);
double _value1 = 100;
List<Widget> containers = [];
List<Widget> containers2 = [];
List<Widget> containers3 = [];
List<Widget> containers4 = [];
List<Widget> containers5 = [];
List<Widget> containers6 = [];
List<TextEditingController> cookedControllers = [];
List<TextEditingController> carboControllers = [];

int indentionflag = 0;
int indentionnum = 0;
int judge_num = 0;
int cooked_num = 0;
double? _deviceWidth, _deviceHeight;

class Note_add_new extends StatefulWidget {
  @override
  _Note_add_newState createState() => _Note_add_newState();
}

class _Note_add_newState extends State<Note_add_new> {
  @override
  void initState() {
    super.initState();
    loadSavedValues(); // 保存された値を読み込む
  }

  Future<void> loadSavedValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      for (int i = 0; i < cookedControllers.length; i++) {
        cookedControllers[i].text = prefs.getString('Cooked$i') ?? '';
        cooked_num = i;
      }
      for (int i = 0; i < carboControllers.length; i++) {
        carboControllers[i].text = prefs.getString('carbo$i') ?? '';
      }
    });
  }

  Future<void> saveValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < cookedControllers.length; i++) {
      prefs.setString('Cooked$i', cookedControllers[i].text);
    }
    for (int i = 0; i < carboControllers.length; i++) {
      prefs.setString('carbo$i', carboControllers[i].text);
    }
  }

  // 現在の日付を取得

  void addNewContainer() {
    TextEditingController newController = TextEditingController();
    cookedControllers.add(newController);
    TextEditingController newcarboController = TextEditingController();
    carboControllers.add(newcarboController);
    Widget newContainer = Flexible(
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
        width: _deviceWidth! * 0.43,
        height: _deviceHeight! * 0.2,
        decoration: BoxDecoration(
          color: Mycolors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topRight,
              child: IconButton(
                iconSize: _deviceWidth! * 0.05,
                icon: const Icon(Icons.cancel),
                onPressed: () {
                  // ...
                },
              ),
            ),
            Expanded(
              child: TextField(
                controller: newController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  labelText: '料理名',
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Text("糖質 : ", style: MyTextStyles.sblackboldText),
                  Expanded(
                    child: TextField(
                      controller: newcarboController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        labelText: '糖質量',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    setState(() {
      if (indentionflag == 0) {
        containers.add(newContainer);
      } else if (indentionflag == 1) {
        containers2.add(newContainer);
      } else if (indentionflag == 2) {
        containers3.add(newContainer);
      } else if (indentionflag == 3) {
        containers4.add(newContainer);
      } else if (indentionflag == 4) {
        containers5.add(newContainer);
      } else if (indentionflag == 5) {
        containers6.add(newContainer);
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Mycolors.lightGrey,
      body: SafeArea(
        child: Column(
          children: [
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
                              margin: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 15, right: 15),
                              width: _deviceWidth! * 0.47,
                              height: _deviceHeight! * 0.2,
                              decoration: BoxDecoration(
                                color: Mycolors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                      iconSize: _deviceWidth! * 0.05,
                                      icon: const Icon(Icons.cancel),
                                      onPressed: () {
                                        // ...
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: Text("ご飯",
                                        style: MyTextStyles.sblackboldText),
                                  ),
                                  Expanded(
                                    child: Text("糖質 : 55",
                                        style: MyTextStyles.sblackboldText),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 15, right: 15),
                              width: _deviceWidth! * 0.47,
                              height: _deviceHeight! * 0.2,
                              decoration: BoxDecoration(
                                color: Mycolors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                      iconSize: _deviceWidth! * 0.05,
                                      icon: const Icon(Icons.cancel),
                                      onPressed: () {
                                        // ...
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: Text("ご飯",
                                        style: MyTextStyles.sblackboldText),
                                  ),
                                  Expanded(
                                    child: Text("糖質 : 55",
                                        style: MyTextStyles.sblackboldText),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(children: containers),
                      Row(children: containers2),
                      Row(children: containers3),
                      Row(children: containers4),
                      Row(children: containers5),
                      Row(children: containers6),
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
                              child: IconButton(
                                iconSize: _deviceWidth! * 0.13,
                                icon: const Icon(Icons.add_outlined),
                                onPressed: () {
                                  //押したら追加

                                  indentionnum++;
                                  if (indentionnum == 1) {
                                    indentionflag = 0;
                                  } else if (indentionnum == 2) {
                                    indentionflag = 0;
                                  } else if (indentionnum == 3) {
                                    indentionflag = 1;
                                  } else if (indentionnum == 4) {
                                    indentionflag = 1;
                                  } else if (indentionnum == 5) {
                                    indentionflag = 2;
                                  } else if (indentionnum == 6) {
                                    indentionflag = 2;
                                  } else if (indentionnum == 7) {
                                    indentionflag = 3;
                                  } else if (indentionnum == 8) {
                                    indentionflag = 3;
                                  } else if (indentionnum == 9) {
                                    indentionflag = 4;
                                  } else if (indentionnum == 10) {
                                    indentionflag = 4;
                                  } else if (indentionnum == 11) {
                                    indentionflag = 5;
                                  } else if (indentionnum == 12) {
                                    indentionflag = 5;
                                  } else {
                                    indentionflag = 6;
                                  }
                                  addNewContainer();
                                },
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
                              child: IconButton(
                                iconSize: _deviceWidth! * 0.13,
                                icon: const Icon(Icons.search),
                                onPressed: () {
                                  // ...
                                },
                              ),
                            ),
                          ),
                        ],
                      )
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
                  saveValues();

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
