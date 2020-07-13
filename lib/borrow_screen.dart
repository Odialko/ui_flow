import 'package:flutter/material.dart';
import 'package:uiflow/loan_flow/flow_manager.dart';
import 'package:uiflow/loan_flow/loan_request_step_three.dart';
import 'package:uiflow/loan_flow/loan_request_step_two.dart';

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
            MaterialPageRoute(builder: (context) => FlowScreens(navigator: AndroidNav(),)),
          );
        },
        child: Icon(Icons.label_important),
      ),
    );
  }
}
class AndroidNav extends BorrowScreenNavigator {
  @override
  void toLoanRequestStepTwo(BuildContext context, callback, String amount) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoanRequestStepTwo(callback: callback, amount: amount,)),
    );
  }

  @override
  void toLoanRequestStepThree(BuildContext context, String amount) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoanRequestStepThree(amount: amount)),
    );
  }
}

abstract class BorrowScreenNavigator {
  void toLoanRequestStepTwo(BuildContext context, callback, String amount);
  void toLoanRequestStepThree(BuildContext context, String amount);
}
