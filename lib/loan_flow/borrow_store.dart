import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'file:///C:/Users/vikto/app/ui_flow/lib/repo/bank_account_repository.dart';
import 'package:uiflow/model/bank_account.dart';

part 'borrow_store.g.dart';

class BorrowStore = _BorrowStore with _$BorrowStore;

enum ScreenType { start, second, third }

abstract class _BorrowStore with Store {
  ///Common part of MobX Store
  _BorrowStore({@required this.bankAccountRepository})
      : assert(bankAccountRepository != null,
            "'bankAccountRepository' cannot be null for BorrowStore");

  final BankAccountRepository bankAccountRepository;

  @observable
  ObservableFuture<BankAccount> bankAccountLoan;

  @action
  ObservableFuture<BankAccount> getBankAccountLoan() {
    bankAccountLoan = ObservableFuture<BankAccount>(
        bankAccountRepository.getAccountLoan("100"));
    return bankAccountLoan;
  }

  ///---------------
  ///Part to display the desired screen
  @observable
  int currentScreenIndex = 0;

  void set currentScreen(int screenIndex) => currentScreenIndex = screenIndex;

  changeScreen({int currentScreen, bool nextScreen = true}) {
    if (error.amount == null && error.stepTwo == null && nextScreen) {
      currentScreenIndex++;
    } else if (!nextScreen) {
      ///if we are going back all validation make equal null
      error.amount = null;
      error.stepTwo = null;
      currentScreenIndex--;
    }
  }

  ///--------------
  ///Part to validate each screen separately.
  ///all variables and all validation logic
  ///for each screen should be described separately
  ///
  final BorrowErrorState error = BorrowErrorState();

  ///variable for LoanRequestStart()
  @observable
  String amount = '';

  ///variable for LoanRequestStepTwo()
  @observable
  String stepTwo = '';

  List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [
      reaction((_) => amount, validateAmount),
      reaction((_) => stepTwo, validateStepTwo),
    ];
  }

  ///validation for the LoanRequestStart()
  @action
  Future validateAmount(String value) async {
    if (value.isEmpty || value == null) {
      error.amount = 'Cannot be blank';
      return;
    } else if (double.parse(value) > bankAccountLoan.result.loanLimit) {
      error.amount = 'Your limit is: ${bankAccountLoan.result.loanLimit}';
      return;
    } else {
      error.amount = null;
    }
  }

  ///validation for the LoanRequestStepTwo()
  @action
  Future validateStepTwo(String value) async {
    if (value.isEmpty || value == null) {
      error.stepTwo = 'Cannot be blank';
      return;
    } else {
      error.stepTwo = null;
    }
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  ///call validation function when we need it to move forward with valid data
  ///for the arrow back it not needed
  validateScreen(ScreenType screenType) {
    switch (screenType) {
      case ScreenType.start:
        {
          validateAmount(amount);
        }
        break;
      case ScreenType.second:
        {
          validateStepTwo(stepTwo);
        }
        break;
      default:
        break;
    }
  }
}

class BorrowErrorState = _BorrowErrorState with _$BorrowErrorState;

abstract class _BorrowErrorState with Store {
  @observable
  String amount;
  @observable
  String stepTwo;

  @computed
  bool get hasErrors => amount != null || stepTwo != null;
}
