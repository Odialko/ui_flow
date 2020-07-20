import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:uiflow/loan_flow/borrow_store.dart';

class LoanRequestStepThree extends StatelessWidget {
  static const String screenId = '2';

  @override
  Widget build(BuildContext context) {
    BorrowStore store = Provider.of<BorrowStore>(context);
    final currentScreenIndex = store.currentScreenIndex;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Step three'),
        leading: IconButton(
          tooltip: 'Previous choice',
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            currentScreenIndex == '0'
                ? Navigator.of(context).popUntil((route) => route.isFirst)
                : store.completeScreen(currentScreen: currentScreenIndex,
                nextScreen: previousScreen(currentScreenIndex),
                screenId: screenId
            );
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Observer(
          builder: (_) => Column(
            children: [
              Center(
                child: Text(
                  'This is LoanRequestStepThree an stepOne is: ${store.amount}',
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Divider(),
              Center(
                child: Text(
                  'This is LoanRequestStepThree an stepTwo is: ${store.stepTwo}',
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).popUntil((route) => route.isFirst);
        },
        child: Icon(Icons.label_important),
      ),
    );
  }

  String previousScreen(String currentScreenIndex) {
    return (int.parse(currentScreenIndex) - 1).toString();
  }
}
