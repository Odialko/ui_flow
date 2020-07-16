import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:uiflow/loan_flow/borrow_store.dart';
import 'package:provider/provider.dart';
import 'loan_flow.dart';

class LoanRequestStart extends StatefulWidget {
  _LoanRequestStartState createState() => _LoanRequestStartState();
}

class _LoanRequestStartState extends State<LoanRequestStart> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController teController = TextEditingController();

  // BorrowStore store;
  @override
  Widget build(BuildContext context) {
    // store = Provider.of<BorrowStore>(context);
    // store.getBankAccountLoan();
    // store.setupValidations();

    final flowManager = Provider.of<LoanFlowManager>(context);

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
                    controller: teController,
                    // onChanged: (value) => store.amount = value,
                    decoration: InputDecoration(
                      labelText: 'Amount',
                      hintText: 'Pick a Amount',
                      // errorText: store.error.amount,
                    ),
                  ),
                ),
                RaisedButton(
                  child: const Text('Next Step'),
                  onPressed: () {
                    final step = flowManager.createStep1(teController.text);
                    // FlowStep<String>(id: "1", data: teController.text);
                    flowManager.completeStep(step: step);
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
