part of 'sign_in_form_bloc.dart';

@freezed
abstract class SignInFormEvent with _$SignInFormEvent {
  const factory SignInFormEvent.emailChanged(String emailStr) = EmailChanged;
  const factory SignInFormEvent.passwordChanged(String emailStr) =
      PasswordChanged;
  const factory SignInFormEvent.registerWithEmailAndPassWordPressed() =
      RegisterWithEmailAndPassWordPressed;
  const factory SignInFormEvent.signInWithEmailAndPasswordPressed(
      String emailStr) = SignInWithEmailAndPasswordPressed;
  const factory SignInFormEvent.signInWithGooglePressed(String emailStr) =
      SignInWithGooglePressed;
}
