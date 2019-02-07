part of gamendar;

class GameServiceClient extends IGDBClient {

  static final GameServiceClient _singleton = new GameServiceClient._internal();
  factory GameServiceClient() {
    return _singleton;
  }

  GameServiceClient._internal() : super(
      MY_USER_AGENT,
      MY_API_KEY,
      printRequests: true,
      printResponses: false,
  );

  final List<String> GAME_PARAMS = [
    'name',
    'url',
    'id',
    'summary',
    'cover.image_id',
    'genres.id',
    'genres.name',
    'release_dates.date',
    'release_dates.platform',
    'release_dates.region',
    'popularity',
    'rating',
    'rating_count',
    'aggregated_rating',
    'aggregated_rating_count',
    'screenshots.image_id',
    'videos.video_id',
  ];

  @override
  Future<List<Game>> games(IGDBRequestParameters params) async {
    IGDBRequestParameters newParams = params.copyWith(
      fields: GAME_PARAMS,
    );
    List<dynamic> result = await requestByEndpoint(IGDBEndpoints.GAMES, newParams);
    return result.map((m) => Game.fromMap(m)).toList();
  }

  @override
  Future<List<ReleaseDate>> releaseDates(IGDBRequestParameters params) async {
    IGDBRequestParameters newParams = params.copyWith(
      fields: [
        'date',
        'platform',
        'region',
        'game.name',
        'game.url',
        'game.id',
        'game.summary',
        'game.cover.image_id',
        'game.genres.id',
        'game.genres.name',
        'game.popularity',
        'game.rating',
        'game.rating_count',
        'game.aggregated_rating',
        'game.aggregated_rating_count',
        'game.screenshots.image_id',
        'game.videos.video_id',
        'game.release_dates.date',
        'game.release_dates.platform',
      ],
    );
    List<dynamic> result = await requestByEndpoint(IGDBEndpoints.RELEASE_DATES, newParams);
    return result.map((m) => ReleaseDate.fromMap(m)).toList();
  }

  Future<List<Game>> gamesFromReleaseDates(IGDBRequestParameters params) async {
    IGDBRequestParameters newParams = params.copyWith(
      fields:[
        'id',
        'game.id'
      ]
    );
    List<dynamic> result = await requestByEndpoint(IGDBEndpoints.RELEASE_DATES, newParams);
    List<String> gameIds = result.map((r) => r['game']['id'].toString()).toList();
    List<String> deduped = gameIds.toSet().toList();
    print(deduped); // remove dupes
    IGDBRequestParameters gameParams = new IGDBRequestParameters(
      fields: GAME_PARAMS,
      ids: deduped,
    );
    List<dynamic> gameResult = await requestByEndpoint(IGDBEndpoints.GAMES, gameParams);
    return gameResult.map((m) => Game.fromMap(m)).toList();
  }


}