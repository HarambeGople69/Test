import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../db/db_helper.dart';

class OuterLayerScreen extends StatefulWidget {
  const OuterLayerScreen({Key? key}) : super(key: key);

  @override
  _OuterLayerScreenState createState() => _OuterLayerScreenState();
}

class _OuterLayerScreenState extends State<OuterLayerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable:
            Hive.box<String>(DatabaseHelper.authenticationDB).listenable(),
        builder: (context, Box<String> boxs, child) {
          String value = boxs.get("state", defaultValue: "")!;
          print("===========");
          print(value);
          print("===========");
          return value == "" ? Text("data 1") : Text("data 2");
          // LoginScreen() : MainDashBoardScreen();
        },
      ),
    );
  }
}
