import 'package:flutter/material.dart';
import 'package:uiflow/loan_flow/flow_manager.dart';

class LoanRequestStart extends StatelessWidget {
  final Function callback;
  final BorrowScreenNavigator navigator;
  const LoanRequestStart({Key key, this.callback, this.navigator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flow')),
      body: Center(
        child: Text(
          'This is LoanRequestStart',
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          callback(EnumFlowScreens.second);
        },
        child: Icon(Icons.label_important),
      ),
    );
  }
}
