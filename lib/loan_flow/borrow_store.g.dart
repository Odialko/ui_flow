// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'borrow_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BorrowStore on _BorrowStore, Store {
  Computed<EnumFlowScreens> _$lastCompletedScreenComputed;

  @override
  EnumFlowScreens get lastCompletedScreen => (_$lastCompletedScreenComputed ??=
          Computed<EnumFlowScreens>(() => super.lastCompletedScreen,
              name: '_BorrowStore.lastCompletedScreen'))
      .value;

  final _$bankAccountLoanAtom = Atom(name: '_BorrowStore.bankAccountLoan');

  @override
  ObservableFuture<BankAccount> get bankAccountLoan {
    _$bankAccountLoanAtom.reportRead();
    return super.bankAccountLoan;
  }

  @override
  set bankAccountLoan(ObservableFuture<BankAccount> value) {
    _$bankAccountLoanAtom.reportWrite(value, super.bankAccountLoan, () {
      super.bankAccountLoan = value;
    });
  }

  final _$_lastCompletedScreenAtom =
      Atom(name: '_BorrowStore._lastCompletedScreen');

  @override
  EnumFlowScreens get _lastCompletedScreen {
    _$_lastCompletedScreenAtom.reportRead();
    return super._lastCompletedScreen;
  }

  @override
  set _lastCompletedScreen(EnumFlowScreens value) {
    _$_lastCompletedScreenAtom.reportWrite(value, super._lastCompletedScreen,
        () {
      super._lastCompletedScreen = value;
    });
  }

  final _$amountAtom = Atom(name: '_BorrowStore.amount');

  @override
  String get amount {
    _$amountAtom.reportRead();
    return super.amount;
  }

  @override
  set amount(String value) {
    _$amountAtom.reportWrite(value, super.amount, () {
      super.amount = value;
    });
  }

  final _$stepTwoAtom = Atom(name: '_BorrowStore.stepTwo');

  @override
  String get stepTwo {
    _$stepTwoAtom.reportRead();
    return super.stepTwo;
  }

  @override
  set stepTwo(String value) {
    _$stepTwoAtom.reportWrite(value, super.stepTwo, () {
      super.stepTwo = value;
    });
  }

  final _$validateAmountAsyncAction =
      AsyncAction('_BorrowStore.validateAmount');

  @override
  Future<dynamic> validateAmount(String value) {
    return _$validateAmountAsyncAction.run(() => super.validateAmount(value));
  }

  final _$validateStepTwoAsyncAction =
      AsyncAction('_BorrowStore.validateStepTwo');

  @override
  Future<dynamic> validateStepTwo(String value) {
    return _$validateStepTwoAsyncAction.run(() => super.validateStepTwo(value));
  }

  final _$_BorrowStoreActionController = ActionController(name: '_BorrowStore');

  @override
  ObservableFuture<BankAccount> getBankAccountLoan() {
    final _$actionInfo = _$_BorrowStoreActionController.startAction(
        name: '_BorrowStore.getBankAccountLoan');
    try {
      return super.getBankAccountLoan();
    } finally {
      _$_BorrowStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void complete(EnumFlowScreens screen) {
    final _$actionInfo = _$_BorrowStoreActionController.startAction(
        name: '_BorrowStore.complete');
    try {
      return super.complete(screen);
    } finally {
      _$_BorrowStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
bankAccountLoan: ${bankAccountLoan},
amount: ${amount},
stepTwo: ${stepTwo},
lastCompletedScreen: ${lastCompletedScreen}
    ''';
  }
}

mixin _$BorrowErrorState on _BorrowErrorState, Store {
  Computed<bool> _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_BorrowErrorState.hasErrors'))
          .value;

  final _$amountAtom = Atom(name: '_BorrowErrorState.amount');

  @override
  String get amount {
    _$amountAtom.reportRead();
    return super.amount;
  }

  @override
  set amount(String value) {
    _$amountAtom.reportWrite(value, super.amount, () {
      super.amount = value;
    });
  }

  final _$stepTwoAtom = Atom(name: '_BorrowErrorState.stepTwo');

  @override
  String get stepTwo {
    _$stepTwoAtom.reportRead();
    return super.stepTwo;
  }

  @override
  set stepTwo(String value) {
    _$stepTwoAtom.reportWrite(value, super.stepTwo, () {
      super.stepTwo = value;
    });
  }

  @override
  String toString() {
    return '''
amount: ${amount},
stepTwo: ${stepTwo},
hasErrors: ${hasErrors}
    ''';
  }
}
