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
    body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [
            0.3,
            0.6
          ],
          colors: [
            Colors.redAccent[200],
            Colors.orangeAccent,
          ]
        )
      ),
      child: RecentReleasesPage(),
    )
  );
}