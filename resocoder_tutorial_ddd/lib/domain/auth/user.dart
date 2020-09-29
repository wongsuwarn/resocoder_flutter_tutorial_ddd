import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resocoder_tutorial_ddd/domain/core/value_objects.dart';

part 'user.freezed.dart';

// this User class is an entity containing many
// value objects

// unique id
//

@freezed
abstract class CurrentUser with _$CurrentUser {
  const factory CurrentUser(
    UniqueId id,
  ) = _CurrentUser;
}
