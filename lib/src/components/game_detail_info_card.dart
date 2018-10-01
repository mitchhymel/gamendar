part of gamendar;

class GameDetailInfoCard extends StatelessWidget {

  final Game game;
  GameDetailInfoCard({@required this.game});

  @override
  Widget build(BuildContext context) => game.summary == null ? Container() :
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Summary', style: Theme.of(context).textTheme.title),
        Card(
          elevation: 4.0,
          child: Text(
            game.summary ?? 'No description available.',
            style: Theme.of(context).textTheme.body1.copyWith(color: Theme.of(context).primaryColor),
          ),
        )
      ],
    );
}