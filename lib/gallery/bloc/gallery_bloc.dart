// gallery_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/app/repository/camera_repository.dart';
import 'package:my_app/camera/model/image_model.dart';
import 'package:my_app/gallery/bloc/gallery_event.dart';
import 'package:my_app/gallery/bloc/gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  GalleryBloc({required this.cameraRepository}) : super(GalleryInitial()) {
    on<LoadGallery>(_onLoadGallery);
    on<AddImage>(_onAddImage);
  }

  void _onLoadGallery(LoadGallery event, Emitter<GalleryState> emit) async{
    emit(GalleryLoading());
    // Load images logic here
    // For demonstration, let's assume images is a list of ImageModel
    List<String> storedImagesPath = await cameraRepository.getAll();
    final images = storedImagesPath.isNotEmpty ? <ImageModel>[...storedImagesPath.map((imagePath) => ImageModel(path: imagePath))] : <ImageModel>[]; // Replace with actual loading logic
    emit(GalleryLoaded(images: images));
  }

  void _onAddImage(AddImage event, Emitter<GalleryState> emit) async{
    if (state is GalleryLoaded){
      await cameraRepository.saveImage(imagePath: event.image.path);
      final updatedImages =
          List<ImageModel>.from((state as GalleryLoaded).images)
            ..add(event.image);
      emit(GalleryLoaded(images: updatedImages));
    }
  }
    final CameraRepository cameraRepository;
}
