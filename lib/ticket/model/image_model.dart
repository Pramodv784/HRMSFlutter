class ImageModel{
   String _imageName;
  String _imageUrl;

   ImageModel(this._imageName, this._imageUrl);

  String get imageName => _imageName;

  set imageName(String value) {
    _imageName = value;
  }

   String get imageUrl => _imageUrl;

  set imageUrl(String value) {
    _imageUrl = value;
  }
}