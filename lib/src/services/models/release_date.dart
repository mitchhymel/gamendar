part of gamendar;


DateTime dateTimeFromMsecSinceEpoch(int value) {
  if (value == null) {
    // error?
    return new DateTime.now();
  }
  return new DateTime.fromMillisecondsSinceEpoch(1000*value, isUtc: true);
}

class ReleaseDate {
  final int id;
  final Game game;
  final IGDBPlatforms platform;
  final DateTime date;
  final IGDBRegions region;
  final int y;
  final int m;
  final String human;

  ReleaseDate({
    this.id,
    this.game,
    this.platform,
    this.date,
    this.region,
    this.y,
    this.m,
    this.human
  });

  @override
  String toString() {
    return this.toMap().toString();
  }

  Map toMap() {
    return {
      'id': id,
      'game': game,
      'date': date,
      'platform': platform,
      'region': region,
      'y': y,
      'm': m,
      'human': human,
    };
  }

  static ReleaseDate fromMap(Map map) {
    return new ReleaseDate(
        id: map['id'],
        game: (map['game'] == null || map['game'] is int) ? null : Game.fromMap(map['game']),
        platform: IGDBPlatforms.fromInt(map['platform']),
        date: dateTimeFromMsecSinceEpoch(map['date']),
        region: IGDBRegions.fromInt(map['region']),
        y: map['y'],
        m: map['m'],
        human: map['human']
    );
  }

  static List<ReleaseDate> listFromMapList(List<dynamic> mapList) {
    if (mapList == null) {
      return new List<ReleaseDate>();
    }

    return mapList.map((m) => fromMap(m)).toList();
  }

}