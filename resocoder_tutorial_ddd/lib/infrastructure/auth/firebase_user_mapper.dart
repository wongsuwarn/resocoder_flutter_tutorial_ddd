import 'package:firebase_auth/firebase_auth.dart';
import 'package:resocoder_tutorial_ddd/domain/auth/user.dart';
import 'package:resocoder_tutorial_ddd/domain/core/value_objects.dart';

extension FirebaseUserDomainX on User {
  CurrentUser toDomain() {
    return CurrentUser(UniqueId.fromUniqueString(uid));
  }
}
