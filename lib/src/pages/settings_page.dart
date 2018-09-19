part of gamendar;

class SettingsPage extends StatelessWidget {

  Widget _getGoogleLoginButton(AppModel model) {
    if (model.gUser != null) {
      // log out
      return Center(
        child: RaisedButton(
          child: Text('Logout'),
          onPressed: () async {
            bool res = await model.logout();
            debugPrint('Logout $res');
          }
        ),
      );
    }
    else {
      // login
      return Row(
        children: <Widget>[
          Text('Login with Google'),
          RaisedButton(
            child: Text('Login'),
            onPressed: () async {
              bool res = await model.login();
              debugPrint('Login $res');
            },
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Settings'),
    ),
    body: ScopedModelDescendant<AppModel>(
      builder: (context, child, model) => Column(
        children: <Widget>[
          _getGoogleLoginButton(model),
        ],
      ),
    )
  );
}