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

//  @override
//  void initState() {
//    super.initState();
//
//  }

//  @override
//  void dispose() {
//    store.dispose();
//    super.dispose();
//  }

  @override
  Widget build(BuildContext context) {
    store = Provider.of<BorrowStore>(context);
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
                    store.validateStepStartAndGoToSecond(context, widget.callback);
                  },
                ),
//                Observer(
//                  builder: (context) => Column(
//                    children: [
//                      if (future.status == FutureStatus.fulfilled)
//                        Text(
//                          future.result.loanLimit.toString(),
//                          style: TextStyle(
//                            fontSize: 22.0
//                          ),
//                        )
//                    ],
//                  ),
//                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
