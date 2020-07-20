import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:uiflow/loan_flow/borrow_store.dart';
import 'package:provider/provider.dart';

class LoanRequestStart extends StatefulWidget {
  _LoanRequestStartState createState() => _LoanRequestStartState();
}

class _LoanRequestStartState extends State<LoanRequestStart> {
  static const String screenId = '0';
  TextEditingController myAmount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    BorrowStore store = Provider.of<BorrowStore>(context);
    final currentScreenIndex = store.currentScreenIndex;

    if (store.amount != null && store.amount != '') {
      setState(() {
        myAmount.text = store.amount;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Step Start'),
        leading: IconButton(
          tooltip: 'Previous choice',
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            currentScreenIndex == '0'
                ? Navigator.of(context).popUntil((route) => route.isFirst)
                : store.completeScreen(
                    currentScreen: currentScreenIndex,
                    nextScreen: previousScreen(currentScreenIndex),
                    screenId: screenId);
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
                  store.completeScreen(
                      currentScreen: currentScreenIndex,
                      nextScreen: nextScreen(currentScreenIndex),
                      screenId: screenId);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String nextScreen(String currentScreenIndex) {
    return (int.parse(currentScreenIndex) + 1).toString();
  }

  String previousScreen(String currentScreenIndex) {
    return (int.parse(currentScreenIndex) - 1).toString();
  }
}
