import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:uiflow/loan_flow/borrow_store.dart';
import 'package:provider/provider.dart';

class LoanRequestStepTwo extends StatefulWidget {
  final Function callback;

  const LoanRequestStepTwo({Key key, this.callback})
      : super(key: key);

  _LoanRequestStepTwoState createState() => _LoanRequestStepTwoState();
}


class _LoanRequestStepTwoState extends State<LoanRequestStepTwo> {
  BorrowStore store;

  @override
  Widget build(BuildContext context) {
    store = Provider.of<BorrowStore>(context);
    store.setupValidations();

    return Scaffold(
      appBar: AppBar(title: const Text('Start')),
      body: Column(
        children: [
          Observer(
            builder: (_) => TextField(
              onChanged: (value) => store.stepTwo = value,
              decoration: InputDecoration(
                  labelText: 'Amount',
                  hintText: 'Pick a Amount',
                  errorText: store.error.stepTwo),
            ),
          ),
          Text(
            store.amount,
            style: TextStyle(
              color: Colors.white,
              fontSize: 28.0
            ),
          ),
          RaisedButton(
            child: const Text('Go to ...'),
            onPressed: () {
              store.validateStepTwoAndGoToThree(context, widget.callback);
            },
          ),
//          Padding(
//            padding: const EdgeInsets.symmetric(vertical: 16.0),
//            child: RaisedButton(
//              onPressed: () {
//                store.validateStepTwo('value from the second Step');
//                store.validateStepTwoAndGoToThree(context, widget.callback);
//              },
//              child: Text('to page Three'),
//            ),
//          ),
        ],
      ),
    );
  }
}
