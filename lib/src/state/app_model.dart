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

  List<Query> _queries;
  List<Query> get queries => _queries;

  Query _selectedQuery;
  Query get selectedQuery => _selectedQuery;

  AppModel() {
    _theme = new DarkTheme();
    _queries = [Query.getRecentlyReleasedQuery()];
    _selectedQuery = _queries.first;
    loginSilent();
  }

  static AppModel of(BuildContext context) => ScopedModel.of<AppModel>(context);

  Future<bool> loginSilent() async {
    _gUser = await _gSignIn.signInSilently();
    if (_gUser != null) {
      GoogleCalendarClient().init(_gUser);
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
      GoogleCalendarClient().init(_gUser);
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
      GoogleCalendarClient().logout();
      notifyListeners();
      return true;
    }
    else {
      debugPrint('error when logging out');
      return false;
    }
  }

  void addQuery(Query query) {
    _queries.add(query);
    notifyListeners();
  }

  void removeQuery(Query query) {
    _queries.remove(query);
    notifyListeners();
  }
}