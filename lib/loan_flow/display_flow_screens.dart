import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:uiflow/loan_flow/bank_account_repository.dart';
import 'package:uiflow/loan_flow/borrow_store.dart';
import 'package:uiflow/loan_flow/loan_request_start.dart';
import 'package:provider/provider.dart';
import 'package:uiflow/loan_flow/loan_request_step_three.dart';
import 'package:uiflow/loan_flow/loan_request_step_two.dart';

class DisplayFlowScreens extends StatelessWidget {
  ///Block with test screens
  ///we could pass any of this Map and we will have own validation for each screen
  ///and we will be able to transition from 0 -> to 2 screen by screen
  final Map<int, Widget> screens = {
    0: LoanRequestStart(),
    1: LoanRequestStepTwo(),
    2: LoanRequestStepThree()
  };

  final Map<int, Widget> screensSecondVariant = {
    0: LoanRequestStepTwo(),
    1: LoanRequestStart(),
    2: LoanRequestStepThree()
  };

  @override
  Widget build(BuildContext context) {
    final BorrowStore store = BorrowStore(
      bankAccountRepository: BankAccountRepository(),
    );
    ///activate bank account
    store.getBankAccountLoan();
    ///call setupValidations() for validation onchange
    store.setupValidations();

    return MultiProvider(
        providers: [
          Provider<BorrowStore>(
            create: (_) => store,
          ),
        ],
        child: Observer(
          builder: (_) => Container(
            ///get needed screen by index
            child: screensSecondVariant[store.currentScreenIndex],
          ),
        ),
    );
  }
}
