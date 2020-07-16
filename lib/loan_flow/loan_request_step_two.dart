import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:uiflow/loan_flow/borrow_store.dart';
import 'package:provider/provider.dart';
import 'loan_flow.dart';

class LoanRequestStepTwo extends StatefulWidget {
  final Function callback;

  const LoanRequestStepTwo({Key key, this.callback}) : super(key: key);

  _LoanRequestStepTwoState createState() => _LoanRequestStepTwoState();
}

class _LoanRequestStepTwoState extends State<LoanRequestStepTwo> {
  TextEditingController teController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final flowManager = Provider.of<LoanFlowManager>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Start')),
      body: Column(
        children: [
          Observer(
            builder: (_) => TextField(
              controller: teController,
              decoration: InputDecoration(
                labelText: 'Amount',
                hintText: 'Pick a Amount',
              ),
            ),
          ),
          Text(
            // 'store.amount',
            flowManager.step1Data,
            style: TextStyle(color: Colors.white, fontSize: 28.0),
          ),
          RaisedButton(
            child: const Text('Go to ...'),
            onPressed: () {},
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
