// pages/camera_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_app/camera/model/image_model.dart';
import 'package:my_app/gallery/bloc/gallery_bloc.dart';
import 'package:my_app/gallery/bloc/gallery_event.dart';


class CameraPage extends StatelessWidget {
  CameraPage({super.key});

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Camera')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final XFile? image = await _picker.pickImage(source: ImageSource.camera);
            if (image != null) {
              final imageModel = ImageModel(path: image.path);
              context.read<GalleryBloc>().add(AddImage(imageModel));
            }
          },
          child: Text('Capture Image'),
        ),
      ),
    );
  }
}
