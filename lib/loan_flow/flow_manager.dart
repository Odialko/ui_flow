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
      widget.navigator.toLoanRequestStepTwo(context, this.callback, amount);
    } else if (nextPage == EnumFlowScreens.third) {
      widget.navigator.toLoanRequestStepThree(context, amount);
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
