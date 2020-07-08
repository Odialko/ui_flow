import 'package:flutter/material.dart';
import 'package:uiflow/loan_flow/loan_request_start.dart';
import 'package:uiflow/loan_flow/loan_request_step_three.dart';
import 'package:uiflow/loan_flow/loan_request_step_two.dart';

class FlowSelected extends StatefulWidget {
  final int index;

  const FlowSelected({Key key, this.index}) : super(key: key);
  @override
  FlowSelectedState createState() => FlowSelectedState();
}

class FlowSelectedState extends State<FlowSelected> {

  final List loanScreens = [
    LoanRequestStart(),
    LoanRequestStepTwo(),
    LoanRequestStepThree(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NavigationController(
        loanScreens: loanScreens,
        index: widget.index,
      ),
    );
  }
}

class NavigationController extends StatefulWidget {
  final List loanScreens;
  final int index;
  NavigationController({Key key, this.loanScreens, this.index}) : super(key: key);

  @override
  _NavigationControllerState createState() => _NavigationControllerState();
}

class _NavigationControllerState extends State<NavigationController> {
  @override
  Widget build(BuildContext context) {
    return widget.loanScreens[widget.index];
  }
}
