part of gamendar;

class MainContainer extends StatelessWidget {

  void _onSettingsClicked(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<Null>(
        builder: (BuildContext context) => SettingsPage()
    ));
  }

  void _onSearchClicked(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<Null>(
        builder: (BuildContext context) => SearchPage()
    ));
  }

  Widget _getBody(BuildContext context) => Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
            0.3,
            0.6,
          ],
          colors: [
            Theme.of(context).primaryColorLight,
            Theme.of(context).primaryColorDark,
          ]
      ),
    ),
    child: QueryPage(AppModel.of(context).selectedQuery),
  );

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(AppModel.of(context).selectedQuery.name),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () => _onSearchClicked(context),
          color: Colors.white,
        ),
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () => _onSettingsClicked(context),
          color: Colors.white,
        )
      ],
    ),
    body: _getBody(context),
  );
}