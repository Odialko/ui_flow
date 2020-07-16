import 'package:flutter/material.dart';
import 'package:uiflow/borrow_screen.dart';
import 'package:logging/logging.dart';
import 'router.gr.dart';
import 'package:auto_route/auto_route.dart';

void main() {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.message}');
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: BorrowScreen(),
      builder: ExtendedNavigator<Router>(router: Router()),
    );
  }
}
