import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:resocoder_tutorial_ddd/domain/core/errors.dart';
import 'package:resocoder_tutorial_ddd/domain/core/failures.dart';
import 'package:uuid/uuid.dart';

/// This is the VVO superclass with all the common boilerplate
/// relying heavily on generics
@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  ///
  /// Helper method
  T getOrCrash() {
    return value.fold(
      (l) => throw UnexpectedValueError(l),
      id,
    );
  }

  // more expressive code
  bool isValid() => value.isRight();

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}

// Both users and notes will have unique ids
// In the case of users, uids can be obtained from Firebase
class UniqueId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  factory UniqueId() {
    // unlike EmailAddress and Password, UniqueId value object is
    // not going to be validated
    return UniqueId._(
      right(Uuid().v1()), // use uuid package
    );
  }

  // This factory constructor is for when we already have
  // a uid that we trust to be unique
  factory UniqueId.fromUniqueString(String uniqueId) {
    assert(uniqueId != null);
    return UniqueId._(
      right(uniqueId),
    );
  }
  const UniqueId._(this.value);
}
