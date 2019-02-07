part of gamendar;

class ImageModel {
  final String url;
  final String imageId;
  final int width;
  final int height;

  ImageModel({
    this.url,
    this.imageId,
    this.width,
    this.height
  });

  static ImageModel fromMap(Map map) {
    if (map == null) {
      return null;
    }

    return new ImageModel(
        url: map['url'],
        imageId: map['image_id'],
        width: map['width'],
        height: map['height']
    );
  }

  static List<ImageModel> listFromMapList(List<dynamic> maps) {
    if (maps == null) {
      return new List<ImageModel>();
    }

    return maps.map((map) => fromMap(map)).toList();
  }
}
