import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:uiflow/loan_flow/bank_account_repository.dart';
import 'package:uiflow/model/bank_account.dart';

part 'borrow_store.g.dart';

class BorrowStore = _BorrowStore with _$BorrowStore;

abstract class _BorrowStore with Store {
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
  @observable
  String currentScreenIndex = '0';

  void set currentScreen(String screenIndex) => currentScreenIndex = screenIndex;

  ///----------------------------------------------------------------
  final BorrowErrorState error = BorrowErrorState();

  @observable
  String amount = '';

  @observable
  String stepTwo = '';

  List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [
      reaction((_) => amount, validateAmount),
      reaction((_) => stepTwo, validateStepTwo),
    ];
  }

  @action
  Future validateAmount(String value) async {
    if (value.isEmpty ||
        value == null ||
        double.parse(value) > bankAccountLoan.result.loanLimit) {
      error.amount = 'Cannot be blank';
      return;
    } else {
      error.amount = null;
    }
  }

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

  completeScreen({String currentScreen, String nextScreen, String screenId}) {
    switch (screenId) {
      case '0':
        {
          validateAmount(amount);
        }
        break;
      case '1':
        {
          validateStepTwo(stepTwo);
        }
        break;
    }
    if (error.amount == null && error.stepTwo == null) {
      currentScreenIndex = nextScreen;
    }
  }

  completeCurrentAndBack({String currentScreen, String previousScreen, String screenId}) {
//    switch (screenId) {
//      case '0':
//        {
//          amount = '';
//        }
//        break;
//      case '1':
//        {
//          stepTwo = '';
//        }
//        break;
//    }
    currentScreenIndex = previousScreen;
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
