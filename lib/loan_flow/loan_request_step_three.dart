import 'package:flutter/material.dart';

class LoanRequestStepThree extends StatefulWidget {
  final Function callback;
//
  const LoanRequestStepThree({Key key, this.callback}) : super(key: key);
  @override
  _LoanRequestStepThreeState createState() => _LoanRequestStepThreeState();
}

class _LoanRequestStepThreeState extends State<LoanRequestStepThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flow')),
      body: Center(
        child: Text(
          'This is LoanRequestStepThree',
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.w600,
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
}
