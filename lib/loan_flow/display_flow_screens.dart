import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:uiflow/loan_flow/bank_account_repository.dart';
import 'package:uiflow/loan_flow/borrow_store.dart';
import 'package:uiflow/loan_flow/loan_request_start.dart';
import 'package:provider/provider.dart';
import 'package:uiflow/loan_flow/loan_request_step_three.dart';
import 'package:uiflow/loan_flow/loan_request_step_two.dart';

class DisplayFlowScreens extends StatelessWidget {
  final Map<String, Widget> screens = {
    '0': LoanRequestStart(),
    '1': LoanRequestStepTwo(),
    '2': LoanRequestStepThree()
  };

  final Map<String, Widget> screensSecondVariant = {
    '0': LoanRequestStepTwo(),
    '1': LoanRequestStart(),
    '2': LoanRequestStepThree()
  };


  @override
  Widget build(BuildContext context) {
    final BorrowStore store = BorrowStore(
      bankAccountRepository: BankAccountRepository(),
    );
    store.getBankAccountLoan();
    store.setupValidations();

    return MultiProvider(
        providers: [
          Provider<BorrowStore>(
            create: (_) => store,
          ),
        ],
        child: Observer(
          builder: (_) => Container(
            child: screens[store.currentScreenIndex],
          ),
        ),
    );
  }
}
