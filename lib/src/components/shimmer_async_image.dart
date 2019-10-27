part of gamendar;

class ShimmerAsyncImage extends StatefulWidget {

  final Image image;

  ShimmerAsyncImage({
    @required this.image,
  });

  @override
  ShimmerAsyncImageState createState() => ShimmerAsyncImageState();
}

class ShimmerAsyncImageState extends State<ShimmerAsyncImage> {

  bool _imageLoaded = false;

  @override
  void initState() {
    super.initState();
    widget.image.image.resolve(new ImageConfiguration()).addListener(ImageStreamListener((_,__) {
      if (mounted) {
        setState(() {
          _imageLoaded = true;
        });
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    if (_imageLoaded) {
      return widget.image;
    }
    else {
      return SizedBox(
        width: widget.image.width,
        height: widget.image.height,
        child: Shimmer.fromColors(
          baseColor: Colors.white,
          highlightColor: Colors.redAccent,
          direction: ShimmerDirection.ltr,
          child: Container(
            width: widget.image.width,
            height: widget.image.height,
            color: Colors.grey,
          ),
//          child: Container(
//            width: 80.0,
//            height: 80.0,
//            decoration: BoxDecoration(
//              image: DecorationImage(image: widget.image),
//              borderRadius: BorderRadius.all(
//                Radius.circular(50.0),
//              ),
//              border: Border.all(
//                color: Theme.of(context).primaryColor,
//                width: 1.0,
//              )
//            ),
//          ),
        )
      );
    }
  }
}