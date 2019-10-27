part of gamendar;

class GoogleLoginComponent extends StatelessWidget {

  Widget _getGoogleSettings(BuildContext context, AppModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text('Google Settings',
        style: Theme.of(context).textTheme.headline,
        textAlign: TextAlign.left,
      ),
      Row(
        children: <Widget>[
          Text('Logged in as ${model.gUser.displayName}'),
          Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(model.gUser.photoUrl),
                    fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(120.0),
                ),
                border: Border.all(
                  color: Theme.of(context).accentColor,
                  width: 4.0,
                )
            ),
          ),
          RaisedButton(
              child: Text('Logout'),
              onPressed: () async {
                bool res = await model.logout();
                debugPrint('Logout $res');
              }
          )
        ],
      )
    ],
  );

  @override
  Widget build(BuildContext context) => ScopedModelDescendant<AppModel>(
    builder: (context, widget, model) {
      if (model.gUser != null) {
        return _getGoogleSettings(context, model);
      }
      else {
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
    },
  );
}