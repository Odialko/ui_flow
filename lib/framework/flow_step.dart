import 'package:meta/meta.dart';

/// Describes the step in a flow.
///
/// The UI populates the step with data when
/// data is entered (e.g. form data entry or a user
/// selecting something in the UI).
///
/// The UI sends the step to the Store with the populated data.
///
/// The step can define whether it can be remembered if the
/// user navigates back, or if it will be destroyed.
class FlowStep<T> {
  FlowStep({@required this.id, this.data, this.keepOnBack = true})
      : assert(id != null, "'id' cannot be null for FlowStep");
  final String id;
  final T data;
  final bool keepOnBack;

  @override
  bool operator ==(dynamic other) {
    if (other is! FlowStep<T>) return false;
    FlowStep<T> step = other;
    return this.id == step.id;
  }

  @override
  int get hashCode {
    return this.id.hashCode;
  }

  bool get isCompletion => false;
}

/// The same as a normal step, but with the completion flag set to 'true'
class CompletionStep<T> extends FlowStep<T> {
  CompletionStep({@required String id, T data}) : super(id: id, data: data);
  bool get isCompletion => true;
}
