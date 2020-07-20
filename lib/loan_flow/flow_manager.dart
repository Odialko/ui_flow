import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:uiflow/loan_flow/bank_account_repository.dart';
import 'package:uiflow/loan_flow/borrow_store.dart';
import 'package:uiflow/loan_flow/loan_request_start.dart';
import 'package:provider/provider.dart';
import 'package:uiflow/loan_flow/loan_request_step_three.dart';
import 'package:uiflow/loan_flow/loan_request_step_two.dart';

class FlowScreens extends StatelessWidget {
  final Map<String, Widget> _screens = {
    '0': LoanRequestStart(),
    '1': LoanRequestStepTwo(),
    '2': LoanRequestStepThree()
  };

  BorrowStore store;

  @override
  Widget build(BuildContext context) {
    store = Provider.of<BorrowStore>(context);
    store.getBankAccountLoan();
    store.setupValidations();

    return Observer(
      builder: (_) => Container(
        child: _screens[store.currentPageId],
      ),
    );
  }
}

class ShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<BorrowStore>(
          create: (_) => BorrowStore(
            bankAccountRepository: BankAccountRepository(),
          ),
        ),
      ],
      child: FlowScreens(),
    );
  }
}
