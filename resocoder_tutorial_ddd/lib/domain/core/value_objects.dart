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

class UniqueId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  factory UniqueId() {
    return UniqueId._(
      right(Uuid().v1()),
    );
  }

  // for this factory constructor we have to trust that the string is unique
  factory UniqueId.fromUniqueString(String uniqueId) {
    assert(uniqueId != null);
    return UniqueId._(
      right(uniqueId),
    );
  }
  const UniqueId._(this.value);
}
