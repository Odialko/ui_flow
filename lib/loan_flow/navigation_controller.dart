import 'package:flutter/material.dart';
import 'package:uiflow/loan_flow/flow_manager.dart';

class NavigationController extends StatefulWidget {
  final int index;

  const NavigationController({Key key, this.index}) : super(key: key);

  @override
  _NavigationControllerState createState() => _NavigationControllerState();
}

class _NavigationControllerState extends State<NavigationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlowScreens(
        index: widget.index,
      ),
    );
  }
}
