import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
abstract class AuthFail with _$AuthFail {
  const factory AuthFail.cancelledByUser() = CancelledByUser;
}
