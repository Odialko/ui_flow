import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:uiflow/loan_flow/borrow_store.dart';
import 'package:uiflow/loan_flow/flow_manager.dart';
import 'package:provider/provider.dart';

class LoanRequestStepTwo extends StatelessWidget {
  final Function callback;
  final String amount;

  const LoanRequestStepTwo({Key key, this.callback, this.amount = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<BorrowStore>(context);
    final future = store.getBankAccountLoan();

    return Observer(
      builder: (context) => Scaffold(
        appBar: AppBar(title: const Text('Second')),
        body: Column(
          children: [
            if (future.status == FutureStatus.fulfilled)
//              Center(
//                child: Text(
//                  future.result.overdraft.toString(),
//                  style: TextStyle(
//                    fontSize: 32.0,
//                    fontWeight: FontWeight.w600,
//                  ),
//                ),
//              ),
            Text(amount.toString()),
            if (future.status == FutureStatus.pending)
              Container(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            callback(EnumFlowScreens.third);
          },
          child: Icon(Icons.label_important),
        ),
      ),
    );
  }
}
