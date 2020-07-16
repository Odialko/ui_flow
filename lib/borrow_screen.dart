import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'router.gr.dart';

class BorrowScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flow')),
      body: Center(
        child: Text(
          'Hi there, this is BorrowScreen',
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ExtendedNavigator.of(context).pushNamed(Routes.loanFlow);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => LoanFlow()),
          // );
        },
        child: Icon(Icons.label_important),
      ),
    );
  }
}
//class AndroidNav extends BorrowScreenNavigator {
//  @override
//  void toLoanRequestStepTwo(BuildContext context, callback) {
//    Navigator.push(
//      context,
//      MaterialPageRoute(builder: (context) => LoanRequestStepTwo(callback: callback)),
//    );
//  }
//
//  @override
//  void toLoanRequestStepThree(BuildContext context) {
//    Navigator.push(
//      context,
//      MaterialPageRoute(builder: (context) => LoanRequestStepThree()),
//    );
//  }
//}
//
//abstract class BorrowScreenNavigator {
//  void toLoanRequestStepTwo(BuildContext context, callback);
//  void toLoanRequestStepThree(BuildContext context);
//}
