import 'package:flutter/material.dart';
import 'package:uiflow/loan_flow/loan_request_step_two.dart';

class LoanRequestStart extends StatelessWidget {
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoanRequestStepTwo()),
          );
        },
        child: Icon(Icons.label_important),
      ),
    );
  }
}
