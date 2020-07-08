import 'package:flutter/material.dart';
import 'package:uiflow/loan_flow/flow_manager.dart';
import 'package:uiflow/loan_flow/loan_request_step_two.dart';

class LoanRequestStart extends StatelessWidget {
  final List loanScreens;
  final Function onSelected;
//  final Map<int, Widget> hubScreens;

  const LoanRequestStart({Key key, this.loanScreens, this.onSelected}) : super(key: key);

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
//          NavigationController(
//            loanScreens: loanScreens,
//            index: 1,
//          ).navigate(context);
//          Navigator.push(
//            context,
//            MaterialPageRoute(builder: (context) => LoanRequestStepTwo()),
//          );
        },
//          Navigator.push(
//            context,
//            MaterialPageRoute(builder: (context) => LoanRequestStepTwo()),
//          );

        child: Icon(Icons.label_important),
      ),
    );
  }
}
