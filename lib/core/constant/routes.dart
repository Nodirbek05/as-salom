import 'package:assalomproject/views/auth/data/logic/login_bloc/login_bloc.dart';
import 'package:assalomproject/views/auth/data/logic/registration_bloc/register_bloc.dart';
import 'package:assalomproject/views/auth/data/logic/verification_bloc/verification_bloc.dart';
import 'package:assalomproject/views/basket/data/logic/create_order_bloc/create_order_bloc.dart';
import 'package:assalomproject/views/basket/pages/basket_page.dart';
import 'package:assalomproject/views/confirm_order/confirm_order_by_card_bloc/confirm_order_by_card_bloc.dart';
import 'package:assalomproject/views/confirm_order/logic/get_zone_bloc/get_zone_bloc.dart';
import 'package:assalomproject/views/confirm_order/pages/choose_payment_page.dart';
import 'package:assalomproject/views/confirm_order/pages/confirm_animation_page.dart';
import 'package:assalomproject/views/confirm_order/pages/confirm_order_page.dart';
import 'package:assalomproject/views/confirm_order/pages/paying_by_card_page.dart';
import 'package:assalomproject/views/drawer/pages/drawer_page.dart';
import 'package:assalomproject/views/favorites/pages/favorites_page.dart';
import 'package:assalomproject/views/initail/pages/choose_language_page.dart';
import 'package:assalomproject/views/auth/pages/registration_page.dart';
import 'package:assalomproject/views/initail/pages/splash_screen.dart';
import 'package:assalomproject/views/inside_category/get_category_products_bloc/get_cat_products_bloc.dart';
import 'package:assalomproject/views/inside_category/inside_cat_first_bloc/inside_cat_first_bloc.dart';
import 'package:assalomproject/views/inside_category/pages/inside_cat_first_page.dart';
import 'package:assalomproject/views/inside_category/pages/inside_category_page.dart';
import 'package:assalomproject/views/main_page/logic/get_all_categories_bloc/get_all_categories_bloc.dart';
import 'package:assalomproject/views/main_page/logic/payment_bloc/payment_bloc.dart';
import 'package:assalomproject/views/main_page/logic/search_bloc/search_bloc.dart';
import 'package:assalomproject/views/main_page/pages/main_page.dart';
import 'package:assalomproject/views/product_detail/get_pro_with_slug_bloc/get_product_with_slug_bloc.dart';
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
      case ChoosePaymentPage.routeName:
        final id = settings.arguments as ChoosePaymentPage;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => PaymentBloc(),
                  child: ChoosePaymentPage(
                    id: id.id,
                    name: id.name,
                  ),
                ));
      case CustomNavigatonBar.routeName:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => GetAllCategoriesBloc(),
                    ),
                  ],
                  child: const CustomNavigatonBar(),
                ));
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
        return MaterialPageRoute(builder: (_) => const MainPage());

      case InsideCategoryPage.routeName:
        final productModel = settings.arguments as InsideCategoryPage;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => GetCatProductsBloc(),
              ),
              BlocProvider(
                create: (context) => SearchBloc(),
              ),
            ],
            child: InsideCategoryPage(
              isCat: productModel.isCat,
              id: productModel.id,
              name: productModel.name,
            ),
          ),
        );

      case FavoritesPage.routeName:
        return MaterialPageRoute(builder: (_) => const FavoritesPage());
      case ProfilePage.routeName:
        return MaterialPageRoute(builder: (_) => const ProfilePage());

      case BasketPage.routeName:
        final canBack = settings.arguments as bool;

        return MaterialPageRoute(
            builder: (_) => BasketPage(
                  canBack: canBack,
                ));

      case ConfirmOrderPage.routeName:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => CreateOrderBloc(),
                    ),
                    BlocProvider(
                      create: (context) => GetZoneBloc(),
                    ),
                  ],
                  child: const ConfirmOrderPage(),
                ));

      case InsideCatFirstPage.routeName:
        final subCategories = settings.arguments as InsideCatFirstPage;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => InsideCatFirstBloc(),
                  child: InsideCatFirstPage(
                    name: subCategories.name,
                    id: subCategories.id,
                  ),
                ));

      case DrawerPage.routeName:
        return MaterialPageRoute(builder: (_) => const DrawerPage());

      case PayingByCardPage.routeName:
        final id = settings.arguments as PayingByCardPage;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => ConfirmOrderByCardBloc(),
                  child: PayingByCardPage(
                    id: id.id,
                    name: id.name,
                  ),
                ));
      case ConfirmAnimationPage.routeName:
        return MaterialPageRoute(builder: (_) => const ConfirmAnimationPage());
      case ProductDetailPage.routeName:
        final product = settings.arguments as ProductDetailPage;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => GetProductWithSlugBloc(),
                  child: ProductDetailPage(
                    product: product.product,
                    slug: product.slug,
                  ),
                ));
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
