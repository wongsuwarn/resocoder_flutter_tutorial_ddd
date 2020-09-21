part of 'sign_in_form_bloc.dart';

@freezed
abstract class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    @required EmailAddress emailAddress,
    @required Password password,

    /// don't want to show error messages initially
    @required bool showErrorMessages,
    @required bool isSubmitting,

    /// authFailureOrSuccess is the auth backend response
    /// An Option is a union of two values - Some and None; None
    /// can be used instead of null, for example in the UI form
    /// initial state
    @required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _SignInFormState;

  factory SignInFormState.initial() => SignInFormState(
        emailAddress: EmailAddress(''),
        password: Password(''),
        showErrorMessages: false,
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
      );
}
