part of gamendar;

class SearchPage extends StatefulWidget {

  @override
  State createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  String _search;

  _onSubmitted(String value) async {
    setState(() {
      _search = value;
    });
  }

  Future<List<Game>> _requestData(int page, int pageSize) async {
    GameServiceClient client = new GameServiceClient();

    return await client.games(
        new IGDBRequestParameters(
          search: _search,
          limit: pageSize,
          offset: page*pageSize,
        ),
    );
  }

  Widget _getContent() => _search == null ? Container() :
    PaginatedInfiniteScrollView<Game>(
      pageRequest: _requestData,
      widgetAdapter: (g) => GameCard(g),
    );

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: BackButton(),
      title: TextField(
        autofocus: true,
        style: Theme.of(context).textTheme.body2.copyWith(fontSize: 20.0),
        onSubmitted: _onSubmitted,
      )
    ),
    body: _getContent(),
  );
}