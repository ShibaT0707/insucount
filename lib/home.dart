// import 'dart:ffi';
import 'dart:html';

import 'package:flutter/material.dart';
import 'text_styles.dart';
import 'colors.dart';
import 'setting.dart';
import 'note_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'inslin.dart';

bool flag = false;

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  void initState() {
    super.initState();
    getFlag();
  }

  Future<void> getFlag() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      flag = prefs.getBool('flag') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Mycolors.white,
              leading: IconButton(
                //外枠黒

                icon: const Icon(
                  Icons.settings,
                  color: Mycolors.black,
                ),
                onPressed: () {
                  //settingに遷移
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Setting()),
                  );
                },
              ),
              title: Text(
                'InsuCount',
                style: MyTextStyles.barTitle,
              ),
              bottom: const TabBar(
                indicatorColor: Colors.red,
                tabs: [
                  Tab(
                    child: Text(
                      "メモ",
                      style: MyTextStyles.barText,
                    ),
                  ),
                  Tab(
                    child: Text(
                      "カレンダー",
                      style: MyTextStyles.barText,
                    ),
                  ),
                  Tab(
                    child: Text(
                      "平均/A1C",
                      style: MyTextStyles.barText,
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                // メモページ
                if (flag == false)
                  Container(
                    child: Note(),
                  ),
                if (flag == true)
                  Container(
                    child: inslin(),
                  ),

                // カレンダーページ
                Container(
                  child: Center(
                    child: Text('カレンダーページ'),
                  ),
                ),

                // 平均/A1Cページ
                Container(
                  child: Center(
                    child: Text('平均/A1Cページ'),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
