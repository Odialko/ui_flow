// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:uiflow/borrow_screen.dart';
import 'package:uiflow/loan_flow/loan_flow.dart';
import 'package:uiflow/loan_flow/loan_request_step_two.dart';

class Routes {
  static const String borrowScreen = '/';
  static const String loanFlow = '/loan1';
  static const String loanRequestStepTwo = '/loan2';
  static const all = <String>{
    borrowScreen,
    loanFlow,
    loanRequestStepTwo,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.borrowScreen, page: BorrowScreen),
    RouteDef(Routes.loanFlow, page: LoanFlow),
    RouteDef(Routes.loanRequestStepTwo, page: LoanRequestStepTwo),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    BorrowScreen: (RouteData data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => BorrowScreen(),
        settings: data,
      );
    },
    LoanFlow: (RouteData data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => LoanFlow(),
        settings: data,
      );
    },
    LoanRequestStepTwo: (RouteData data) {
      var args = data.getArgs<LoanRequestStepTwoArguments>(
          orElse: () => LoanRequestStepTwoArguments());
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            LoanRequestStepTwo(key: args.key, callback: args.callback),
        settings: data,
      );
    },
  };
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//LoanRequestStepTwo arguments holder class
class LoanRequestStepTwoArguments {
  final Key key;
  final Function callback;
  LoanRequestStepTwoArguments({this.key, this.callback});
}
