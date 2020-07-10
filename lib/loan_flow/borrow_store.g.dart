// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'borrow_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BorrowStore on _BorrowStore, Store {
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
  String toString() {
    return '''
bankAccountLoan: ${bankAccountLoan}
    ''';
  }
}
