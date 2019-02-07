part of gamendar;

class QueryPage extends StatelessWidget {
  final Query query;
  QueryPage(this.query);

  Future<List> _requestData(int page, int pageSize) async {
    GameServiceClient client = new GameServiceClient();

    IGDBRequestParameters params = query.params.copyWith(
      limit: pageSize,
      offset: page * pageSize,
    );

    if (query.endpoint == IGDBEndpoints.GAMES) {
      return await client.games(params);
    }
    else {
      return await client.releaseDates(params);
    }
  }

  Widget _getWidget(dynamic obj) => query.endpoint == IGDBEndpoints.GAMES ?
      GameCard(obj) : ReleaseDateCard(obj);
      
  @override
  Widget build(BuildContext context) => PaginatedInfiniteScrollView(
    pageRequest: _requestData,
    widgetAdapter: _getWidget,
    pageSize: 25,
    maxLimit: 250,
  );
}