import 'package:flutter/material.dart';
import 'package:uiflow/loan_flow/loan_request_start.dart';
import 'package:uiflow/loan_flow/loan_request_step_three.dart';
import 'package:uiflow/loan_flow/loan_request_step_two.dart';

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
