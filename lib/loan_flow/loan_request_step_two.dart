import 'package:flutter/material.dart';
import 'package:uiflow/loan_flow/flow_manager.dart';
import 'package:uiflow/loan_flow/loan_request_step_three.dart';

class LoanRequestStepTwo extends StatelessWidget {
  final List loanScreens;
  final Function(Widget) onSelected;

  const LoanRequestStepTwo({Key key, this.loanScreens, this.onSelected}) : super(key: key);

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
//          NavigationController(
//              loanScreens: loanScreens,
//              index: 2
//          ).navigate(context);
//          Navigator.push(
//            context,
//            MaterialPageRoute(builder: (context) => LoanRequestStepThree()),
//          );
        },
        child: Icon(Icons.label_important),
      ),
    );
  }
}
