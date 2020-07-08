import 'package:flutter/material.dart';
import 'package:uiflow/loan_flow/loan_request_start.dart';
import 'package:uiflow/loan_flow/loan_request_step_three.dart';
import 'package:uiflow/loan_flow/loan_request_step_two.dart';


class FlowSelected extends StatefulWidget {
  @override
  _FlowSelectedState createState() => _FlowSelectedState();
}

class _FlowSelectedState extends State<FlowSelected> {
  final loanScreens = <int, Widget>{
    0: LoanRequestStart(),
    1: LoanRequestStepTwo(),
    2: LoanRequestStepThree(),
  };

//  final List myList = ['viktor', 'vova', 'bob', 'max'];
  int index = 0;

//  int screen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('myFlow'),
      ),
      body: NavigationController(
        loanScreens: loanScreens,
        onSelected: (screen) {
          print('=========> $screen');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
      ),
    );
//    return NavigationController(loanScreens: loanScreens,);
  }
}

class NavigationController extends StatelessWidget {
  final Map<int, Widget> loanScreens;
  final Function onSelected;

  NavigationController({this.loanScreens, this.onSelected});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.loanScreens.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            final screen = this.loanScreens[index];
            this.onSelected(screen);
          },
          title: Text('test'),
        );
      },
    );

  }

}
