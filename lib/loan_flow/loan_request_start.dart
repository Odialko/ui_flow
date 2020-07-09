import 'package:flutter/material.dart';
import 'package:uiflow/loan_flow/navigation_controller.dart';

class LoanRequestStart extends StatefulWidget {
  final Function function;

  const LoanRequestStart({Key key, this.function}) : super(key: key);

  @override
  _LoanRequestStartState createState() => _LoanRequestStartState();
}

class _LoanRequestStartState extends State<LoanRequestStart> {
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
            MaterialPageRoute(
              builder: (context) => NavigationController(
//            loanScreens: loanScreens,
                index: 1,
              ),
            ),
          );
        },
        child: Icon(Icons.label_important),
      ),
    );
  }
}
