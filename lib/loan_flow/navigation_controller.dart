//import 'package:flutter/material.dart';
//import 'package:uiflow/loan_flow/loan_request_start.dart';
//import 'package:uiflow/loan_flow/loan_request_step_three.dart';
//import 'package:uiflow/loan_flow/loan_request_step_two.dart';
//
////class NavigationController extends StatefulWidget {
////  final List<NavigationItem> items;
////  final hubScreens;
////  final int currentIndex;
////
////  const NavigationController({
////    Key key,
////    this.items,
////    this.hubScreens,
////    this.currentIndex = 0,
////  }) : super(key: key);
////
////  @override
////  _NavigationControllerState createState() => _NavigationControllerState();
////}
//
//class NavigationController extends StatelessWidget {
//
//  final hubScreens;
//  final int selectedIndex;
//
//  NavigationController({
//    Key key,
//    this.hubScreens,
//    this.selectedIndex = 0,
//  }) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return hubScreens[selectedIndex];
////    if (selectedIndex == 0) {
////      return items[];
////    } else if (selectedIndex == 1) {
////      return LoanRequestStepTwo();
////    } else {
////      return LoanRequestStepThree();
////    }
//  }
//}
////
////class NavigationItem {
////  final Function navigateTo;
////
////  NavigationItem(this.navigateTo);
////}
