import 'package:assalomproject/views/auth/data/logic/login_bloc/login_bloc.dart';
import 'package:assalomproject/views/auth/data/logic/registration_bloc/register_bloc.dart';
import 'package:assalomproject/views/auth/data/logic/verification_bloc/verification_bloc.dart';
import 'package:assalomproject/views/basket/basket_page.dart';
import 'package:assalomproject/views/confirm_order/pages/confirm_order_page.dart';
import 'package:assalomproject/views/drawer/pages/drawer_page.dart';
import 'package:assalomproject/views/favorites/pages/favorites_page.dart';
import 'package:assalomproject/views/initail/pages/choose_language_page.dart';
import 'package:assalomproject/views/auth/pages/registration_page.dart';
import 'package:assalomproject/views/initail/pages/splash_screen.dart';
import 'package:assalomproject/views/main_page/pages/main_page.dart';
import 'package:assalomproject/views/product_detail/pages/product_detail.dart';
import 'package:assalomproject/views/profile/data/logic/get_user_profile_bloc/get_user_profile_bloc.dart';
import 'package:assalomproject/views/profile/data/logic/update_name_bloc/update_name_bloc.dart';
import 'package:assalomproject/views/profile/data/models/model_for_update.dart';
import 'package:assalomproject/views/profile/pages/profile_page.dart';
import 'package:assalomproject/views/profile/pages/update_page.dart';
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
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => RegisterBloc(),
                    ),
                    BlocProvider(
                      create: (context) => VerificationBloc(),
                    ),
                    BlocProvider(
                      create: (context) => LoginBloc(),
                    ),
                  ],
                  child: const RegistrationPage(),
                ));
      case MainPage.routeName:
        return MaterialPageRoute(builder: (_) => MainPage());

      case FavoritesPage.routeName:
        return MaterialPageRoute(builder: (_) => const FavoritesPage());
      case ProfilePage.routeName:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => GetUserProfileBloc(),
                  child: const ProfilePage(),
                ));

      case BasketPage.routeName:
        return MaterialPageRoute(builder: (_) => const BasketPage());

      case ChoosePaymentPage.routeName:
        return MaterialPageRoute(builder: (_) => const ChoosePaymentPage());

      case DrawerPage.routeName:
        return MaterialPageRoute(builder: (_) => const DrawerPage());
      case ProductDetailPage.routeName:
        return MaterialPageRoute(builder: (_) => const ProductDetailPage());
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case UpdateUserDataPage.routeName:
        final data = settings.arguments as ModelForUpdate;
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => UpdateNameBloc(),
                    ),
                    BlocProvider(
                      create: (context) => GetUserProfileBloc(),
                    ),
                    BlocProvider(
                      create: (context) => VerificationBloc(),
                    ),
                  ],
                  child: UpdateUserDataPage(data: data),
                ));
      default:
        return MaterialPageRoute(builder: (_) => const LanguagePage());
    }
  }
}
