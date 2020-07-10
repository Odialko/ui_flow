import 'package:uiflow/model/bank_account.dart';

class BankAccountRepository {
  Future<List<BankAccount>> getAccounts(String customerId) {
    return Future.value(
      Iterable<int>.generate(4)
          .toList()
          .map(
            (i) => BankAccount(
            id: "$i",
            name: "Current Account",
            balance: (i + 1) * 10000.00,
            currency: "KES",
            notes: "account notes",
            overdraft: 560000,
            loan: 0,
            loanLimit: 0),
      )
          .toList(),
    );
  }
  Future<BankAccount> getAccountLoan(String customerId) {
    return Future.value(
      BankAccount(
          id: customerId,
          name: "Current Account",
          balance: 10000.00,
          currency: "KES",
          notes: "account notes",
          overdraft: 560000,
          loan: 0,
          loanLimit: 0),
    );
  }
}
