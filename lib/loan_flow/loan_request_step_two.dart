import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:uiflow/loan_flow/borrow_store.dart';
import 'package:provider/provider.dart';

///the same description as at LoanRequestStart();

class LoanRequestStepTwo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    BorrowStore store = Provider.of<BorrowStore>(context);
    final int currentScreenIndex = store.currentScreenIndex;
    TextEditingController stepTwoInputController = TextEditingController();

    ///if in the Store we have data
    if (store.stepTwo != null && store.stepTwo != '') {
      stepTwoInputController.text = store.stepTwo;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Step two'),
        leading: IconButton(
          tooltip: 'Previous choice',
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            currentScreenIndex == 0
                ? Navigator.of(context).popUntil((route) => route.isFirst)
                : store.changeScreen(
                    currentScreen: currentScreenIndex,
                    nextScreen: false);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Observer(
              builder: (_) => TextField(
                controller: stepTwoInputController,
                onChanged: (value) => store.stepTwo = value,
                decoration: InputDecoration(
                    labelText: 'Amount',
                    hintText: 'Pick a Amount',
                    errorText: store.error.stepTwo),
              ),
            ),
            Text(
              store.amount,
              style: TextStyle(color: Colors.white, fontSize: 28.0),
            ),
            RaisedButton(
              child: const Text('Go to ...'),
              onPressed: () {
                store.changeScreen(
                    currentScreen: currentScreenIndex);
              },
            ),
          ],
        ),
      ),
    );
  }
}
