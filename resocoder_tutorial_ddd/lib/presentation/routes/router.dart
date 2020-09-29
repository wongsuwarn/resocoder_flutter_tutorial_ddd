import 'package:auto_route/auto_route_annotations.dart';
import 'package:resocoder_tutorial_ddd/presentation/sign_in/sign_in_page.dart';
import 'package:resocoder_tutorial_ddd/presentation/splash/splash_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: SignInPage),
    MaterialRoute(page: SplashPage, initial: true),
  ],
  generateNavigationHelperExtension: true,
)
class $Router {}
