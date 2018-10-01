part of gamendar;

class Query {
  final String name;
  final RequestParameters params;
  final Endpoints endpoint;
  Query({@required this.name, @required this.endpoint, @required this.params});

  static Query getRecentlyReleasedQuery() {
    String timeNow = new DateTime.now()
        .millisecondsSinceEpoch
        .toString();

    return Query(
      params: RequestParameters(
        filters: [
          new Filter('date', FilterOperator.GREATER_THAN, timeNow),
          new Filter('region', FilterOperator.EQUAL, Regions.NORTH_AMERICA.id)
        ],
        expand: 'game',
        order: 'date:asc',
      ),
      name: 'Recently Released',
      endpoint: Endpoints.RELEASE_DATES,
    );
  }
}