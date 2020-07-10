import 'package:flutter/material.dart';
import 'package:uiflow/loan_flow/flow_manager.dart';
import 'package:uiflow/loan_flow/loan_request_step_three.dart';

class LoanRequestStepTwo extends StatelessWidget {
  final Function callback;

  const LoanRequestStepTwo({Key key, this.callback}) : super(key: key);

//  @override
//  _LoanRequestStepTwoState createState() => _LoanRequestStepTwoState();
//}
//
//class _LoanRequestStepTwoState extends State<LoanRequestStepTwo> {

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
          callback(LoanRequestStepThree());
//          widget.navigator.toLoanRequestStepThree(context);
        },
        child: Icon(Icons.label_important),
      ),
    );
  }
}
