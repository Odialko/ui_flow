import 'package:flutter/material.dart';
import 'package:uiflow/loan_flow/bank_account_repository.dart';
import 'package:uiflow/loan_flow/borrow_store.dart';
import 'package:uiflow/loan_flow/loan_request_start.dart';
import 'package:uiflow/loan_flow/loan_request_step_three.dart';
import 'package:uiflow/loan_flow/loan_request_step_two.dart';
import 'package:provider/provider.dart';

enum EnumFlowScreens {start, second, third}

class FlowScreens extends StatefulWidget {
  final BorrowScreenNavigator navigator;

  const FlowScreens({Key key, this.navigator}) : super(key: key);
  @override
  _FlowScreensState createState() => _FlowScreensState();
}

class _FlowScreensState extends State<FlowScreens> {
  Widget currentPage;

  @override
  void initState() {
    super.initState();

    currentPage = LoanRequestStart(callback: this.callback);
  }

  void callback(nextPage, {String amount = ''}) {
    setState(() {
      if (nextPage == EnumFlowScreens.second) {
        this.currentPage = LoanRequestStepTwo(callback: this.callback, amount: amount);
      } else if (nextPage == EnumFlowScreens.third) {
        this.currentPage = LoanRequestStepThree();
      } else {
        this.currentPage = LoanRequestStart(callback: this.callback);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => BorrowStore(
        bankAccountRepository: BankAccountRepository(),
      ),
      child: Scaffold(
          body: currentPage
      ),
    );
  }
}

class _AndroidNav extends BorrowScreenNavigator {
  @override
  void toLoanRequestStartScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoanRequestStart()),
    );
  }

  @override
  void toLoanRequestStepTwo(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoanRequestStepTwo()),
    );
  }

  @override
  void toLoanRequestStepThree(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoanRequestStepThree()),
    );
  }
}

abstract class BorrowScreenNavigator {
  void toLoanRequestStartScreen(BuildContext context);
  void toLoanRequestStepTwo(BuildContext context);
  void toLoanRequestStepThree(BuildContext context);
}
