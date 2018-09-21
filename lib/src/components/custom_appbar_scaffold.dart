part of gamendar;

class CustomAppBarScaffold extends StatefulWidget {

  final Widget appbar;
  final Widget body;
  final Decoration scaffoldBackground;
  CustomAppBarScaffold({@required this.appbar, @required this.body, this.scaffoldBackground});

  @override
  State createState() => _CustomAppBarScaffoldState();
}

class _CustomAppBarScaffoldState extends State<CustomAppBarScaffold> {

  @override
  Widget build(BuildContext context) => Scaffold(
//      body: NestedScrollView(
//        headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
//          SliverAppBar(
//            elevation: 0.0,
//            backgroundColor: Colors.transparent,
//            floating: true,
//            title: widget.appbar
//            //title: widget.appbar,
//          ),
//        ],
//        body: widget.body,
//      )
//    body: CustomScrollView(
//      slivers: <Widget>[
//        SliverAppBar(
//          elevation: 0.0,
//          backgroundColor: Colors.transparent,
//          floating: true,
//          title: widget.appbar,
//        ),
//        SliverList(
//          delegate: SliverChildListDelegate(
//            <Widget>[
//              SizedBox(
//                height: 1000.0,
//                child: widget.body,
//              )
//            ]
//          ),
//        )
//      ]
//    )
      body: Container(
        decoration: widget.scaffoldBackground,
        child: Stack(
          children: <Widget>[
            CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: widget.body,
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
              child: widget.appbar,
            ),
          ],
        ),
      )
  );
}
