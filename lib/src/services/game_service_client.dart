part of gamendar;

class GameServiceClient extends IGDBClientTyped {

  static final GameServiceClient _singleton = new GameServiceClient._internal();
  factory GameServiceClient() {
    return _singleton;
  }

  GameServiceClient._internal() : super(
      MY_USER_AGENT,
      IGDB_API_URL,
      MY_API_KEY
  );

  static const List<String> fields = const [
    'name',
    'url',
    'id',
    'summary',
    'cover.cloudinary_id',
    'genres',
    'platforms',
    'release_dates',
    'popularity',
    'rating',
    'rating_count',
    'aggregated_rating',
    'aggregated_rating_count',
    'screenshots',
    'videos',
  ];

  Future<List<Game>> searchGames(String value) async {
    return await games(new RequestParameters(
        search: value,
        fields: fields
    ));
  }

  Future<List<Game>> fetchGames(List<int> ids) async {
    return await games(new RequestParameters(
        ids: ids.map((id) => id.toString()).toList(),
        fields: fields,
        limit: 20
    ));
  }

//  Future<List<GameModel>> fetchQuery(Query query) async {
//    List result = await requestByEndpoint(query.endpoint, query.params);
//    return _convertIgdbMapListToGameModelList(result);
//  }


}