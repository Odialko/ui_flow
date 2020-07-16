// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flow_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FlowStore on _FlowStore, Store {
  Computed<int> _$stepCountComputed;

  @override
  int get stepCount => (_$stepCountComputed ??=
          Computed<int>(() => super.stepCount, name: '_FlowStore.stepCount'))
      .value;
  Computed<bool> _$isCompleteComputed;

  @override
  bool get isComplete => (_$isCompleteComputed ??=
          Computed<bool>(() => super.isComplete, name: '_FlowStore.isComplete'))
      .value;

  final _$lastCompletedAtom = Atom(name: '_FlowStore.lastCompleted');

  @override
  FlowStep<dynamic> get lastCompleted {
    _$lastCompletedAtom.reportRead();
    return super.lastCompleted;
  }

  @override
  set lastCompleted(FlowStep<dynamic> value) {
    _$lastCompletedAtom.reportWrite(value, super.lastCompleted, () {
      super.lastCompleted = value;
    });
  }

  final _$_hasCompletionStepAtom = Atom(name: '_FlowStore._hasCompletionStep');

  @override
  bool get _hasCompletionStep {
    _$_hasCompletionStepAtom.reportRead();
    return super._hasCompletionStep;
  }

  @override
  set _hasCompletionStep(bool value) {
    _$_hasCompletionStepAtom.reportWrite(value, super._hasCompletionStep, () {
      super._hasCompletionStep = value;
    });
  }

  final _$_FlowStoreActionController = ActionController(name: '_FlowStore');

  @override
  void completeStep({@required FlowStep<dynamic> step}) {
    final _$actionInfo = _$_FlowStoreActionController.startAction(
        name: '_FlowStore.completeStep');
    try {
      return super.completeStep(step: step);
    } finally {
      _$_FlowStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
lastCompleted: ${lastCompleted},
stepCount: ${stepCount},
isComplete: ${isComplete}
    ''';
  }
}
