import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:uiflow/loan_flow/borrow_store.dart';
import 'package:provider/provider.dart';

class LoanRequestStepTwo extends StatefulWidget {
  _LoanRequestStepTwoState createState() => _LoanRequestStepTwoState();
}

class _LoanRequestStepTwoState extends State<LoanRequestStepTwo> {
  static const String screenId = '1';
  TextEditingController stepTwoInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    BorrowStore store = Provider.of<BorrowStore>(context);
    final currentScreenIndex = store.currentScreenIndex;

    if (store.stepTwo != null && store.stepTwo != '') {
      setState(() {
        stepTwoInputController.text = store.stepTwo;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Step two'),
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
                store.completeScreen(
                    currentScreen: currentScreenIndex,
                    nextScreen: nextScreen(currentScreenIndex),
                    screenId: screenId);
              },
            ),
          ],
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
