part of 'auth_bloc.dart';

@freezed
abstract class AuthState with _$AuthState {
  // initial state represents when we do not yet know if we have
  // signed in user
  const factory AuthState.initial() = Initial;
  const factory AuthState.authenticated() = Authenticated;
  const factory AuthState.unauthenticated() = Unauthenticated;
}
