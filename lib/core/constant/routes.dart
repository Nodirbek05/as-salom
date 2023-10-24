import 'package:assalomproject/views/auth/data/logic/bloc/register_bloc.dart';
import 'package:assalomproject/views/initail/pages/choose_language_page.dart';
import 'package:assalomproject/views/auth/pages/registration_page.dart';
import 'package:assalomproject/views/main_page/pages/main_page.dart';
import 'package:assalomproject/views/product_detail/pages/product_detail.dart';
import 'package:assalomproject/widgets/nav_bar_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LanguagePage.routeName:
        return MaterialPageRoute(builder: (_) => const LanguagePage());

         case CustomNavigatonBar.routeName:
        return MaterialPageRoute(builder: (_) => const CustomNavigatonBar());
      case RegistrationPage.routeName:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => RegisterBloc(),
                  child: const RegistrationPage(),
                ));
      case MainPage.routeName:
        return MaterialPageRoute(builder: (_) => MainPage());
      case ProductDetailPage.routeName:
        return MaterialPageRoute(builder: (_) => const ProductDetailPage());

      default:
        return MaterialPageRoute(builder: (_) => const LanguagePage());
    }
  }
}