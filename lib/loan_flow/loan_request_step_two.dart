import 'package:flutter/material.dart';
import 'package:uiflow/loan_flow/flow_manager.dart';

class LoanRequestStepTwo extends StatelessWidget {
  final Function callback;

  const LoanRequestStepTwo({Key key, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flow')),
      body: Center(
        child: Text(
          'This is LoanRequestStepTwo',
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          callback(EnumFlowScreens.third);
        },
        child: Icon(Icons.label_important),
      ),
    );
  }
}
