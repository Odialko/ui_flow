import 'package:meta/meta.dart';

class BankAccount {
  BankAccount(
      {@required this.id,
        @required this.name,
        @required this.balance,
        @required this.currency,
        @required this.notes,
        @required this.overdraft,
        @required this.loan,
        @required this.loanLimit})
      : assert(id != null, "'id' cannot be null for BankAccount"),
        assert(name != null, "'name' cannot be null for BankAccount"),
        assert(balance != null, "'balance' cannot be null for BankAccount"),
        assert(currency != null, "'currency' cannot be null for BankAccount"),
        assert(notes != null, "'notes' cannot be null for BankAccount"),
        assert(overdraft != null, "'notes' cannot be null for BankAccount"),
        assert(loan != null, "'notes' cannot be null for BankAccount"),
        assert(loanLimit != null, "'notes' cannot be null for BankAccount");

  String id;
  String name;
  double balance;
  String currency;
  String notes;
  double overdraft;
  double loan;
  double loanLimit;

  bool hasOverdraft() {
    return this.overdraft > 0.0;
  }
  bool hasLoan() {
    return this.loan > 0.0;
  }
}
