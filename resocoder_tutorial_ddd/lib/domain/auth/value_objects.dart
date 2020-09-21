// perform validation within type instead of in presentation layer
import 'package:dartz/dartz.dart';
import 'package:resocoder_tutorial_ddd/domain/core/failures.dart';
import 'package:resocoder_tutorial_ddd/domain/core/value_objects.dart';
import 'package:resocoder_tutorial_ddd/domain/core/value_validators.dart';

/// validation occurs inside value objects instead of in presentation
/// layer

class EmailAddress extends ValueObject {
  /// the value held in the VVO is an Either union
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    assert(input != null);
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }

  const EmailAddress._(
    this.value,
  );
}

class Password extends ValueObject<String> {
  factory Password(String input) {
    assert(input != null);
    return Password._(
      validatePassword(input),
    );
  }

  const Password._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;
}
