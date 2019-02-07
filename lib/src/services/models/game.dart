
part of gamendar;

class Game {
  final int id;
  final String name;
  final String url;
  final String summary;
  final double popularity;
  final double rating;
  final int ratingCount;
  final double aggregatedRating;
  final int aggregatedRatingCount;
  final double totalRating;
  final int totalRatingCount;
  final List<IGDBGenres> genres;
  final List<IGDBPlatforms> platforms;
  final List<ReleaseDate> releaseDates;
  final List<ImageModel> screenshots;
  final List<Video> videos;
  final ImageModel cover;

  Game({
    this.id,
    this.name,
    this.url,
    this.summary,
    this.popularity,
    this.rating,
    this.ratingCount,
    this.aggregatedRating,
    this.aggregatedRatingCount,
    this.totalRating,
    this.totalRatingCount,
    this.genres,
    this.platforms,
    this.releaseDates,
    this.screenshots,
    this.videos,
    this.cover,
  });


  static Game fromMap(Map map) {
    return new Game(
        id: map['id'],
        name: map['name'],
        url: map['url'],
        summary: map['summary'],
        popularity: map['popularity'],
        rating: map['rating'],
        ratingCount: map['ratingCount'],
        aggregatedRating: map['aggregated_rating'],
        aggregatedRatingCount: map['aggregated_rating_count'],
        totalRating: map['total_rating'],
        totalRatingCount: map['total_rating_count'],
        genres: IGDBGenres.listFromMapList(map['genres']),
        platforms: IGDBPlatforms.listFromMapList(map['platforms']),
        releaseDates: map['release_dates'] is List ? ReleaseDate.listFromMapList(map['release_dates']) : null,
        screenshots: ImageModel.listFromMapList(map['screenshots']),
        videos: Video.listFromMapList(map['videos']),
        cover: ImageModel.fromMap(map['cover']),
    );
  }

  static List<Game> listFromMapList(List<dynamic> maps) {
    if (maps == null) {
      return new List<Game>();
    }

    return maps.map((m) => fromMap(m)).toList();
  }
}
