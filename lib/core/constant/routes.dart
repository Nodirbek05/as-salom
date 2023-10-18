import 'package:assalomproject/views/auth/pages/choose_language_page.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LanguagePage.routeName:
        return MaterialPageRoute(builder: (_) => const LanguagePage());

      default:
        return MaterialPageRoute(builder: (_) => const LanguagePage());
    }
  }
}
