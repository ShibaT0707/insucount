import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'text_styles.dart';
import 'colors.dart';
import 'camera.dart';
import 'home.dart';
import 'package:intl/intl.dart';
import 'note_add.dart';
import 'package:shared_preferences/shared_preferences.dart';

int selectedNumber = 0;
DateTime now = DateTime.now();
String formattedDate = DateFormat('M/d HH時mm分').format(now);
double _value1 = 100;
List<Widget> containers = [];
List<TextEditingController> cookedControllers = [];
List<TextEditingController> carboControllers = [];
List<TextEditingController> gramControllers = [];
double? _deviceWidth, _deviceHeight;
int i = 0;
List<TextEditingController> cookedCheckControllers = [];
int carboCount = 0;
int inslinEffect = 0;
List<String> carboList = [];
List<String> gramList = [];

class Note extends StatefulWidget {
  @override
  _NoteState createState() => _NoteState();
}

class _NoteState extends State<Note> {
  TextEditingController gramController = TextEditingController();
  // 現在の日付を取得
  void initState() {
    super.initState();
    clearSharedPreferences();
    // ウィジェットが初期化されたときに保存された値を読み込む

    loadSavedValuesFromNoteAdd();
    setCarboCount();
  }

  Future<void> setCarboCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      int hour = now.hour;
      setState(() {
        if (hour >= 5 && hour < 12) {
          String morningValue = prefs.getString('morning') ?? '';
          carboCount = morningValue.isNotEmpty ? int.parse(morningValue) : 0;
        } else if (hour >= 12 && hour < 18) {
          String afternoonValue = prefs.getString('afternoon') ?? '';
          carboCount =
              afternoonValue.isNotEmpty ? int.parse(afternoonValue) : 0;
        } else {
          String eveningValue = prefs.getString('evening') ?? '';
          carboCount = eveningValue.isNotEmpty ? int.parse(eveningValue) : 0;
        }
        String inslinEffectValue = prefs.getString('inslinEffect') ?? '';
        inslinEffect =
            inslinEffectValue.isNotEmpty ? int.parse(inslinEffectValue) : 0;
      });
    });
  }

  Future<void> setFlag() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setBool('flag', true);
    });
  }

  Future<void> clearValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int i_num = 0;
    bool exists = true;

    carboList.clear();
    gramList.clear();

    while (exists) {
      TextEditingController checkcontroller = TextEditingController();
      checkcontroller.text = prefs.getString('Cooked$i_num') ?? '';
      String? value = prefs.getString('Cooked$i_num');

      if (value != null) {
        setState(() {
          prefs.remove('Cooked$i_num');
          prefs.remove('carbo$i_num');
          prefs.remove('gram$i_num');
        });
        i_num++;
      } else {
        // 'Cooked$i' に値が存在しない場合
        exists = false;
      }
    }
  }

  Future<void> loadSavedValuesFromNoteAdd() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      gramList.add(gramController.text);
      carboList.add(prefs.getString('carbo$i') ?? '');
    });

    int i_num = 0;
    bool exists = true;
    while (exists) {
      TextEditingController checkcontroller = TextEditingController();
      checkcontroller.text = prefs.getString('Cooked$i_num') ?? '';
      String? value = prefs.getString('Cooked$i_num');

      if (value != null) {
        i_num++;
      } else {
        // 'Cooked$i' に値が存在しない場合
        exists = false;
      }
    }

    setState(() {
      containers.clear();
    });
    if (i_num != 0) {
      for (i = 0; i < i_num; i++) {
        TextEditingController cookedcontroller =
            TextEditingController(); // ここで新しいコントローラを生成
        TextEditingController carbocontroller =
            TextEditingController(); // ここで新しいコントローラを生成
        TextEditingController gramcontroller = TextEditingController();

        setState(() {
          cookedCheckControllers.add(cookedcontroller);
          cookedcontroller.text = prefs.getString('Cooked$i') ?? '';

          carboControllers.add(carbocontroller);
          carbocontroller.text = prefs.getString('carbo$i') ?? '';

          gramControllers.add(gramcontroller);

          addnewContainer(
              cookedcontroller.text, carbocontroller.text, gramcontroller);
        });
      }
    }
  }

  Future<void> addnewContainer(
      cookedController, carbocontroller, gramcontroller) async {
    Widget newContainer = Container(
        // width: double.infinity,
        child: Row(
      children: [
        Container(
          width: 100,
          margin: const EdgeInsets.only(top: 20, left: 20, bottom: 10),
          child: Text(
            cookedController,
            style: MyTextStyles.sBlackText.copyWith(
                fontSize:
                    MyTextStyles.sBlackText.fontSize! * _deviceWidth! * 0.002),
          ),
        ),
        Container(
          width: 55,
          height: 35,
          margin: const EdgeInsets.only(top: 20, left: 20, bottom: 10),
          child: TextField(
            controller: gramcontroller,
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
            margin: const EdgeInsets.only(top: 23, left: 5, bottom: 10),
            child: Text("gm",
                style: MyTextStyles.sBlackText.copyWith(
                    fontSize: MyTextStyles.sBlackText.fontSize! *
                        _deviceWidth! *
                        0.002))),
        Container(
            margin: const EdgeInsets.only(top: 20, left: 30, bottom: 10),
            child: Text("糖質",
                style: MyTextStyles.sBlackText.copyWith(
                    fontSize: MyTextStyles.sBlackText.fontSize! *
                        _deviceWidth! *
                        0.002))),
        Container(
            margin: const EdgeInsets.only(top: 20, left: 20, bottom: 10),
            child: Text(carbocontroller,
                style: MyTextStyles.sBlackText.copyWith(
                    fontSize: MyTextStyles.sBlackText.fontSize! *
                        _deviceWidth! *
                        0.002))),
        Container(
            margin: const EdgeInsets.only(top: 23, left: 5, bottom: 10),
            child: Text("gm",
                style: MyTextStyles.sBlackText.copyWith(
                    fontSize: MyTextStyles.sBlackText.fontSize! *
                        _deviceWidth! *
                        0.002))),
      ],
    ));

    containers.add(newContainer);
  }

  Future<void> clearSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // または、必要に応じて特定のキーに関連するデータのみを削除する
    prefs.remove('gram');
    // prefs.remove('afternoon');
    // prefs.remove('evening');
    // prefs.remove('insulinEffect');
  }

  Future<void> saveInslin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //carboCount
    //inslinEffect
    //carboList
    //gramList
    double foodInslin = 0;
    int inslin;
    double carbo_sum = 0;
    double hoseiInslin = 0;
    //prefsの中のcarboのlength取得
    int carboLength = 0;
    bool exists = true;
    while (exists) {
      String? value = prefs.getString('carbo$carboLength');

      if (value != null) {
        carboLength++;
      } else {
        // 'Cooked$i' に値が存在しない場合
        exists = false;
      }
    }
    print("carboLength:$carboLength");
    if (carboLength != 0) {
      for (int i = 0; i < carboLength; i++) {
        double carbo = double.parse(prefs.getString("carbo$i") ?? '');

        String? value_gram = gramControllers[i].text;

        if (value_gram != "") {
          int gram = int.parse(value_gram);

          double gram_num = gram / 100;

          int g_n = gram_num.toInt();

          carbo = carbo * g_n;
        }

        carbo_sum = carbo_sum + carbo;
      }

      foodInslin = carbo_sum / double.parse(carboCount.toString());
    }

    if (_value1 >= 120) {
      double an = _value1 - 120;

      String inslinEffect_str = prefs.getString('insulinEffect') ?? '0';
      inslinEffect = int.parse(inslinEffect_str);

      hoseiInslin = an / double.parse(inslinEffect.toString());
    }
    inslin = (foodInslin + hoseiInslin).toInt();

    setState(() {
      prefs.setString('inslin', inslin.toString());
    });
  }

  @override
  void dispose() {
    // ウィジェットが破棄されたときにコントローラを破棄する
    gramController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;
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
            Flexible(
              child: Container(
                  width: double.infinity,
                  height: 450,
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Mycolors.white),
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      Column(children: containers),
                      Container(
                          child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Mycolors.black, width: 2.0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              // margin:
                              //     const EdgeInsets.only(top: 60, bottom: 20),

                              child: IconButton(
                                iconSize: _deviceWidth! * 0.15,
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
                          ),
                          //空白
                          Flexible(
                            flex: 3,
                            fit: FlexFit.tight,
                            child: Container(
                              child: Text(""),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Mycolors.black, width: 2.0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              // margin: const EdgeInsets.only(
                              //     top: 60, left: 20, bottom: 20),
                              //端末のサイズによってサイズ変更
                              child: IconButton(
                                iconSize: _deviceWidth! * 0.15,
                                icon: Icon(Icons.note_add),
                                onPressed: () {
                                  //settingに遷移
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => note_add()),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ))
                    ],
                  ))),
            ),
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
                  setFlag();
                  saveInslin();
                  clearValues();
                  setState(() {
                    containers.clear(); // コンテナをクリア
                  });
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
