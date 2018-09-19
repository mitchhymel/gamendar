part of gamendar;

class AppModel extends Model {

  GoogleSignInAccount _gUser;
  GoogleSignInAccount get gUser => _gUser;
  GoogleSignIn _gSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/calendar'
      ]
  );

  AppModel() {
    loginSilent();
  }

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