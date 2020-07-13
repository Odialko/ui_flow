import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uiflow/borrow_screen.dart';
import 'package:uiflow/loan_flow/flow_manager.dart';

class LoanRequestStart extends StatefulWidget {
  final Function callback;
  final BorrowScreenNavigator navigator;

  const LoanRequestStart({Key key, this.navigator, this.callback})
      : super(key: key);

  _LoanRequestStartState createState() => _LoanRequestStartState();
}

class _LoanRequestStartState extends State<LoanRequestStart> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController myAmount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Start')),
      body: Column(
        children: [
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
                      if (_formKey.currentState.validate()) {
                        widget.callback(EnumFlowScreens.second,
                            amount: myAmount.text);
                        // Process data.
                      }
                    },
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
