import 'package:flutter/material.dart';
import 'framework/flow_manager.dart';
import 'framework/flow_step.dart';
import 'package:logging/logging.dart';

class SimpleFlowManager extends FlowManager {
  @override
  void onStepCompleted(FlowStep step) {
    print("jm.dart :: Completed Step: ${step.data}");
  }

  @override
  void onFlowCompletion(bool complete) {
    print("jm.dart :: Flow completed");
  }
}

void main() {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.message}');
  });

  runApp(
    App(
      manager: SimpleFlowManager(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key key, @required this.manager}) : super(key: key);

  final FlowManager manager;

  @override
  Widget build(BuildContext context) {
    manager.start();
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              FlatButton(
                child: Text("Step 1"),
                onPressed: () {
                  final step1 = FlowStep<String>(id: "1", data: "Screen 1");
                  manager.completeStep(step: step1);
                },
              ),
              FlatButton(
                child: Text("Step 2"),
                onPressed: () {
                  final step2 = FlowStep<String>(id: "2", data: "Screen 2");
                  manager.completeStep(step: step2);
                },
              ),
              FlatButton(
                child: Text("Step 3"),
                onPressed: () {
                  final step3 = FlowStep<String>(id: "3", data: "Screen 3");
                  manager.completeStep(step: step3);
                },
              ),
              FlatButton(
                child: Text("Step 4"),
                onPressed: () {
                  final step4 =
                      CompletionStep<String>(id: "4", data: "Screen 4");
                  manager.completeStep(step: step4);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
