part of gamendar;

class RecentReleasesPage extends StatelessWidget {

  Future<List<ReleaseDate>> _requestData(int page, int pageSize) async {
    GameServiceClient client = new GameServiceClient();

    String timeNow = new DateTime.now()
        .millisecondsSinceEpoch
        .toString();

    return await client.releaseDates(
      new RequestParameters(
        filters: [
          new Filter('date', FilterOperator.GREATER_THAN, timeNow),
        ],
        expand: 'game',
        order: 'date:asc',
        limit: pageSize,
        offset: page*pageSize,
      ),
      expandGame: true
    );
  }

  @override
  Widget build(BuildContext context) => PaginatedInfiniteScrollView<ReleaseDate>(
    pageRequest: _requestData,
    widgetAdapter: (releaseDate) => ReleaseDateCard(releaseDate),
    pageSize: 25,
    maxLimit: 250,
  );
}