import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:uiflow/loan_flow/borrow_store.dart';
import 'package:provider/provider.dart';

class LoanRequestStart extends StatefulWidget {
  _LoanRequestStartState createState() => _LoanRequestStartState();
}

class _LoanRequestStartState extends State<LoanRequestStart> {
//  final _formKey = GlobalKey<FormState>();
  TextEditingController myAmount = TextEditingController();
  BorrowStore store;

  @override
  Widget build(BuildContext context) {
    store = Provider.of<BorrowStore>(context);
    store.getBankAccountLoan();
    store.setupValidations();

    if (store.amount != null && store.amount != '') {
      setState(() {
        myAmount.text = store.amount;
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Start'),
        leading: IconButton(
          tooltip: 'Previous choice',
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Observer(
                builder: (_) => TextField(
                  controller: myAmount,
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
      ),
    );
  }
}
