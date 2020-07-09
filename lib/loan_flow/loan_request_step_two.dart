import 'package:flutter/material.dart';
import 'package:uiflow/loan_flow/flow_manager.dart';
import 'package:uiflow/loan_flow/loan_request_step_three.dart';
class LoanRequestStepTwo extends StatefulWidget {
  final Function function;

  const LoanRequestStepTwo({Key key, this.function}) : super(key: key);

  @override
  _LoanRequestStepTwoState createState() => _LoanRequestStepTwoState();
}

class _LoanRequestStepTwoState extends State<LoanRequestStepTwo> {

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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NavigationController(
//            loanScreens: loanScreens,
                index: 2,
              ),
            ),
          );
        },
        child: Icon(Icons.label_important),
      ),
    );
  }
}
