import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resocoder_tutorial_ddd/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:resocoder_tutorial_ddd/injection.dart';
import 'package:resocoder_tutorial_ddd/presentation/sign_in/widgets/sign_in_form.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: BlocProvider(
        // get it will get the instance of sign in bloc
        // we do not instantiate it here (hence do not need
        // to pass an IAuthFacade object)
        create: (context) => getIt<SignInFormBloc>(),
        child: SignInForm(),
      ),
    );
  }
}
