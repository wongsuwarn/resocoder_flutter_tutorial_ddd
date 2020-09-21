import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:resocoder_tutorial_ddd/domain/auth/auth_failure.dart';
import 'value_objects.dart';

/// This interface means that implementation detail in the
/// infrastructure layer (e.g. FirebaseAuth) are not depended upon
/// by the application layer. Instead the application layer will
/// depend on this abstract class in the domain layer.
///
abstract class IAuthFacade {
  /// the use of the Unit type from dartz is to avoid nulls
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
}
