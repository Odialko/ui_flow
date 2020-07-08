import 'package:flutter/material.dart';
import 'package:uiflow/borrow_screen.dart';
class LoanRequestStepThree extends StatefulWidget {
  final Function function;

  const LoanRequestStepThree({Key key, this.function}) : super(key: key);
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
          widget.function();
        },
        child: Icon(Icons.label_important),
      ),
    );
  }
}
