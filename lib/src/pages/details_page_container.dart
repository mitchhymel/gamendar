part of gamendar;

class DetailsPageContainer extends StatefulWidget {
  final Game game;
  final String source;
  DetailsPageContainer({@required this.game, this.source=''});

  @override
  _DetailsPageState createState() => new _DetailsPageState(game: this.game, source: this.source);
}

class _DetailsPageState extends State<DetailsPageContainer> with SingleTickerProviderStateMixin {
  final Game game;
  final String source;
  ScrollController _scrollController;

  _DetailsPageState({@required this.game, @required this.source});

  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _getCustomAppBar(BuildContext context, Game game) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double fadedImageWidth = screenWidth;
    double fadedImageHeight = screenHeight * .5;
    double clearImageWidth = screenWidth * .4;
    double clearImageHeight = screenHeight * .25;

    return SliverAppBar(
      title: Text(game.name, style: Theme.of(context).textTheme.title),
      backgroundColor: Theme.of(context).primaryColor,
      pinned: true,
      expandedHeight: fadedImageHeight - MediaQuery.of(context).padding.top,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: <Widget>[
            GameImage(
              game: game,
              heroTag: 'somethingelse',
              width: fadedImageWidth,
              height: fadedImageHeight,
              fit: BoxFit.cover,
            ),
            ClipRect(
              child: BackdropFilter(
                filter: dartui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  width: fadedImageWidth,
                  height: fadedImageHeight,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100.withOpacity(0.05)
                  ),
                ),
              ),
            ),
            Hero(
              tag: game.id.toString() + 'card1', //TODO: change to get hero animation
              child: Container(
                height: fadedImageHeight,
                width: fadedImageWidth,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Colors.transparent,
                        Theme.of(context).primaryColor
                      ],
                      stops: [0.0, 0.95],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(0.0, 1.0),
                    )
                ),
              ),
            ),
            Center(
              child: GameImage(
                game: game,
                width: clearImageWidth,
                height: clearImageHeight,
                heroTag: game.id.toString() + source,
                fit: BoxFit.scaleDown,
              )
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              child: _getCustomAppBar(context, game),
            )
          ];
        },
        body: SafeArea(
            top: false,
            bottom: false,
            child: Builder(
                builder: (context) {
                  return CustomScrollView(
                      slivers: <Widget>[
                        SliverOverlapInjector(
                          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                        ),
                        SliverToBoxAdapter(
                          child: DetailsPageBody(),
                        ),
                      ]
                  );
                }
            )
        )
    ),
    //floatingActionButton: new GameDetailFabDial(game: game),
  );
}