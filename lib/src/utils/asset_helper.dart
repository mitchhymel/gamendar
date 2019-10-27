part of gamendar;

class AssetHelper {
  static final String ImagePlaceholderPath = 'assets/img/placeholder.png';

  static String getImageUrlFromGame(Game game) {
    return getImageUrlFromImage(game.cover);
  }

  static String getImageUrlFromImage(ImageModel image) {
    if (image == null || image.imageId == null) {
      return null;
    }

    return IGDBHelpers.getImageUrl(image.imageId, IGDBImageSizes.HD720P,
      isRetina: true);
  }
}