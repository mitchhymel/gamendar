part of gamendar;

class AssetHelper {
  static final String ImagePlaceholderPath = 'assets/img/placeholder.png';

  static String getImageUrlFromGame(Game game) {
    if (game.cover == null) {
      return null;
    }

    return game.cover.getImageUrl(IGDBImageSizes.HD720P, isRetina: true);
  }
}