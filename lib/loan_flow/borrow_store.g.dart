// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'borrow_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BorrowStore on _BorrowStore, Store {
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

  @override
  String toString() {
    return '''
amount: ${amount},
stepTwo: ${stepTwo}
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
