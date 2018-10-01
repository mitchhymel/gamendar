part of gamendar;

class GameDetailReleasesWidget extends StatelessWidget {
  final Game game;
  GameDetailReleasesWidget({@required this.game});


  _onDateClick(BuildContext context, ReleaseDate date) async {
    if (AppModel.of(context).gUser == null) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Sign in with Google to save to calendar'),
      ));
      return;
    }

    GoogleCalendarClient client = GoogleCalendarClient();
    Event event = await client.createEvent(game.name,
        date.date, date.platform.name);

    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(event != null ?
      'Successfully saved release to Google Calendar' :
      'Error while saving release'),
    ));
  }

  _onTap(BuildContext context) {

  }

  Widget _getReleaseDateCard(BuildContext context, ReleaseDate date) => Card(
      margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
      color: ThemeHelper.getCardColorForPlatform(date),
      elevation: 4.0,
      child: InkWell(
        onTap: () => _onTap(context),
        onLongPress: () => _onDateClick(context, date),
        child: Container(
          margin: EdgeInsets.all(3.0),
          child: Row(
            children: <Widget>[
              Text(
                DateTimeHelper.getReleaseDateString(date),
                style: Theme.of(context).textTheme.body2,
              )
            ],
          ),
        ),
      )
  );

  @override
  Widget build(BuildContext context) {
    if (game.releaseDates == null || game.releaseDates.length == 0) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Release Dates', style: Theme.of(context).textTheme.title),
      ]..addAll((game.releaseDates.map((r) => _getReleaseDateCard(context, r)))),
    );
  }
}