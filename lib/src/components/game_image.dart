part of gamendar;

class GameImage extends StatelessWidget {
  final Game game;

  final BoxFit fit;
  final double width;
  final double height;
  final Alignment alignment;
  final bool toDetail;
  final String heroTag;
  final String source;

  GameImage({
    @required this.game,
    this.fit = BoxFit.scaleDown,
    this.width = 80.0,
    this.height = 80.0,
    this.alignment = Alignment.center,
    this.toDetail = true,
    this.heroTag,
    this.source='',
  });

  _onTap(BuildContext context, Game result) {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new DetailsPageContainer(
            game: result,
            source: this.source,
          );
        }
    ));
  }

  Widget _getImage() {
    Widget child;
    if (AssetHelper.getImageUrlFromGame(game) == null) {
      child = Image.asset(
        AssetHelper.ImagePlaceholderPath,
        fit: fit,
        width: width,
        height: height,
        alignment: alignment,
      );
    }
    else {
      child = FadeInImage.assetNetwork(
        placeholder: AssetHelper.ImagePlaceholderPath,
        image: AssetHelper.getImageUrlFromGame(game),
        fit: fit,
        width: width,
        height: height,
        alignment: alignment,
      );
    }

    if (heroTag != null) {
      return Hero(
          tag: heroTag,
          child: child
      );
    }
    else if (source != null){
      return Hero(
        tag: game.id.toString() + source,
        child: child,
      );
    }
    else {
      return child;
    }
  }

  @override
  Widget build(BuildContext context) {
    return toDetail ? InkWell(
        onTap: toDetail ? () => _onTap(context, game) : () {},
        child: _getImage()
    ) : _getImage();
  }
}