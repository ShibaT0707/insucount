import 'package:flutter/material.dart';
import 'package:insucount/note_add_new.dart';
import 'text_styles.dart';
import 'colors.dart';
import 'setting.dart';
import 'note_page.dart';
import 'store.dart';

class note_add extends StatefulWidget {
  @override
  _note_addState createState() => _note_addState();
}

class _note_addState extends State<note_add> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
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
                      "新規",
                      style: MyTextStyles.barText,
                    ),
                  ),
                  Tab(
                    child: Text(
                      "お店のレシピ",
                      style: MyTextStyles.barText,
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                // メモページ
                Container(
                  child: Note_add_new(),
                ),

                // カレンダーページ
                Container(
                  child: Center(
                    child: Store(),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
