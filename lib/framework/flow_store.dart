import 'dart:collection';

import 'package:mobx/mobx.dart';
import 'package:meta/meta.dart';
import 'package:logging/logging.dart';
import 'flow_step.dart';

part 'flow_store.g.dart';

class FlowStore = _FlowStore with _$FlowStore;

abstract class _FlowStore with Store {
  ObservableSet<FlowStep> steps =
      ObservableSet.of(LinkedHashSet<FlowStep>.identity());

  @observable
  FlowStep lastCompleted;

  @observable
  bool _hasCompletionStep = false;
  //FlowCompleter

  @action
  void completeStep({@required FlowStep step}) {
    assert(step != null, "'step' cannot be null for FlowStore.completeStep");
    if (_hasCompletionStep) {
      Logger('FlowStore').warning(
          "Cannot call complete step ${step.id} when isComplete is true");
      return;
    }

    steps.add(step);
    lastCompleted = step;
    Logger('FlowStore').fine("Steps.length: ${steps.length}");
    _hasCompletionStep = step.isCompletion;
  }

  @computed
  int get stepCount => steps.length;

  @computed
  bool get isComplete => _hasCompletionStep;
}
