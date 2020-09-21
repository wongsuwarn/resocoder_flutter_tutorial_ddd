import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resocoder_tutorial_ddd/domain/auth/auth_failure.dart';
import 'package:resocoder_tutorial_ddd/domain/auth/i_auth_facade.dart';
import 'package:resocoder_tutorial_ddd/domain/auth/value_objects.dart';

/// part statements are for freezed
part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

part 'sign_in_form_bloc.freezed.dart';

// sole purpose of bloc is to change state(s) based on events(s)
/// It glues the presentation layer together with the other layers
/// in the app
// no validation - validation happens inside value object
@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  /// field for IAuthFacade dependency
  final IAuthFacade _authFacade;

  SignInFormBloc(this._authFacade) : super(SignInFormState.initial());

  @override

  /// mapEventToState ensures that all events are accounted for
  /// It is called an event handler
  Stream<SignInFormState> mapEventToState(
    /// events arrive to bloc with raw data e.g. Strings and the
    /// bloc will output validated valid objects like an EmailAddress
    SignInFormEvent event,
  ) async* {
    /// this map call will throw a compiler error if not all
    /// events are accounted for
    yield* event.map(
      emailChanged: (e) async* {
        /// simple state change: raw data to VVO
        yield state.copyWith(
          emailAddress: EmailAddress(e.emailStr),
          authFailureOrSuccessOption: none(), // reset
        );
      },
      passwordChanged: (e) async* {
        /// simple state change: raw data to VVO
        yield state.copyWith(
          password: Password(e.passwordStr),
          authFailureOrSuccessOption: none(), // reset
        );
      },
      registerWithEmailAndPassWordPressed: (e) async* {
        yield* _performActionOnAuthFacadeWithEmailAndPassword(
            _authFacade.registerWithEmailAndPassword);
      },
      signInWithEmailAndPasswordPressed: (e) async* {
        yield* _performActionOnAuthFacadeWithEmailAndPassword(
            _authFacade.signInWithEmailAndPassword);
      },
      signInWithGooglePressed: (e) async* {
        yield state.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        );
        // call method on the IAuthFacade
        final failureOrSuccess = await _authFacade.signInWithGoogle();
        yield state.copyWith(
          isSubmitting: false,
          authFailureOrSuccessOption: some(failureOrSuccess),
        );
      },
    );
  }

  /// this is a higher order function: a function which takes
  /// in another function as an argument
  Stream<SignInFormState> _performActionOnAuthFacadeWithEmailAndPassword(
    Future<Either<AuthFailure, Unit>> Function({
      @required EmailAddress emailAddress,
      @required Password password,
    })
        forwardedCall,
  ) async* {
    Either<AuthFailure, Unit> failureOrSuccess;

    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();

    if (isEmailValid && isPasswordValid) {
      yield state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      );
      // use the function in the argument
      failureOrSuccess = await forwardedCall(
        emailAddress: state.emailAddress,
        password: state.password,
      );
    }

    yield state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      // optionOf is equivalent to:
      // failureOrSuccess == null ? none() : some(failureOrSuccess)
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
    );
  }
}
