import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:uiflow/loan_flow/bank_account_repository.dart';
import 'package:uiflow/loan_flow/flow_manager.dart';
import 'package:uiflow/model/bank_account.dart';

part 'borrow_store.g.dart';

class BorrowStore = _BorrowStore with _$BorrowStore;

abstract class _BorrowStore with Store {
//  _BorrowStore({@required this.bankAccountRepository})
//      : assert(bankAccountRepository != null,
//  "'bankAccountRepository' cannot be null for BorrowStore");
//
//  final BankAccountRepository bankAccountRepository;
//
//  @observable
//  ObservableFuture<BankAccount> bankAccountLoan;
//
//  @action
//  ObservableFuture<BankAccount> getBankAccountLoan() {
//    bankAccountLoan = ObservableFuture<BankAccount>(
//        bankAccountRepository.getAccountLoan("100"));
//    return bankAccountLoan;
//  }
//


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
    if (value.isEmpty || value == null) {
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

  validateStepStartAndGoToSecond(context, callback) {
    validateAmount(amount);
    if(amount != '') {
      callback(EnumFlowScreens.second);
    }
  }
  validateStepTwoAndGoToThree(context, callback) {
    validateStepTwo(stepTwo);
    if(stepTwo != '') {
      callback(EnumFlowScreens.third);
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
