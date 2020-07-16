import 'package:flutter/material.dart';
import 'package:uiflow/framework/flow_step.dart';
import 'package:uiflow/loan_flow/bank_account_repository.dart';
import 'package:uiflow/loan_flow/borrow_store.dart';
import 'package:uiflow/loan_flow/loan_request_start.dart';
import 'package:provider/provider.dart';
import 'package:uiflow/loan_flow/loan_request_step_three.dart';
import 'package:uiflow/loan_flow/loan_request_step_two.dart';
import 'package:auto_route/auto_route.dart';
import '../router.gr.dart';

import '../framework/flow_manager.dart';

const step1Id = '1';
const step2Id = '2';

class LoanFlowManager extends FlowManager {
  LoanFlowManager({this.navigator});

  final ExtendedNavigatorState navigator;

  @override
  void onStepCompleted(FlowStep step) {
    print('Step completed: ${step.id}');
    this.navigator.pushNamed(_getNextRoute(step));
  }

  String _getNextRoute(FlowStep step) {
    switch (step.id) {
      case step1Id:
        return Routes.loanRequestStepTwo;
    }
  }

  @override
  void onFlowCompletion(bool complete) {
    // TODO: implement onFlowCompletion
  }

  FlowStep<String> createStep1(String data) =>
      FlowStep<String>(id: step1Id, data: data);

  String get step1Data => this.store.steps.first.data;

  // FlowStep<String> get step2 => FlowStep<String>(id: '2');
}

//-------

class LoanFlow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoanFlowManager>(
          create: (_) =>
              LoanFlowManager(navigator: ExtendedNavigator.of(context))
                ..start(),
        ),
        // Provider<BorrowStore>(
        //   create: (_) => BorrowStore(
        //     bankAccountRepository: BankAccountRepository(),
        //   ),
        // ),
      ],
      child: Scaffold(body: LoanRequestStart()),
    );
  }
}

// enum EnumFlowScreens { start, second, third }

// class FlowScreens extends StatefulWidget {
//   @override
//   _FlowScreensState createState() => _FlowScreensState();
// }

// class _FlowScreensState extends State<FlowScreens> {
//   Widget currentPage;

//   // @override
//   // void initState() {
//   //   super.initState();

//   // callback(EnumFlowScreens.start);
//   // }

//   // void callback(nextPage) {
//   //   setState(() {
//   //     if (nextPage == EnumFlowScreens.second) {
//   //       currentPage = LoanRequestStepTwo(
//   //         callback: this.callback,
//   //       );
// // //        widget.navigator.toLoanRequestStepTwo(context, this.callback);
//   //     } else if (nextPage == EnumFlowScreens.third) {
//   //       currentPage = LoanRequestStepThree();
// // //            widget.navigator.toLoanRequestStepThree(context);
//   //     } else {
//   //       this.currentPage = LoanRequestStart(callback: this.callback);
//   //     }
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
// //    return currentPage;
//     return Provider<BorrowStore>(
//       create: (_) => BorrowStore(
//         bankAccountRepository: BankAccountRepository(),
//       ),
//       child: Scaffold(body: currentPage),
//     );
//   }
// }
