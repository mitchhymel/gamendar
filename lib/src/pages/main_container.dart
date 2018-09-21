part of gamendar;

class MainContainer extends StatelessWidget {

  void toSettingsScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (BuildContext context) => SettingsPage()
    ));
  }

  List buildTextViews(int count) {
    List<Widget> strings = List();
    for (int i = 0; i < count; i++) {
      strings.add(new Padding(padding: new EdgeInsets.all(16.0),
          child: new Text("Item number " + i.toString(),
              style: new TextStyle(fontSize: 20.0))));
    }
    return strings;
  }

  Widget _getAppBar(BuildContext context) => Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
            Radius.circular(50.0)
        ),
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [
              0.3,
              0.6
            ],
            colors: [
              Colors.blueAccent[200],
              Colors.lightBlue,
            ]
        )
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => toSettingsScreen(context)
        )
      ],
    ),
  );

  Widget _getSliverAppBar(BuildContext context) => SliverAppBar(
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    floating: true,
    title: _getAppBar(context),
  );

  Widget _getSliverBody() => SafeArea(
    child: _getBody(),
  );

  Decoration _getScaffoldDecoration() => BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [
            0.3,
            0.6,
          ],
          colors: [
            Colors.redAccent[200],
            Colors.orangeAccent,
          ]
      )
  );

  Widget _getBody() => Container(
//    decoration: BoxDecoration(
//      gradient: LinearGradient(
//        begin: Alignment.topRight,
//        end: Alignment.bottomLeft,
//        stops: [
//          0.3,
//          0.6,
//        ],
//        colors: [
//          Colors.greenAccent[200],
//          Colors.green,
//        ]
//      )
//    ),
    child: RecentReleasesPage(),
  );

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => toSettingsScreen(context)
        )
      ],
    ),
    body: Container(
      decoration: BoxDecoration(
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
      ),
      child: RecentReleasesPage(),
    ),
  );

//  @override
//  Widget build(BuildContext context) => CustomAppBarScaffold(
//    body: SizedBox(
//      height: MediaQuery.of(context).size.height,
//      child: RecentReleasesPage()
//    ),
//    appbar: _getAppBar(context),
//    scaffoldBackground: _getScaffoldDecoration(),
//  );
}