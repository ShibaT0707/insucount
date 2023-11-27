import 'package:flutter/material.dart';
import 'text_styles.dart';
import 'colors.dart';
import 'camera.dart';
import 'home.dart';
import 'package:intl/intl.dart';

int selectedNumber = 0;
DateTime now = DateTime.now();
String formattedDate = DateFormat('M/d HH時mm分').format(now);
double _value1 = 100;

class Note extends StatefulWidget {
  @override
  _NoteState createState() => _NoteState();
}

class _NoteState extends State<Note> {
  // 現在の日付を取得

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolors.lightGrey,
      body: Center(
        child: Column(
          children: [
            Container(
              color: Mycolors.white,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: Center(
                child: Text(formattedDate, style: MyTextStyles.mBlackText),
              ),
            ),
            Container(
                width: double.infinity,
                height: 450,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Mycolors.white),
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    Container(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Container(
                                width: 100,
                                margin: const EdgeInsets.only(
                                    top: 20, left: 20, bottom: 10),
                                child:
                                    Text("ご飯", style: MyTextStyles.sBlackText)),
                            Container(
                              width: 55,
                              height: 35,
                              margin: const EdgeInsets.only(
                                  top: 20, left: 20, bottom: 10),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: "100",
                                    filled: true,
                                    fillColor: Colors.grey.shade200,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    )),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.only(
                                    top: 23, left: 5, bottom: 10),
                                child:
                                    Text("gm", style: MyTextStyles.sBlackText)),
                            Container(
                                margin: const EdgeInsets.only(
                                    top: 20, left: 30, bottom: 10),
                                child:
                                    Text("糖質", style: MyTextStyles.sBlackText)),
                            Container(
                                margin: const EdgeInsets.only(
                                    top: 20, left: 20, bottom: 10),
                                child:
                                    Text("55", style: MyTextStyles.sBlackText)),
                            Container(
                                margin: const EdgeInsets.only(
                                    top: 23, left: 5, bottom: 10),
                                child:
                                    Text("gm", style: MyTextStyles.sBlackText)),
                          ],
                        )),
                    Container(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Container(
                                width: 100,
                                margin: const EdgeInsets.only(
                                    top: 20, left: 20, bottom: 10),
                                child:
                                    Text("ご飯", style: MyTextStyles.sBlackText)),
                            Container(
                              width: 55,
                              height: 35,
                              margin: const EdgeInsets.only(
                                  top: 20, left: 20, bottom: 10),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: "100",
                                    filled: true,
                                    fillColor: Colors.grey.shade200,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    )),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.only(
                                    top: 23, left: 5, bottom: 10),
                                child:
                                    Text("gm", style: MyTextStyles.sBlackText)),
                            Container(
                                margin: const EdgeInsets.only(
                                    top: 20, left: 30, bottom: 10),
                                child:
                                    Text("糖質", style: MyTextStyles.sBlackText)),
                            Container(
                                margin: const EdgeInsets.only(
                                    top: 20, left: 20, bottom: 10),
                                child:
                                    Text("55", style: MyTextStyles.sBlackText)),
                            Container(
                                margin: const EdgeInsets.only(
                                    top: 23, left: 5, bottom: 10),
                                child:
                                    Text("gm", style: MyTextStyles.sBlackText)),
                          ],
                        )),
                    Container(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Container(
                                width: 100,
                                margin: const EdgeInsets.only(
                                    top: 20, left: 20, bottom: 10),
                                child:
                                    Text("ご飯", style: MyTextStyles.sBlackText)),
                            Container(
                              width: 55,
                              height: 35,
                              margin: const EdgeInsets.only(
                                  top: 20, left: 20, bottom: 10),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: "100",
                                    filled: true,
                                    fillColor: Colors.grey.shade200,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    )),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.only(
                                    top: 23, left: 5, bottom: 10),
                                child:
                                    Text("gm", style: MyTextStyles.sBlackText)),
                            Container(
                                margin: const EdgeInsets.only(
                                    top: 20, left: 30, bottom: 10),
                                child:
                                    Text("糖質", style: MyTextStyles.sBlackText)),
                            Container(
                                margin: const EdgeInsets.only(
                                    top: 20, left: 20, bottom: 10),
                                child:
                                    Text("55", style: MyTextStyles.sBlackText)),
                            Container(
                                margin: const EdgeInsets.only(
                                    top: 23, left: 5, bottom: 10),
                                child:
                                    Text("gm", style: MyTextStyles.sBlackText)),
                          ],
                        )),
                    Container(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Container(
                                width: 100,
                                margin: const EdgeInsets.only(
                                    top: 20, left: 20, bottom: 10),
                                child:
                                    Text("ご飯", style: MyTextStyles.sBlackText)),
                            Container(
                              width: 55,
                              height: 35,
                              margin: const EdgeInsets.only(
                                  top: 20, left: 20, bottom: 10),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: "100",
                                    filled: true,
                                    fillColor: Colors.grey.shade200,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    )),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.only(
                                    top: 23, left: 5, bottom: 10),
                                child:
                                    Text("gm", style: MyTextStyles.sBlackText)),
                            Container(
                                margin: const EdgeInsets.only(
                                    top: 20, left: 30, bottom: 10),
                                child:
                                    Text("糖質", style: MyTextStyles.sBlackText)),
                            Container(
                                margin: const EdgeInsets.only(
                                    top: 20, left: 20, bottom: 10),
                                child:
                                    Text("55", style: MyTextStyles.sBlackText)),
                            Container(
                                margin: const EdgeInsets.only(
                                    top: 23, left: 5, bottom: 10),
                                child:
                                    Text("gm", style: MyTextStyles.sBlackText)),
                          ],
                        )),
                    Container(
                        child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Mycolors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.only(top: 60, bottom: 20),
                          child: IconButton(
                            iconSize: 80,
                            icon: Icon(Icons.camera_alt_outlined),
                            onPressed: () {
                              //settingに遷移
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Camera()),
                              );
                            },
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Mycolors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.only(
                              top: 60, left: 180, bottom: 20),
                          child: IconButton(
                            iconSize: 80,
                            icon: Icon(Icons.note_add),
                            onPressed: () => {},
                          ),
                        ),
                      ],
                    ))
                  ],
                ))),
            Container(
                width: double.infinity,
                height: 100,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Mycolors.white),
                child: Column(
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(top: 10, left: 10, bottom: 10),
                      child: Row(
                        children: [
                          Container(
                              margin: const EdgeInsets.only(left: 30),
                              child: Text("現在の血糖値",
                                  style: MyTextStyles.sBlackText)),
                          Container(
                              margin: const EdgeInsets.only(left: 50),
                              child: Text(_value1.round().toString(),
                                  style: MyTextStyles.sBlackText)),
                          Container(
                            margin: const EdgeInsets.only(left: 5, top: 2),
                            child:
                                Text("mg/dL", style: MyTextStyles.sBlackText),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Slider(
                        value: _value1,
                        min: 0,
                        max: 500,
                        divisions: 200,
                        label: _value1.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _value1 = value;
                          });
                        },
                      ),
                    ),
                  ],
                )),
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
