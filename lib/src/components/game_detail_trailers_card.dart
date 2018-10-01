part of gamendar;

class GameDetailTrailersCard extends StatelessWidget {
  final Game game;
  GameDetailTrailersCard({@required this.game});

  Widget _getVideoItem(BuildContext context, Video video) {
    return new InkWell(
        onTap: () async {
          String url = 'https://youtu.be/${video.videoId}';
          if (await canLaunch(url)) {
            await launch(url);
          }
          else {
            print('could not launch $url');
          }
        },
        child: new Stack(
            children: <Widget>[
              new Image.network(
                'https://img.youtube.com/vi/${video.videoId}/0.jpg',
                width: 150.0,
              ),
              new Container(
                height: 100.0,
                width: 150.0,
                color: new Color(0x77000000),
                child: new Icon(Icons.play_circle_outline, color: Colors.grey),
              )
            ]
        )
    );

  }

  @override
  Widget build(BuildContext context) {
    if (game.videos == null || game.videos.length == 0) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Trailers', style: Theme.of(context).textTheme.title),
        HorizontalScrollableMediaCard(
          height: 125.0,
          children: <Widget>[]..addAll(
            game.videos.map((v){
              return Container(
                margin: EdgeInsets.all(5.0),
                child: _getVideoItem(context, v),
              );
            }).toList()
          )
        )
      ],
    );
  }
}