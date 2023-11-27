import 'dart:ui';

import 'package:assalomproject/core/constant/lang_model.dart';
import 'package:easy_localization/easy_localization.dart';

abstract class DataConst {
  static List<LanguageModel> languages = [
    LanguageModel(name: "UZB", locale: const Locale('uz', 'UZ')),
    LanguageModel(name: "RUS", locale: const Locale('ru', 'RU')),
    LanguageModel(name: "ENG", locale: const Locale('en', 'EN')),
  ];

  static List<String> tabs = [tr('my_orders'), tr('personal_info')];
}
