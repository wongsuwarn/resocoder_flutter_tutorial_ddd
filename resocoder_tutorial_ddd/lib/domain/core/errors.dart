import 'package:resocoder_tutorial_ddd/domain/core/failures.dart';

/// Errors are used to intentionally crash the app
/// They differ from Failures and Exceptions
class UnexpectedValueError extends Error {
  /// ValueFailure is the freezed union
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    const String explanation =
        'Encountered a ValueFailure at an unrecoverable point. Terminating.';
    return Error.safeToString('$explanation Failure was: $valueFailure');
  }
}
