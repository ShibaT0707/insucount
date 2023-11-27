import 'package:flutter/material.dart';
import 'text_styles.dart';
import 'colors.dart';
import 'setting.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Mycolors.white,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Center(
                child: Text(
                  'InsuCount',
                  style: MyTextStyles.lTitle,
                ),
              ),
            ),
            Flexible(
              child: TextButton(
                onPressed: () {
                  //settingに遷移
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Setting()),
                  );
                },
                child: Text('スタート', style: MyTextStyles.mGreyText),
              ),
            )
          ],
        )));
  }
}
