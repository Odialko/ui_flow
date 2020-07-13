import 'package:flutter/material.dart';
import 'package:uiflow/loan_flow/flow_manager.dart';

class LoanRequestStepTwo extends StatelessWidget {
  final Function callback;
  final String amount;
  final BorrowScreenNavigator navigator;

  const LoanRequestStepTwo(
      {Key key, this.callback, this.navigator, this.amount = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Start')),
      body: Column(
        children: [
          Text(amount.toString()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                  callback(EnumFlowScreens.third, amount: amount);
              },
              child: Text('to page Three'),
            ),
          ),
        ],
      ),
//      body: Text(amount.toString()),
    );
  }
}
