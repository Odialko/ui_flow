import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:uiflow/loan_flow/borrow_store.dart';
import 'package:uiflow/loan_flow/flow_manager.dart';
import 'package:provider/provider.dart';

class LoanRequestStart extends StatefulWidget {
  final Function callback;
  final BorrowScreenNavigator navigator;

  const LoanRequestStart({Key key, this.callback, this.navigator})
      : super(key: key);

  _LoanRequestStartState createState() => _LoanRequestStartState();
}

class _LoanRequestStartState extends State<LoanRequestStart> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController myAmount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<BorrowStore>(context);
    final future = store.getBankAccountLoan();

    return Observer(
      builder: (context) => Scaffold(
        appBar: AppBar(title: const Text('Start')),
        body: Column(
          children: [
            if (future.status == FutureStatus.fulfilled)
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      controller: myAmount,
                      inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                        hintText: 'Amount',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some Amount';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: RaisedButton(
                        onPressed: () {
                          // Validate will return true if the form is valid, or false if
                          // the form is invalid.
                          if (_formKey.currentState.validate()) {
                            widget.callback(EnumFlowScreens.second, amount: myAmount.text);
                            // Process data.
                          }
                        },
                        child: Text('Submit'),
                      ),
                    ),
                  ],
                ),
              ),
            if (future.status == FutureStatus.pending) Container(),
          ],
        ),
//        floatingActionButton: FloatingActionButton(
//          onPressed: () {
//            callback(EnumFlowScreens.second);
//          },
//          child: Icon(Icons.label_important),
//        ),
      ),
    );
  }
}
