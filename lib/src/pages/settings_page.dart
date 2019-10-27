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

  List<Widget> _getSettingsList(BuildContext context, AppModel model) => <Widget>[
    Text('IGDB Settings',
      style: Theme.of(context).textTheme.headline,
      textAlign: TextAlign.left,
    ),
    Text('Regions',
      style: Theme.of(context).textTheme.body1,
      textAlign: TextAlign.left,
    ),
    Divider(
      color: Colors.white, //Theme.of(context).accentColor,
      height: 8.0,

    ),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Settings'),
    ),
    body: ScopedModelDescendant<AppModel>(
      builder: (context, child, model) => Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _getSettingsList(context, model)
            ..add(GoogleLoginComponent()),
        ),
      ),
    )
  );
}