part of style;

class AppTheme {
  AppTheme._();

  factory AppTheme() => _instance;

  static final AppTheme _instance = AppTheme._();

  static Color get inputPlaceholder => const Color(0xffF5FBFF);
  static const Color secondaryColor = Color(0xff00BA9C);
  static const Color subtitleColor = Color(0xff888888);

  static ThemeData getCollectionTheme({
    required ThemeModel theme,
    required Brightness brightness,
    String? font,
  }) {
    late ColorScheme colorScheme;
    switch (brightness) {
      case Brightness.light:
        colorScheme = ColorScheme.light(
          primary: theme.primary,
          secondary: theme.secondary,
          surface: const Color(0xFFF3F3F3),
          tertiary: const Color(0xFFF0F0F0),
          background: const Color(0xfffcfcfc),
          error: const Color(0xffe74c3c),
        );
        break;
      case Brightness.dark:
        colorScheme = ColorScheme.dark(
          primary: theme.primary,
          secondary: theme.secondary,
          surface: const Color(0xFF333333),
          tertiary: const Color(0xFF333333),
          background: const Color(0xff000000),
          error: const Color(0xffe74c3c),
        );
        break;
      default:
    }

    final dark = colorScheme.brightness == Brightness.dark;
    final indicatorColor = dark ? colorScheme.onSurface : colorScheme.primary;
    final themeData = ThemeData(
      brightness: colorScheme.brightness,
      primaryColor: colorScheme.primary,
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      bottomAppBarColor: colorScheme.surface,
      cardColor: colorScheme.surface,
      dividerColor: colorScheme.onSurface.withOpacity(0.12),
      backgroundColor: colorScheme.background,
      dialogBackgroundColor: colorScheme.surface,
      errorColor: colorScheme.error,
      indicatorColor: indicatorColor,
      applyElevationOverlayColor: dark,
      dividerTheme: const DividerThemeData(
        color: Color(0xff525252),
      ),
      colorScheme: colorScheme,
      fontFamily: font,
    );
    final textTheme = themeData.textTheme;
    return themeData.copyWith(
      textTheme: themeData.textTheme.copyWith(
        button: textTheme.button!.copyWith(
          fontSize: 14.sp,
          height: 1.2,
          fontFamily: font,
        ),
        bodyText1: textTheme.bodyText1!.copyWith(
          height: 1.2,
          fontFamily: font,
          fontSize: 14.sp,
        ),
        bodyText2: textTheme.bodyText2!.copyWith(
          height: 1.2,
          fontFamily: font,
          fontSize: 14.sp,
        ),
        subtitle1: textTheme.subtitle1!.copyWith(
          height: 1.2,
          fontFamily: font,
          fontSize: 16.sp,
        ),
        subtitle2: textTheme.subtitle2!.copyWith(
          height: 1.2,
          fontFamily: font,
          fontSize: 16.sp,
        ),
        caption: textTheme.caption!.copyWith(
          height: 1.2,
          fontFamily: font,
          fontSize: 12.sp,
        ),
        overline: textTheme.overline!.copyWith(
          height: 1.2,
          fontFamily: font,
          fontSize: 10.sp,
        ),
        headline6: textTheme.headline6!.copyWith(
          height: 1.2,
          fontFamily: font,
          fontSize: 20.sp,
        ),
      ),
    );
  }
}
