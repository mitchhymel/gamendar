part of gamendar;


class DetailsPageBody extends StatelessWidget {
  final Game game;
  DetailsPageBody({@required this.game});

  @override
  Widget build(BuildContext context) => Column(
    children: <Widget>[
      GameDetailReleasesWidget(game: game),
      GameDetailInfoCard(game: game),
      GameDetailScreenshotsCard(game: game),
      GameDetailTrailersCard(game: game),
    ],
  );
}