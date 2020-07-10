import 'package:flutter/material.dart';
import 'package:uiflow/borrow_screen.dart';
import 'package:uiflow/loan_flow/flow_manager.dart';
import 'package:uiflow/loan_flow/loan_request_step_two.dart';

class LoanRequestStart extends StatelessWidget {
//  final BorrowScreenNavigator navigator;
  final Function callback;
  const LoanRequestStart({Key key, this.callback}) : super(key: key);

//  @override
//  _LoanRequestStartState createState() => _LoanRequestStartState();
//}
//
//class _LoanRequestStartState extends State<LoanRequestStart> {

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
          callback(LoanRequestStepTwo());
        },
        child: Icon(Icons.label_important),
      ),
    );
  }
}
