import 'package:assalomproject/core/common_models/hive_models/basket_model.dart';
import 'package:assalomproject/core/common_models/hive_models/favorites_model.dart';
import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/routes.dart';
import 'package:assalomproject/views/initail/pages/splash_screen.dart';
import 'package:assalomproject/views/main_page/logic/get_all_categories_bloc/get_all_categories_bloc.dart';
import 'package:assalomproject/widgets/nav_bar_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BasketModelAdapter());
  Hive.registerAdapter(FavoritesModelAdapter());
  await Hive.openBox<FavoritesModel>("favoritesBox");
  await Hive.openBox<FavoritesModel>("favoritesBoxForHome");
  await Hive.openBox<BasketModel>('basketBox');
  await Hive.openBox<BasketModel>('basketBoxForHome');
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  bool hasRegistered = _prefs.getString('token') == null;
  _prefs.getInt("place") != null ? null : _prefs.setInt('place', 2);

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ru'),
        Locale('uz'),
        Locale('uzk'),
      ],
      fallbackLocale: const Locale('ru'),
      startLocale: const Locale('ru'),
      path: "assets/translations",
      child: MyApp(hasRegistered: hasRegistered),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool hasRegistered;
  const MyApp({super.key, required this.hasRegistered});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'As-Salom',
      // initialRoute: SplashScreen.routeName,
      onGenerateRoute: Routes.generateRoute,
      theme: ThemeData(
        primaryColor: ConstColor.mainWhite,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: ScreenUtilInit(
        designSize: const Size(375, 812),
        child: !hasRegistered
            ? BlocProvider(
                create: (context) => GetAllCategoriesBloc(),
                child: const CustomNavigatonBar(),
              )
            : const SplashScreen(),
      ),
    );
  }
}
