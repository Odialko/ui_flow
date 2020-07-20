import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:uiflow/loan_flow/borrow_store.dart';
import 'package:provider/provider.dart';

class LoanRequestStart extends StatefulWidget {
  final Function callback;

  const LoanRequestStart({Key key, this.callback})
      : super(key: key);

  _LoanRequestStartState createState() => _LoanRequestStartState();
}

class _LoanRequestStartState extends State<LoanRequestStart> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController myAmount = TextEditingController();

  BorrowStore store;

  @override
  Widget build(BuildContext context) {
    const String nexScreen = '1';

    store = Provider.of<BorrowStore>(context);
    store.getBankAccountLoan();
    store.setupValidations();

    return Scaffold(
      appBar: AppBar(title: const Text('Start')),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Observer(
                  builder: (_) => TextField(
                    onChanged: (value) => store.amount = value,
                    decoration: InputDecoration(
                        labelText: 'Amount',
                        hintText: 'Pick a Amount',
                        errorText: store.error.amount),
                  ),
                ),
                RaisedButton(
                  child: const Text('Go ahead'),
                  onPressed: () {
                    store.completeScreen(currentScreen: '0', nextScreen: '1');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
