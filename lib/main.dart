import 'package:flutter/material.dart';
import 'package:uiflow/borrow_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: BorrowScreen(),
    );
  }
}
//
//final counterProvider = StateProvider((ref) => 0);
//final titleProvider = Provider((ref) => 'Hello Viktor, push the button');
//
//void main() {
//  runApp(
//    ProviderScope(
//      child: MaterialApp(
//        home: BorrowScreen(),
//      ),
//    ),
//  );
//}
