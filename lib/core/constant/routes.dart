import 'package:assalomproject/views/initail/pages/choose_language_page.dart';
import 'package:assalomproject/views/auth/pages/registration_page.dart';
import 'package:assalomproject/views/main_page/pages/main_page.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LanguagePage.routeName:
        return MaterialPageRoute(builder: (_) => const LanguagePage());
      case RegistrationPage.routeName:
        return MaterialPageRoute(builder: (_) => const RegistrationPage());
      case MainPage.routeName:
        return MaterialPageRoute(builder: (_) =>  MainPage());

      default:
        return MaterialPageRoute(builder: (_) => const LanguagePage());
    }
  }
}
