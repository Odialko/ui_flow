import 'package:flutter/material.dart';
import 'package:uiflow/loan_flow/loan_request_start.dart';
import 'package:uiflow/loan_flow/loan_request_step_three.dart';
import 'package:uiflow/loan_flow/loan_request_step_two.dart';

class NavigationController extends StatefulWidget {
  final int index;

  const NavigationController({Key key, this.index}) : super(key: key);

  @override
  _NavigationControllerState createState() => _NavigationControllerState();
}

class _NavigationControllerState extends State<NavigationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlowScreens(
        index: widget.index,
      ),
    );
  }
}

class FlowScreens extends StatelessWidget {
  final int index;

  FlowScreens({Key key, this.index}) : super(key: key);

  final List loanScreens = [
    LoanRequestStart(),
    LoanRequestStepTwo(),
    LoanRequestStepThree(),
  ];

  @override
  Widget build(BuildContext context) {
    return loanScreens[index];
  }
}
