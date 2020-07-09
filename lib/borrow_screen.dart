import 'package:flutter/material.dart';
import 'package:uiflow/loan_flow/navigation_controller.dart';

class BorrowScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flow')),
      body: Center(
        child: Text(
          'Hi there, this is BorrowScreen',
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NavigationController(index: 0,)),
          );
        },
        child: Icon(Icons.label_important),
      ),
    );
  }
}
