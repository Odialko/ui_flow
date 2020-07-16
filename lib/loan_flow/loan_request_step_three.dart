// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:provider/provider.dart';
// import 'package:uiflow/loan_flow/borrow_store.dart';

// class LoanRequestStepThree extends StatelessWidget {
//   BorrowStore store;
//   @override
//   Widget build(BuildContext context) {
//     store = Provider.of<BorrowStore>(context);
//     store.setupValidations();

//     return Scaffold(
//       appBar: AppBar(title: const Text('Flow')),
//       body: Observer(
//         builder: (_) => Column(
//           children: [
//             Center(
//               child: Text(
//                 'This is LoanRequestStepThree an stepOne is: ${store.amount}',
//                 style: TextStyle(
//                   fontSize: 32.0,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//             Center(
//               child: Text(
//                 'This is LoanRequestStepThree an stepTwo is: ${store.stepTwo}',
//                 style: TextStyle(
//                   fontSize: 32.0,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.of(context).popUntil((route) => route.isFirst);
//         },
//         child: Icon(Icons.label_important),
//       ),
//     );
//   }
// }
