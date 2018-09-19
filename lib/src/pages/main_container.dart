part of gamendar;

class MainContainer extends StatelessWidget {

  void toSettingsScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (BuildContext context) => SettingsPage()
    ));
  }

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
    body: RecentReleasesPage(),
  );
}