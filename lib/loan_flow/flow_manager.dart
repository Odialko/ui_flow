import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
  final BorrowStore borrowStore = BorrowStore(
    bankAccountRepository: BankAccountRepository(),
  );
  @override
  void initState() {
    super.initState();
  }

  Widget getScreen(EnumFlowScreens previous) {
    if (previous == EnumFlowScreens.start) {
      return LoanRequestStepTwo();
    } else if (previous == EnumFlowScreens.second) {
      return LoanRequestStepThree();
    } else {
      return LoanRequestStart();
    }
  }

  @override
  Widget build(BuildContext context) {
//    return currentPage;
    return Provider<BorrowStore>(
      create: (_) => borrowStore,
      child: Observer(
          builder: (_) =>
              Scaffold(body: getScreen(borrowStore.lastCompletedScreen))),
    );
  }
}
