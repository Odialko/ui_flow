import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';
import 'package:uiflow/loan_flow/bank_account_repository.dart';
import 'package:uiflow/model/bank_account.dart';

part 'borrow_store.g.dart';

class BorrowStore = _BorrowStore with _$BorrowStore;

abstract class _BorrowStore with Store {
  _BorrowStore({@required this.bankAccountRepository})
      : assert(bankAccountRepository != null,
  "'bankAccountRepository' cannot be null for BorrowRepository");

  final BankAccountRepository bankAccountRepository;

  @observable
  ObservableFuture<BankAccount> bankAccountLoan;

  @action
  ObservableFuture<BankAccount> getBankAccountLoan() {
    bankAccountLoan = ObservableFuture<BankAccount>(
        bankAccountRepository.getAccountLoan("100"));
    return bankAccountLoan;
  }
}