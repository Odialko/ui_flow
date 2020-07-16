import 'package:auto_route/auto_route_annotations.dart';
import 'package:uiflow/borrow_screen.dart';
import 'package:uiflow/loan_flow/loan_flow.dart';
import 'package:uiflow/loan_flow/loan_request_step_two.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AdaptiveRoute(page: BorrowScreen, initial: true),
    AdaptiveRoute(path: '/loan1', page: LoanFlow),
    AdaptiveRoute(path: '/loan2', page: LoanRequestStepTwo)
  ],
)
class $Router {}
