part of gamendar;

class GameServiceClient {

  final IGDBClient _client = new IGDBClient(
    USER_AGENT,
    MY_API_KEY,
  );

  static final GameServiceClient _singleton = new GameServiceClient._internal();
  factory GameServiceClient() {
    return _singleton;
  }
  GameServiceClient._internal();

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

  final List<String> RELEASE_DATE_PARAMS = [
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
  ];

  Future<List<Game>> games(IGDBRequestParameters params) async {
    IGDBRequestParameters newParams = params.copyWith(
      fields: GAME_PARAMS,
    );
    IGDBResponse result = await _client.games(newParams);
    if (result.isSuccess()) {
      return result.data.map((m) => Game.fromMap(m)).toList();
    }
    else {
      debugPrint(IGDBHelpers.getPrettyStringFromMap(result.toMap()));
      return [];
    }
  }

  Future<List<ReleaseDate>> releaseDates(IGDBRequestParameters params) async {
    IGDBRequestParameters newParams = params.copyWith(
      fields: RELEASE_DATE_PARAMS,
    );
    IGDBResponse result = await _client.releaseDates(newParams);
    if (result.isSuccess()) {
      return result.data.map((m) => ReleaseDate.fromMap(m)).toList();
    }
    else {
      debugPrint(IGDBHelpers.getPrettyStringFromMap(result.toMap()));
      return [];
    }
  }

  Future<List<Game>> gamesFromReleaseDates(IGDBRequestParameters params) async {
    IGDBRequestParameters newParams = params.copyWith(
      fields:[
        'id',
        'game.id'
      ]
    );
    IGDBResponse result = await _client.releaseDates(newParams);
    if (!result.isSuccess()) {
      debugPrint(IGDBHelpers.getPrettyStringFromMap(result.toMap()));
      return [];
    }
    List<int> gameIds = result.data.map((r) => r['game']['id']).toList();
    List<int> deduped = gameIds.toSet().toList();
    print(deduped); // remove dupes
    IGDBRequestParameters gameParams = new IGDBRequestParameters(
      fields: GAME_PARAMS,
      ids: deduped,
    );
    IGDBResponse gameResult = await _client.games(gameParams);
    if (!gameResult.isSuccess()) {
      debugPrint(IGDBHelpers.getPrettyStringFromMap(result.toMap()));
      return [];
    }
    return gameResult.data.map((m) => Game.fromMap(m)).toList();
  }


}