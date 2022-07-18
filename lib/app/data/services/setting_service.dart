import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../core/styles/styles.dart';
import '../../core/utilities/utilities.dart';
import '../models/theme_model.dart';

class SettingUtils {
  static const String language = 'language';
  static const String theme = 'theme';
  static const String themeMode = 'themeMode';
  static const String themeSystem = 'system';
  static const String themeLight = 'light';
  static const String themeDark = 'dark';
  static const String font = 'font';
}

class SettingService extends GetxService {
  final _themeMode = ThemeMode.system.obs;
  ThemeMode get themeMode => _themeMode.value;
  set themeMode(ThemeMode mode) => _themeMode(mode);

  bool get isDarkTheme => themeMode == ThemeMode.dark;

  List<String> fontSupport = <String>[
    'NotoSans',
    'OpenSans',
    'Roboto',
  ];

  String currentFont = 'NotoSans';

  ThemeModel currentTheme = themeSupport.first;

  late ThemeData lightTheme = AppTheme.getCollectionTheme(
    theme: currentTheme,
    font: currentFont,
    brightness: Brightness.light,
  );
  late ThemeData darkTheme = AppTheme.getCollectionTheme(
    theme: currentTheme,
    font: currentFont,
    brightness: Brightness.dark,
  );

  @override
  void onInit() {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarBrightness: darkTheme.brightness),
    );

    final oldThemeMode = Preferences.getString(SettingUtils.themeMode);

    if (oldThemeMode != null) {
      switch (oldThemeMode) {
        case SettingUtils.themeLight:
          themeMode = ThemeMode.light;
          break;
        case SettingUtils.themeDark:
          themeMode = ThemeMode.dark;
          break;
        default:
          themeMode = ThemeMode.light;
      }
    }
    changeTheme(
      theme: ThemeModel(
        name: 'dark-yellow',
        primary: const Color(0xFF3498db),
        secondary: const Color(0xff0478CC),
      ),
      mode: Preferences.pref.getString(SettingUtils.theme) ==
              SettingUtils.themeDark
          ? ThemeMode.dark
          : ThemeMode.light,
      font: 'SFPro',
    );

    super.onInit();
  }

  void changeTheme({ThemeModel? theme, ThemeMode? mode, String? font}) {
    currentFont = font ?? currentFont;
    currentTheme = theme ?? currentTheme;
    themeMode = mode ?? themeMode;
    switch (mode) {
      case ThemeMode.dark:
        Get.changeTheme(AppTheme.getCollectionTheme(
          theme: currentTheme,
          font: currentFont,
          brightness: Brightness.dark,
        ));
        Get.changeThemeMode(themeMode);
        break;
      case ThemeMode.light:
        Get.changeTheme(AppTheme.getCollectionTheme(
          theme: currentTheme,
          font: currentFont,
          brightness: Brightness.light,
        ));
        Get.changeThemeMode(themeMode);
        break;

      default:
        Get.changeTheme(AppTheme.getCollectionTheme(
          theme: currentTheme,
          font: currentFont,
          brightness: Brightness.light,
        ));
        Get.changeThemeMode(themeMode);
    }
    Preferences.setString(SettingUtils.theme, currentTheme.name);
    Preferences.setString(SettingUtils.font, currentFont);
    switch (themeMode) {
      case ThemeMode.system:
        Preferences.setString(SettingUtils.theme, SettingUtils.themeSystem);
        break;
      case ThemeMode.dark:
        Preferences.setString(SettingUtils.theme, SettingUtils.themeDark);
        break;
      case ThemeMode.light:
        Preferences.setString(SettingUtils.theme, SettingUtils.themeLight);
        break;
      default:
        break;
    }
  }
}
