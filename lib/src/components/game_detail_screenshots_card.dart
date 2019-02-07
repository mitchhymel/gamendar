part of gamendar;

class GameDetailScreenshotsCard extends StatefulWidget {
  final Game game;

  GameDetailScreenshotsCard({@required this.game});

  @override
  State createState() => new _GameDetailScreenshotsCardState();
}


class _GameDetailScreenshotsCardState extends State<GameDetailScreenshotsCard> with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(
      vsync: this,
      length: widget.game.screenshots.length,
    );
  }

  @override
  void dispose() {
    //_tabController?.dispose();
    super.dispose();
  }

  Widget _getHeaderText(BuildContext context, String text) {
    return new Text(text, style: Theme.of(context).textTheme.title,);
  }

  Widget _getScreenshotItem(BuildContext context, int i) {
    ImageModel image = widget.game.screenshots[i];
    return new InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => new Center(
              child: new ImageCarousel(
                <ImageProvider>[]..addAll(
                  widget.game.screenshots.map(
                    (i) =>  new NetworkImage(
                      AssetHelper.getImageUrlFromImage(i),
                    )
                  )
                ),
                fit: BoxFit.fitHeight,
                tabController: _tabController,
              ),
            )
        );

        // set index AFTER showing dialog
        // if its set before, then you have to double tap to show the dialog
        // not sure why :/
        _tabController.index = i;
      },
      child: FadeInImage.assetNetwork(
        placeholder: AssetHelper.ImagePlaceholderPath,
        image: AssetHelper.getImageUrlFromImage(image),
        width: MediaQuery.of(context).size.width * .75,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.game.screenshots == null || widget.game.screenshots.length == 0) {
      return new Container();
    }

    List<Widget> children = [];
    for (int i = 0; i < widget.game.screenshots.length; i++) {
      children.add(new Container(
          margin: EdgeInsets.all(5.0),
          child: _getScreenshotItem(context, i)
      ));
    }

    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _getHeaderText(context, 'Screenshots'),
        new HorizontalScrollableMediaCard(
          height: MediaQuery.of(context).size.height/4,
          children: children,
        )
      ],
    );
  }
}