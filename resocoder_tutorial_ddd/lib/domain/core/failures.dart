import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/* Grouping all failures from validated value objects into a 
single union. This union will help us not forget about any
possible case of a ValueFailure 

The class has generic type T because we will also want to validate
values other than Strings in this app
*/
@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidEmail({
    @required T failedValue,
  }) = InvalidEmail<T>;
  const factory ValueFailure.shortPassword({
    @required T failedValue,
  }) = ShortPassword<T>;
}
