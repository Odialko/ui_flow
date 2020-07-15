import 'package:flutter/material.dart';
import 'package:uiflow/loan_flow/bank_account_repository.dart';
import 'package:uiflow/loan_flow/borrow_store.dart';
import 'package:uiflow/loan_flow/loan_request_start.dart';
import 'package:provider/provider.dart';
import 'package:uiflow/loan_flow/loan_request_step_three.dart';
import 'package:uiflow/loan_flow/loan_request_step_two.dart';

enum EnumFlowScreens { start, second, third }

class FlowScreens extends StatefulWidget {
  @override
  _FlowScreensState createState() => _FlowScreensState();
}

class _FlowScreensState extends State<FlowScreens> {
  Widget currentPage;

  @override
  void initState() {
    super.initState();

    callback(EnumFlowScreens.start);
  }

  void callback(nextPage) {
    setState(() {
      if (nextPage == EnumFlowScreens.second) {
        currentPage = LoanRequestStepTwo(callback: this.callback,);
//        widget.navigator.toLoanRequestStepTwo(context, this.callback);
      } else if (nextPage == EnumFlowScreens.third) {
        currentPage = LoanRequestStepThree();
//            widget.navigator.toLoanRequestStepThree(context);
      } else {
        this.currentPage = LoanRequestStart(callback: this.callback);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
//    return currentPage;
    return Provider<BorrowStore>(
      create: (_) => BorrowStore(
        bankAccountRepository: BankAccountRepository(),
      ),
      child: Scaffold(body: currentPage),
    );
  }
}
