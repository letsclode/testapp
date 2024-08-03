// gallery_state.dart
import 'package:my_app/camera/model/image_model.dart';



abstract class GalleryState {}

class GalleryInitial extends GalleryState {}

class GalleryLoading extends GalleryState {}

class GalleryLoaded extends GalleryState {
  final List<ImageModel> images;

  GalleryLoaded({required this.images});
}
