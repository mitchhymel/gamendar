part of gamendar;

class GameCard extends StatelessWidget {
  final Game game;

  GameCard(this.game);

  String _getSource() => 'releases${game.id}';

  _onTap(BuildContext context, Game game) {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new DetailsPageContainer(
            game: game,
            source: _getSource(),
          );
        }
    ));
  }

  DecorationImage getImage(Game game) {
    String imageUrl = AssetHelper.getImageUrlFromGame(game);
    return  DecorationImage(
      image: imageUrl == null ?
      AssetImage(AssetHelper.ImagePlaceholderPath)
          :  NetworkImage(imageUrl),
      fit: BoxFit.cover,
    );
  }

  Widget _getThumbnail(BuildContext context, Game game) => Container(
    alignment: FractionalOffset(0.0, 0.5),
    margin: EdgeInsets.only(left: 0.0),
    child: Container(
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
          image: getImage(game),
          borderRadius: BorderRadius.all(
            Radius.circular(50.0),
          ),
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 1.0,
          )
      ),
    ),
  );


  Widget _getCard(BuildContext context, String cardTag, Game game) => Container(
      margin: EdgeInsets.only(left: 16.0, right: 16.0),
      decoration: BoxDecoration(
          color: ThemeHelper.getCardColorForGame(game),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black87,
              blurRadius: 5.0,
              offset: Offset(0.0, 7.0),
            )
          ]
      ),
      child: Container(
          margin: EdgeInsets.only(left: 72.0, top: 16.0),
          constraints: BoxConstraints.expand(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(game.name, style: Theme.of(context).textTheme.headline,),
              Container(height:15.0),
              (game.releaseDates == null || game.releaseDates.length == 0) ? Container() : Column(
                children: <Widget>[
//                        new Icon(Icons.timer, size: 20.0, color: Colors.white),
//                        new Container(width: 4.0),
//                        new Text(DateTimeHelper.getDurationInHoursMins(recentGame.totalPlaytime)),
//                        new Container(width: 32.0),
                  Text(DateTimeHelper.getMonthDay(game.releaseDates.first.date)),
                  Text(game.releaseDates.first.platform.name),
                  Text(game.releaseDates.first.region.name),
                ],
              )
            ],
          )
      )
  );

//  Widget _getCard(BuildContext context, String cardTag, Game game) => Hero(
//    tag: cardTag,
//    child: Container(
//        margin: EdgeInsets.only(left: 16.0, right: 16.0),
//        decoration: BoxDecoration(
//            color: Theme.of(context).cardColor,
//            shape: BoxShape.rectangle,
//            borderRadius: BorderRadius.circular(8.0),
//            boxShadow: <BoxShadow>[
//              BoxShadow(
//                color: Colors.black87,
//                blurRadius: 5.0,
//                offset: Offset(0.0, 7.0),
//              )
//            ]
//        ),
//        child: Container(
//            margin: EdgeInsets.only(left: 72.0, top: 16.0),
//            constraints: BoxConstraints.expand(),
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              mainAxisAlignment: MainAxisAlignment.start,
//              children: <Widget>[
//                Text(game.name, style: Theme.of(context).textTheme.headline,),
//                Container(height:15.0),
//                Column(
//                  children: <Widget>[
////                        new Icon(Icons.timer, size: 20.0, color: Colors.white),
////                        new Container(width: 4.0),
////                        new Text(DateTimeHelper.getDurationInHoursMins(recentGame.totalPlaytime)),
////                        new Container(width: 32.0),
//                    Text(DateTimeHelper.getMonthDay(game.releaseDates.first.date)),
//                    Text(game.releaseDates.first.platform.name),
//                    Text(game.releaseDates.first.region.name),
//                  ],
//                )
//              ],
//            )
//        )
//    ),
//  );

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height/4;
    double width = MediaQuery.of(context).size.width;
    return Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () => _onTap(context, game),
          child: Stack(
            children: <Widget>[
              _getCard(context, 'card${game.id}', game),
              _getThumbnail(context, game),
              //_getButton(context),
            ],
          ),
        )
    );
  }
}