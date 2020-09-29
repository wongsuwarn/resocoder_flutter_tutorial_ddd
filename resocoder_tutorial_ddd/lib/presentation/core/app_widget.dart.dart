import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resocoder_tutorial_ddd/application/auth/auth_bloc.dart';
import 'package:resocoder_tutorial_ddd/injection.dart';
import 'package:resocoder_tutorial_ddd/presentation/routes/router.gr.dart'
    as autoroutes;

class AppWidget extends StatelessWidget {
  const AppWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AuthBloc>()
            ..add(
              // cascade operator
              const AuthEvent.authCheckRequested(),
            ),
        )
      ],
      child: MaterialApp(
        title: 'Notes',
        builder: ExtendedNavigator.builder<autoroutes.Router>(
            router: autoroutes.Router()),
        theme: ThemeData.light().copyWith(
          primaryColor: Colors.green[800],
          accentColor: Colors.blueAccent,
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
