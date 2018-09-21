part of gamendar;

class AppModel extends Model {

  CustomTheme _theme;
  CustomTheme get theme => _theme;

  GoogleSignInAccount _gUser;
  GoogleSignInAccount get gUser => _gUser;
  GoogleSignIn _gSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/calendar'
      ]
  );

  AppModel() {
    _theme = new SunsetTheme();
    loginSilent();
  }

  static AppModel of(BuildContext context) => ScopedModel.of<AppModel>(context);

  Future<bool> loginSilent() async {
    _gUser = await _gSignIn.signInSilently();
    if (_gUser != null) {
      notifyListeners();
      return true;
    }
    else {
      return false;
    }
  }

  Future<bool> login() async {
    _gUser = await _gSignIn.signIn();
    if (_gUser != null) {
      notifyListeners();
      return true;
    }
    else {
      return false;
    }
  }

  Future<bool> logout() async {
    _gUser = await _gSignIn.signOut();
    if (_gUser == null) {
      notifyListeners();
      return true;
    }
    else {
      return false;
    }
  }
}