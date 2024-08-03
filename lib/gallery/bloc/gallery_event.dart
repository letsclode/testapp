// gallery_event.dart
import 'package:my_app/camera/model/image_model.dart';


abstract class GalleryEvent {}

class LoadGallery extends GalleryEvent {}

class AddImage extends GalleryEvent {
  final ImageModel image;

  AddImage(this.image);
}
