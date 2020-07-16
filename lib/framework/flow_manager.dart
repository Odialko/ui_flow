import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';
import 'flow_store.dart';
import 'flow_step.dart';

abstract class FlowManager {
  FlowManager();
  final FlowStore store = FlowStore();
  ReactionDisposer _disposeOnStepCompleted;
  ReactionDisposer _disposeOnFlowCompletion;

  void start() {
    end(); //stop listening if starting whilst already listening
    _disposeOnStepCompleted =
        reaction((_) => store.lastCompleted, onStepCompleted);
    _disposeOnFlowCompletion =
        reaction((_) => store.isComplete, onFlowCompletion);
  }

  void end() {
    if (_disposeOnStepCompleted != null) _disposeOnStepCompleted();
    if (_disposeOnFlowCompletion != null) _disposeOnFlowCompletion();
  }

  void onStepCompleted(FlowStep step);

  void onFlowCompletion(bool complete);

  void completeStep({FlowStep step}) {
    assert(step != null, "'step' cannot be null for FlowManager.completeStep");
    this.store.completeStep(step: step);
  }

  void goPrevious() {
    print("go previous");
  }
}
