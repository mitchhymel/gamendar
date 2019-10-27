part of gamendar;

class ThemeHelper {

  static Color getCardColorForGame(Game game) {
    if (game.releaseDates == null || game.releaseDates.length == 0) {
      return Colors.blueGrey;
    }

    return getCardColorForPlatform(game.releaseDates.first);
  }

  static Color getCardColorForPlatform(ReleaseDate date) {
    switch (date.platform) {
      case IGDBPlatforms.NINTENDO_3DS:
        return Colors.lightBlueAccent;
      case IGDBPlatforms.SWITCH:
        return Colors.red;
      case IGDBPlatforms.PLAYSTATION_4:
      case IGDBPlatforms.PLAYSTATION_3:
      case IGDBPlatforms.PLAYSTATION_2:
        return Colors.blueAccent;
      case IGDBPlatforms.XBOX_ONE:
      case IGDBPlatforms.XBOX_360:
      case IGDBPlatforms.XBOX:
        return Colors.green;
      default:
        return Colors.blueGrey;
    }
  }
}

class DarkTheme extends CustomTheme {
  DarkTheme(): super(
    name: 'Dark',
    primary: new Color(0xff212121),
    primaryLight: new Color(0xff484848),
    primaryDark: new Color(0xff1c313a),
    secondary: new Color(0xfff44336),
    secondaryLight: new Color(0xffff7961),
    secondaryDark: new Color(0xffba000d)
  );

  @override
  ThemeData getThemeData() {
    return ThemeData(
        primaryColor: this.primary,
        primaryColorLight: this.primaryLight,
        primaryColorDark: this.primaryDark,
        accentColor: this.secondary,
        cardColor: this.primaryLight,
        scaffoldBackgroundColor: this.primaryDark,
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.white,
          ),
          headline: TextStyle(
            color: Colors.white, //Colors.redAccent[200],,
          ),
          body2: new TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
          body1: new TextStyle(
            color: Colors.white, //Colors.orangeAccent,
            fontSize: 14.0,
          ),
        )
    );
  }
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
      new DarkTheme(),
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
