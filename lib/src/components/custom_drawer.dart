part of gamendar;

class CustomDrawer extends StatelessWidget {

  void _onSettingsClicked(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<Null>(
        builder: (BuildContext context) => SettingsPage()
    ));
  }

  void _onLogoutClicked(BuildContext context) {
    print('logout not implemented yet');
  }

  void _onAddQueryClicked(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (context) => EditQueryPage(),
    ));
  }

  DecorationImage _getImage(BuildContext context) {
    AppModel model = AppModel.of(context);
    bool notLoggedIn = (model == null || model.gUser == null);

    return DecorationImage(
      image: model == null || model.gUser == null ? ExactAssetImage(AssetHelper.ImagePlaceholderPath)
          : NetworkImage(model.gUser.photoUrl),
      fit: BoxFit.cover,
    );
  }

  Widget _getDrawerHeader(BuildContext context) => DrawerHeader(
    child: Material(
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => _onLogoutClicked(context),
            color: Colors.white,
          ),
          Container(width: 12.0,),
          Container(
            width: 130.0,
            height: 130.0,
            decoration: BoxDecoration(
                image: _getImage(context),
                borderRadius: BorderRadius.all(
                  Radius.circular(120.0),
                ),
                border: Border.all(
                  color: Theme.of(context).accentColor,
                  width: 4.0,
                )
            ),
          ),
          Container(width: 12.0,),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => _onSettingsClicked(context),
            color: Colors.white,
          ),
        ],
      ),
    ),
  );

  Widget _getDrawerItem(BuildContext context, Query query) => Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      Text(query.name, style: Theme.of(context).textTheme.body2),
    ],
  );

  Widget _getAddQueryWidget(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      Text('Add new Query', style: Theme.of(context).textTheme.body2,),
      Material(
        color: Theme.of(context).primaryColor,
        child: IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _onAddQueryClicked(context),
          color: Colors.white,
        ),
      )
    ],
  );

  List<Widget> _getDrawerItems(BuildContext context) {
    AppModel model = AppModel.of(context);
    List<Widget> result = [];
    result.add(_getAddQueryWidget(context));

    if (model != null && model.queries.length > 0) {
      model.queries.forEach((q) => result.add(_getDrawerItem(context, q)));
    }

    return result;
  }

  BoxDecoration _getGradientBoxDecoration(BuildContext context) => BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [
          0.3,
          0.6
        ],
        colors: [
          Theme.of(context).primaryColor,
          Theme.of(context).accentColor,
        ]
    ),
  );

  @override
  Widget build(BuildContext context) => Drawer(
      child: Material(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: ListView(
            children: <Widget>[_getDrawerHeader(context)]
              ..addAll(_getDrawerItems(context)),
          ),
        ),
      )
  );
}