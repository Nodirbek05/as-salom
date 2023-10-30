import 'package:assalomproject/core/common_models/hive_models/basket_model.dart';
import 'package:assalomproject/core/common_models/hive_models/favorites_model.dart';
import 'package:assalomproject/core/constant/routes.dart';
import 'package:assalomproject/views/initail/pages/splash_screen.dart';
import 'package:assalomproject/views/main_page/logic/get_all_categories_bloc/get_all_categories_bloc.dart';
import 'package:assalomproject/widgets/nav_bar_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BasketModelAdapter());
  Hive.registerAdapter(FavoritesModelAdapter());
  await Hive.openBox<FavoritesModel>("favoritesBox");
  await Hive.openBox<BasketModel>('basketBox');
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  bool hasRegistered = _prefs.getString('token') != null;
  runApp(MyApp(hasRegistered: hasRegistered));
}

class MyApp extends StatelessWidget {
  final bool hasRegistered;
  const MyApp({super.key, required this.hasRegistered});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'As-Salom',
      // initialRoute: SplashScreen.routeName,
      onGenerateRoute: Routes.generateRoute,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: ScreenUtilInit(
        designSize: const Size(375, 812),
        child: hasRegistered
            ?  BlocProvider(
                create: (context) => GetAllCategoriesBloc(),
                child:const CustomNavigatonBar(),
              )
            : const SplashScreen(),
      ),
    );
  }
}
