part of gamendar;

class Query {
  final String name;
  final IGDBRequestParameters params;
  final IGDBEndpoints endpoint;
  Query({@required this.name, @required this.endpoint, @required this.params});

  static Query getRecentlyReleasedQuery() {
    int msecSinceEpoch = DateTime.now().millisecondsSinceEpoch;
    int secsSinceEpoch = msecSinceEpoch~/1000;
    String timeNow = secsSinceEpoch.toString();

    return Query(
      params: IGDBRequestParameters(
        filters: 'date > $timeNow & (region = ${IGDBRegions.NORTH_AMERICA.id} | region = ${IGDBRegions.NONE.id} | region = ${IGDBRegions.WORLDWIDE.id})',
        order: 'date asc',
      ),
      name: 'Coming soon',
      endpoint: IGDBEndpoints.RELEASE_DATES,
    );
  }
}