///
/// This is a fork of flutter_image_carousel to support dart 2.1
///
/// https://github.com/theobouwman/flutter_image_carousel
///

part of gamendar;

class ImageCarousel extends StatefulWidget {
  final List<ImageProvider> imageProviders;
  final double height;
  final Duration interval;
  final TabController tabController;
  final BoxFit fit;

  // Images will shrink according to the value of [height]
  // If you prefer to use the Material or Cupertino style activity indicator set the [platform] parameter
  // Set [interval] to let the carousel loop through each photo automatically
  // Pinch to zoom will be turned on by default
  ImageCarousel(
      this.imageProviders, {
        this.height = 250.0,
        this.interval,
        this.tabController,
        this.fit = BoxFit.cover,
      });

  @override
  State createState() => new _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> with SingleTickerProviderStateMixin {
  TabController _tabController;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _tabController = widget.tabController ??
        new TabController(vsync: this, length: widget.imageProviders.length);

    if (widget.interval != null) {
      _timer = new Timer.periodic(widget.interval, (_) {
        _tabController.animateTo(
            _tabController.index == _tabController.length - 1
                ? 0
                : ++_tabController.index);
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    if (_tabController != null) {
      _tabController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      height: widget.height,
      child: new TabBarView(
        controller: _tabController,
        children: widget.imageProviders.map((ImageProvider provider) {
          return new CarouselImageWidget(widget, provider, widget.fit, widget.height);
        }).toList(),
      ),
    );
  }
}

class CarouselImageWidget extends StatefulWidget {
  final ImageCarousel carousel;
  final ImageProvider imageProvider;
  final BoxFit fit;
  final double height;

  CarouselImageWidget(this.carousel, this.imageProvider, this.fit, this.height);

  @override
  State createState() => new _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImageWidget> {
  bool _loading = true;

  Widget _getIndicator() {
    return new Container(
      height: 40.0,
      width: 40.0,
      child: new CircularProgressIndicator(),
    );
  }


  @override
  void initState() {
    super.initState();

    widget.imageProvider.resolve(new ImageConfiguration()).addListener((i, b) {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: widget.height,
      child: _loading
          ? _getIndicator()
          : new GestureDetector(
        child: new Image(
          image: widget.imageProvider,
          fit: widget.fit,
        ),
      ),
    );
  }
}