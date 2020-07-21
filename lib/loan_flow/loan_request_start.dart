import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:uiflow/loan_flow/borrow_store.dart';
import 'package:provider/provider.dart';

///Screen with input field.
///is present validation on empty field
///and loanLimit from a BankAccountRepository().
///if press arrow back button in AppBar
///and if it screen number one we are going back to BorrowScreen()
///if it another one screen not number one we are going to the previous one screen
///with saving current value of input field

class LoanRequestStart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ///Get data from Provider
    BorrowStore store = Provider.of<BorrowStore>(context);
    final int currentScreenIndex = store.currentScreenIndex;
    ///controller for input field
    TextEditingController myAmount = TextEditingController();

    ///if in the Store we have data
    if (store.amount != null && store.amount != '') {
      myAmount.text = store.amount;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Step Start'),
        leading: IconButton(
          tooltip: 'Previous choice',
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            ///check if it screen number one in our Flow of screens
            currentScreenIndex == 0
                ? Navigator.of(context).popUntil((route) => route.isFirst)
            ///back to one step
                : store.changeScreen(
                    currentScreen: currentScreenIndex, nextScreen: false);
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
                  ///validate data and pass enum ScreenType.start for showing
                  ///which validation run for this screen
                  store.validateScreen(ScreenType.start);
                  ///go ahead to one step
                  store.changeScreen(
                      currentScreen: currentScreenIndex);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
