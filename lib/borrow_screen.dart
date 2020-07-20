import 'package:flutter/material.dart';
import 'package:uiflow/loan_flow/flow_manager.dart';

class BorrowScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flow')),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            'Hi there, this is a BorrowScreen',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ShowPage()),
          );
        },
        child: Icon(Icons.label_important),
      ),
    );
  }
}
