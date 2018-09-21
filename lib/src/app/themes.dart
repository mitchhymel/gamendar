part of gamendar;

class SunsetTheme extends CustomTheme {

  @override
  ThemeData getThemeData() {
    return ThemeData(
      primaryColor: Colors.redAccent,
      accentColor: Colors.orangeAccent,
    );
  }
}

class PurpleBlueTheme extends CustomTheme {
  PurpleBlueTheme() : super(
      name: 'Deep purple and blue',
      primary: new Color(0xff512da8),
      primaryLight: new Color(0xff8559da),
      primaryDark: new Color(0xff140078),
      secondary: new Color(0xff00e5ff),
      secondaryLight: new Color(0xff000000),
      secondaryDark: new Color(0xff000000)
  );
}

class OrangeRedTheme extends CustomTheme {
  OrangeRedTheme() : super(
    name: 'Orange and red',
    primary: new Color(0xff4527a0),
    primaryLight: new Color(0xff7953d2),
    primaryDark: new Color(0xff000070),
    secondary: new Color(0xffef5350),
    secondaryLight: new Color(0xffff867c),
    secondaryDark: new Color(0xffb61827),
  );
}

abstract class CustomTheme {
  final String name;
  final Color primary;
  final Color primaryLight;
  final Color primaryDark;
  final Color secondary;
  final Color secondaryLight;
  final Color secondaryDark;

  static List<CustomTheme> getAllThemes() {
    return [
      new PurpleBlueTheme(),
      new OrangeRedTheme()
    ];
  }

  CustomTheme({
    @required this.name,
    @required this.primary,
    @required this.primaryLight,
    @required this.primaryDark,
    @required this.secondary,
    @required this.secondaryDark,
    @required this.secondaryLight
  });

  ThemeData getThemeData() {
    return new ThemeData(
        primaryColor: primary,
        secondaryHeaderColor: secondary,
        splashColor: primary,
        accentColor: secondary,
        indicatorColor: secondary,
        cardColor: primaryLight,
        scaffoldBackgroundColor: primaryDark,
        dialogBackgroundColor: primary,
        disabledColor: secondaryDark,
        textTheme: new TextTheme(
          headline: new TextStyle(
              color: Colors.white,
              fontSize: 24.0,
          ),
          title: new TextStyle(
              color: Colors.white,
              fontSize: 20.0,
          ),
          caption: new TextStyle(
              color: Colors.grey,
              fontSize: 14.0
          ),
          body1: new TextStyle(
              color: Colors.white,
              fontSize: 24.0,
          ),
          body2: new TextStyle(
              color: Colors.white,
              fontSize: 13.0
          ),
          display1: new TextStyle(
            color: Colors.red,
            fontSize: 16.0,
          ),
          display2: new TextStyle(
            color: Colors.green,
            fontSize: 16.0,
          ),
          display3: new TextStyle(
            color: Colors.orange,
            fontSize: 16.0,
          ),
          display4: new TextStyle(
            color: Colors.blue,
            fontSize: 16.0,
          ),
          subhead: new TextStyle(
              color: secondary,
              fontSize: 14.0
          ),
          button: new TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
          ),
        )
    );
  }
}
